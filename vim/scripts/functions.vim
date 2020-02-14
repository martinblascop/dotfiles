"Change cursor shape from beam to bock
function! CursorShape(mode)
	if a:mode == "beam"
		execute "silent !echo -ne '\e[5 q'"
	else
		execute "silent !echo -ne '\e[1 q'"
	endif
endfunction

"Not show quickfix buffer when switching buffers
function! BSkipQuickFix(command)
  let start_buffer = bufnr('%')
  execute a:command
  while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
    execute a:command
  endwhile
endfunction

"Source file if exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
