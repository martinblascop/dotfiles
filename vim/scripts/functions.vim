function! CursorShape(mode)
	if a:mode == "beam"
		execute "silent !echo -ne '\e[5 q'"
	else
		execute "silent !echo -ne '\e[1 q'"
	endif
endfunction

function! BSkipQuickFix(command)
  let start_buffer = bufnr('%')
  execute a:command
  while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
    execute a:command
  endwhile
endfunction

function! SyntaxAttr()
	let synid = ""
	let guifg = ""
	let guibg = ""
	let gui   = ""

	let id1  = synID(line("."), col("."), 1)
	let tid1 = synIDtrans(id1)

	if synIDattr(id1, "name") != ""
		let synid = "group: " . synIDattr(id1, "name")
		if (tid1 != id1)
			let synid = synid . '->' . synIDattr(tid1, "name")
		endif
		let id0 = synID(line("."), col("."), 0)
		if (synIDattr(id1, "name") != synIDattr(id0, "name"))
			let synid = synid .  " (" . synIDattr(id0, "name")
			let tid0 = synIDtrans(id0)
			if (tid0 != id0)
				let synid = synid . '->' . synIDattr(tid0, "name")
			endif
			let synid = synid . ")"
		endif
	endif

	" Use the translated id for all the color & attribute lookups; the linked id yields blank values.
	if (synIDattr(tid1, "fg") != "" )
		let guifg = " guifg=" . synIDattr(tid1, "fg") . "(" . synIDattr(tid1, "fg#") . ")"
	endif
	if (synIDattr(tid1, "bg") != "" )
		let guibg = " guibg=" . synIDattr(tid1, "bg") . "(" . synIDattr(tid1, "bg#") . ")"
	endif
	if (synIDattr(tid1, "bold"     ))
		let gui   = gui . ",bold"
	endif
	if (synIDattr(tid1, "italic"   ))
		let gui   = gui . ",italic"
	endif
	if (synIDattr(tid1, "reverse"  ))
		let gui   = gui . ",reverse"
	endif
	if (synIDattr(tid1, "inverse"  ))
		let gui   = gui . ",inverse"
	endif
	if (synIDattr(tid1, "underline"))
		let gui   = gui . ",underline"
	endif
	if (gui != ""                  )
		let gui   = substitute(gui, "^,", " gui=", "")
	endif

	echohl MoreMsg
	let message = synid . guifg . guibg . gui
	if message == ""
		echohl WarningMsg
		let message = "<no syntax group here>"
	endif
	echo message
	echohl None
endfunction