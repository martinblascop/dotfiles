" Change cursor shape from beam to bock
function! CursorShape(mode)
	if a:mode == "beam"
		execute "silent !echo -ne '\e[5 q'"
	else
		execute "silent !echo -ne '\e[1 q'"
	endif
endfunction

" Not show quickfix buffer when switching buffers
function! BSkipQuickFix(command)
	let start_buffer = bufnr('%')
	execute a:command
	while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
	execute a:command
	endwhile
endfunction

" Source file if exists
function! SourceIfExists(file)
	if filereadable(expand(a:file))
		exe 'source' a:file
	endif
endfunction

" Toggle dash to iskeyword config
function! ToggleDashKeyword()
	if  match(&iskeyword, ',-') > 0
		set iskeyword-=-
		echo 'dash not included'
	else
		set iskeyword+=-
		echo 'dash included'
	endif
endfunction

function! FileInRepository()
	if &filetype == '' || &filetype == 'fugitive'
		return 0 " false
	endif
	let is_git_repository = system("git rev-parse --show-toplevel")
	return v:shell_error == 0
endfunction
