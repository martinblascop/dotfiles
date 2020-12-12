let exit_number = stridx(system("uname"), "Linux")
if exit_number == 0
	autocmd VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
	autocmd VimLeave,InsertEnter * silent execute '!echo -ne "\e[5 q"' | redraw!
else
	autocmd VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q \e]12;\a"' | redraw!
	autocmd InsertEnter * silent execute '!echo -ne "\x1b[5 q \e]12;\#f50\a"' | redraw!
	autocmd VimLeave * silent execute '!echo -ne "\e[5 q"' | redraw!
endif
