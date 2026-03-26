" yaml_sort.vim - Recursively sort YAML keys alphabetically
"
" Usage:
"   :SortYaml    - Sort all keys (case-insensitive)
"   :SortYaml!   - Sort all keys (case-sensitive)
"
" Only map keys are sorted; list order is preserved.
" Comments directly above a key travel with that key.
" Block scalars (| / >) are never recursed into.
"
" Requires Vim 8+ (uses lambdas).

if exists('g:loaded_yaml_sort')
  finish
endif
let g:loaded_yaml_sort = 1

function! s:GetIndent(line) abort
  let l:i = match(a:line, '\S')
  return l:i < 0 ? 999 : l:i
endfunction

function! s:IsKeyLine(line, indent) abort
  if s:GetIndent(a:line) != a:indent
    return 0
  endif
  let l:s = strpart(a:line, a:indent)
  if l:s =~# '^"[^"]*"\s*:' || l:s =~# "^'[^']*'\\s*:"
    return 1
  endif
  return l:s =~# '^[^#\-{[>|&*! ].\{-}:\(\s\|$\)'
endfunction

function! s:ExtractKey(line) abort
  let l:s = substitute(a:line, '^\s*', '', '')
  if l:s =~# '^"'
    return matchstr(l:s, '^"\zs[^"]*\ze"')
  elseif l:s =~# "^'"
    return matchstr(l:s, "^'\\zs[^']*\\ze'")
  endif
  return matchstr(l:s, '^.\{-}\ze:\(\s\|$\)')
endfunction

function! s:FindChildIndent(lines) abort
  for l:line in a:lines
    let l:i = match(l:line, '\S')
    if l:i >= 0 && strpart(l:line, l:i) !~# '^#'
      return l:i
    endif
  endfor
  return -1
endfunction

function! s:HasKeysAtIndent(lines, indent) abort
  for l:line in a:lines
    if s:IsKeyLine(l:line, a:indent)
      return 1
    endif
  endfor
  return 0
endfunction

function! s:IsBlockScalar(keyline) abort
  return matchstr(a:keyline, ':\s*\zs\S.*$') =~# '^[|>]'
endfunction

function! s:SortBlock(lines, indent, case_sensitive) abort
  if empty(a:lines) || !s:HasKeysAtIndent(a:lines, a:indent)
    return a:lines
  endif

  let l:key_pos = []
  let l:i = 0
  while l:i < len(a:lines)
    if s:IsKeyLine(a:lines[l:i], a:indent)
      call add(l:key_pos, l:i)
    endif
    let l:i += 1
  endwhile

  " For each key, scan backward to find attached comment/blank prefix lines
  let l:pfx_start = []
  for l:k in range(len(l:key_pos))
    let l:p = l:key_pos[l:k]
    while l:p > 0
      let l:prev = a:lines[l:p - 1]
      let l:pi = match(l:prev, '\S')
      if l:pi < 0 || (l:pi <= a:indent && strpart(l:prev, l:pi) =~# '^#')
        if l:k > 0 && l:p - 1 <= l:key_pos[l:k - 1]
          break
        endif
        let l:p -= 1
      else
        break
      endif
    endwhile
    call add(l:pfx_start, l:p)
  endfor

  let l:preamble = l:pfx_start[0] > 0 ? a:lines[0 : l:pfx_start[0] - 1] : []

  let l:blocks = []
  for l:k in range(len(l:key_pos))
    let l:prefix = l:pfx_start[l:k] < l:key_pos[l:k]
          \ ? a:lines[l:pfx_start[l:k] : l:key_pos[l:k] - 1] : []
    let l:cs = l:key_pos[l:k] + 1
    let l:ce = l:k + 1 < len(l:key_pos)
          \ ? l:pfx_start[l:k + 1] - 1
          \ : len(a:lines) - 1
    call add(l:blocks, {
          \ 'key': s:ExtractKey(a:lines[l:key_pos[l:k]]),
          \ 'prefix': l:prefix,
          \ 'keyline': a:lines[l:key_pos[l:k]],
          \ 'children': l:ce >= l:cs ? a:lines[l:cs : l:ce] : []
          \ })
  endfor

  let l:Cmp = a:case_sensitive
        \ ? {a, b -> a.key ==# b.key ? 0 : a.key ># b.key ? 1 : -1}
        \ : {a, b -> tolower(a.key) ==# tolower(b.key) ? 0
        \            : tolower(a.key) ># tolower(b.key) ? 1 : -1}
  call sort(l:blocks, l:Cmp)

  let l:result = copy(l:preamble)
  for l:b in l:blocks
    let l:result += l:b.prefix
    call add(l:result, l:b.keyline)
    let l:ci = s:FindChildIndent(l:b.children)
    if l:ci > a:indent && s:HasKeysAtIndent(l:b.children, l:ci)
          \ && !s:IsBlockScalar(l:b.keyline)
      let l:result += s:SortBlock(l:b.children, l:ci, a:case_sensitive)
    else
      let l:result += l:b.children
    endif
  endfor

  return l:result
endfunction

function! s:SortYaml(bang) abort
  let l:pos = getpos('.')
  let l:case_sensitive = !empty(a:bang)
  let l:lines = getline(1, '$')
  let l:result = s:SortBlock(l:lines, 0, l:case_sensitive)
  silent! %delete _
  call setline(1, l:result)
  call setpos('.', l:pos)
  echo 'YAML keys sorted' . (l:case_sensitive ? ' (case-sensitive)' : '') . '.'
endfunction

command! -bang SortYaml call s:SortYaml('<bang>')
