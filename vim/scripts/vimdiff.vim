"Only for vimdiff
if &diff
	map ] ]c
	map [ [c
	hi DiffAdd    cterm=bold cterm=reverse ctermfg=108 ctermbg=235
	hi DiffChange cterm=bold cterm=reverse ctermfg=103 ctermbg=235
	hi DiffDelete cterm=bold cterm=reverse ctermfg=131 ctermbg=235
	hi DiffText   cterm=reverse cterm=reverse ctermfg=208 ctermbg=235
endif
