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
	if &readonly
		return 0 " false
	endif
	let avoid_filetypes = ["","help","qf","fugitive", "fugitiveblame", "git","gitcommit"]
	if index(avoid_filetypes, &filetype) >= 0
		return 0 " false
	endif
	let is_git_repository = system("git rev-parse --show-toplevel")
	return v:shell_error == 0
endfunction

" Directory fzf searches from: the git repository containing the working
" directory, or the working directory itself when outside a repository.
" Resolved on every call so it follows :cd rather than being fixed at startup.
function! FzfRoot()
	let root = trim(system("git rev-parse --show-toplevel"))
	return v:shell_error == 0 ? root : getcwd()
endfunction

" Fuzzy-find files under FzfRoot() and edit the selection.
function! FzfFiles()
	let root = FzfRoot()
	let source = 'fd --strip-cwd-prefix --hidden --follow --exclude ".git" --type f --base-directory=' . shellescape(root)
	let options = '--preview "bat --style=numbers --color=always --line-range :500 ' . root . '/{}"'
	let Sink = {file -> execute('edit ' . fnameescape(root . '/' . file))}
	call fzf#run(fzf#wrap({'source': source, 'sink': Sink, 'options': options}))
endfunction
