" -------------------------------------------------------
" "Cassie" "    - A Vim color scheme
" -------------------------------------------------------

" Basic init
scriptencoding utf-8
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
syntax enable
set t_Co=256
let g:colors_name = "cassie"

" ----
" Functions; outputs the highlight strings
" ----

function! SetHi256(group, ...)
  let theme_string = 'hi! ' . a:group . ' '
  if strlen(a:1)
    let theme_string .= 'ctermfg=' . a:1 . ' '
  endif
  if strlen(a:2)
    let theme_string .= 'ctermbg=' . a:2 . ' '
  endif
  if a:0 >= 3 && strlen(a:3)
    let theme_string .= 'cterm=' . a:3 . ' '
  endif
  if a:0 >= 4 && strlen(a:4)
    let theme_string .= 'cterm=' . a:4
  endif
  execute theme_string
endfunction

function! SetHiLink(group, linkTo)
  let theme_string = 'hi! link ' . a:group . ' ' . a:linkTo
  execute theme_string
endfunction


" ----
" Define main color scheme properties
" ----

call SetHi256("Boolean", "145", "NONE", "NONE")

call SetHi256("Character", "248", "NONE", "NONE")

call SetHi256("Comment", "245", "NONE", "NONE")

call SetHi256("Conditional", "214", "NONE", "NONE")

call SetHi256("Constant", "98", "NONE", "bold")

call SetHi256("Cursor", "NONE", "146", "NONE")

call SetHi256("CursorColumn", "NONE", "236", "NONE")

call SetHi256("cursorim", "235", "60", "NONE")

call SetHi256("CursorLine", "NONE", "236", "NONE")

call SetHi256("Debug", "137", "NONE", "NONE")

call SetHi256("Define", "137", "NONE", "NONE")

call SetHiLink("Delimiter", "Function")

call SetHi256("DiffAdd", "108", "235", "bold", "reverse")

call SetHi256("DiffChange", "103", "235", "bold", "reverse")

call SetHi256("DiffDelete", "131", "235", "bold", "reverse")

call SetHi256("DiffText", "208", "235", "reverse", "reverse")

call SetHi256("Directory", "60", "NONE", "NONE")

call SetHi256("Error", "131", "235", "reverse")

call SetHiLink("ErrorMsg", "Error")

call SetHi256("Exception", "245", "NONE", "NONE")

call SetHi256("Float", "248", "NONE", "NONE")

call SetHi256("FoldColumn", "235", "248", "NONE")

call SetHiLink("Folded", "FoldColumn")

call SetHi256("Function", "68", "NONE", "NONE")

call SetHiLink("Identifier", "Function")

call SetHi256("IncSearch", "193", "25", "NONE")

call SetHi256("Search", "0", "222", "NONE")

call SetHi256("Include", "137", "NONE", "NONE")

call SetHi256("Keyword", "166", "NONE", "NONE")

call SetHi256("Label", "137", "NONE", "NONE")

call SetHi256("LineNr", "59", "234", "NONE")

call SetHi256("Macro", "137", "NONE", "NONE")

call SetHi256("MatchParen", "179", "NONE", "NONE")

call SetHi256("ModeMsg", "15", "235", "NONE")

call SetHi256("MoreMsg", "137", "NONE", "NONE")

call SetHi256("NonText", "238", "NONE", "NONE") "end of line charater

call SetHi256("Normal", "152", "232", "NONE")

call SetHi256("Number", "131", "NONE", "NONE")

call SetHi256("Operator", "60", "NONE", "NONE")

call SetHi256("PMenu", "236", "60", "NONE")

call SetHi256("PMenuSbar", "196", "239", "NONE")

call SetHi256("PMenuSel", "110", "60", "NONE")

call SetHi256("PMenuThumb", "NONE", "67", "NONE")

call SetHi256("PreCondit", "47", "NONE", "NONE")

call SetHi256("PreProc", "74", "NONE", "NONE")

call SetHi256("Repeat", "137", "NONE", "NONE")

call SetHi256("SignColumn", "235", "60", "NONE")

call SetHi256("Special", "137", "NONE", "NONE")

call SetHi256("SpecialChar", "137", "NONE", "NONE")

call SetHi256("SpecialComment", "137", "NONE", "NONE")

"tab character
call SetHi256("SpecialKey", "238", "NONE", "NONE")

call SetHi256("SpellBad", "138", "NONE", "underline")

call SetHiLink("SpellCap", "SpellBad")

call SetHiLink("SpellLocal", "SpellBad")

call SetHiLink("SpellRare", "SpellBad")

call SetHiLink("SpellRare", "SpellBad")

call SetHi256("Statement", "78", "NONE", "NONE")

call SetHi256("StatusLine", "191", "236", "NONE")

call SetHi256("StatusLineNC", "237", "237", "NONE")

call SetHi256("StorageClass", "60", "NONE", "NONE")

call SetHi256("String", "66", "NONE", "NONE")

call SetHi256("Structure", "60", "NONE", "NONE")

call SetHi256("TabLine", "245", "233", "NONE")

call SetHi256("TabLineFill", "235", "233", "NONE")

call SetHi256("TabLineSel", "154", "235", "bold")

call SetHi256("Tag", "137", "NONE", "NONE")

call SetHi256("Title", "189", "235", "NONE")

call SetHi256("Todo", "167", "NONE", "bold")

call SetHi256("Type", "33", "NONE", "NONE")

call SetHi256("Typedef", "60", "NONE", "NONE")

call SetHi256("Underlined", "189", "235", "underline")

call SetHi256("VertSplit", "59", "NONE", "NONE")

call SetHi256("Visual", "235", "189", "NONE")

call SetHi256("VisualNOS", "235", "189", "underline")

call SetHi256("WarningMsg", "248", "88", "NONE")

call SetHi256("WildMenu", "191", "236", "Underline")


" ----
" Language Specific
" ----

" JavaScript
call SetHi256("javaScriptBraces", "169", "NONE", "NONE")
call SetHiLink("javaScriptFunction", "Function")
call SetHiLink("javaScriptNumber", "Number")

" HTML
call SetHi256("htmlTag", "65", "NONE", "NONE")
call SetHiLink("htmlEndTag", "htmlTag")
call SetHiLink("htmlTagN", "htmlTag")

" Markdown
call SetHi256("markdownBold", "15", "NONE", "bold")
call SetHi256("markdownCodeBlock", "145", "59", "NONE")
call SetHiLink("markdownCodeDelimiter", "markdownCodeBlock")
call SetHi256("markdownH1", "78", "NONE", "NONE")
call SetHiLink("markdownH2", "markdownH1")
call SetHiLink("markdownH3", "markdownH1")
call SetHiLink("markdownH4", "markdownH1")
call SetHiLink("markdownH5", "markdownH1")
call SetHiLink("markdownH6", "markdownH1")
call SetHi256("markdownHeadingDelimiter", "78", "NONE", "bold")
call SetHiLink("markdownInlineCode", "markdownCodeBlock")
call SetHi256("markdownInlineDelimiter", "15", "NONE", "NONE")
call SetHi256("markdownItalic", "15", "NONE", "italic")
call SetHi256("markdownItemDelimiter", "47", "NONE", "bold")
call SetHi256("markdownLinkContainer", "60", "NONE", "NONE")
call SetHiLink("markdownLinkInText", "String")
call SetHiLink("markdownLinkText", "Number")
call SetHiLink("markdownLinkTextContainer", "markdownLinkContainer")
call SetHiLink("markdownLinkUrlContainer", "Function")
call SetHi256("markdownLinkUrl", "15", "NONE", "italic")
call SetHi256("markdownListItemAtLevel1", "108", "NONE", "NONE")
call SetHi256("markdownListItemAtLevel2", "65", "NONE", "NONE")
call SetHiLink("markdownRule", "Constant")
call SetHiLink("markdownTextContainer", "Function")
call SetHiLink("markdownUrlLinkInText", "markdownLinkUrl")
call SetHiLink("markdownXmlElement", "htmlTag")


" ----
" Plugin related colors
" ----



" ----
" Miscellaneous
" ----

" Sets the OverLength if in .vimrc: match OverLength /\%81v.\+/
call SetHi256("OverLength", "233", "59", "NONE")

" Fixes the yellow relative number
call SetHi256("CursorLineNr", "118", "NONE", "bold")

" ----
" Overwrite colors if alternative scheme is called
" ----

" PHP
" hi! link phpFunctions Function
" hi! link phpSuperglobal Identifier
" hi! link phpQuoteSingle StringDelimiter
" hi! link phpQuoteDouble StringDelimiter
" hi! link phpBoolean Constant
" hi! link phpNull Constant
" hi! link phpArrayPair Operator
" hi! link phpOperator Normal
" hi! link phpRelation Normal
hi! link   phpVarSelector Constant
hi! link   phpIdentifier Constant
hi! link   phpConstant  Constant
hi! link   phpCoreConstant  Constant
hi! link   phpComment Comment
hi! link   phpDocTags Keyword 
hi! link   phpDocCustomTags Keyword
hi! link   phpException Exception
hi! link   phpBoolean Boolean
hi! link   phpStorageClass  StorageClass
hi! link   phpSCKeyword StorageClass
hi! link   phpFCKeyword Define
hi! link   phpStructure Structure
hi! link   phpStringSingle  String
hi! link   phpStringDouble  String
hi! link   phpBacktick  String
hi! link   phpNumber  Number
hi! link   phpFloat Float
hi! link   phpMethods Function
hi! link   phpFunction Keyword
hi! link   phpBaselib Function
hi! link   phpRepeat  Repeat
hi! link   phpConditional Keyword
hi! link   phpLabel Label
hi! link   phpStatement Keyword 
hi! link   phpKeyword Keyword 
hi! link   phpType  Type
hi! link   phpInclude Include
hi! link   phpDefine Keyword 
hi! link   phpBackslashSequences SpecialChar
hi! link   phpBackslashDoubleQuote SpecialChar
hi! link   phpBackslashSingleQuote SpecialChar
hi! link   phpParent  Delimiter
hi! link   phpBrackets  Delimiter
hi! link   phpIdentifierConst Delimiter
hi! link   phpParentError Error
hi! link   phpOctalError  Error
hi! link   phpInterpSimpleError Error
hi! link   phpInterpBogusDollarCurley Error
hi! link   phpInterpDollarCurly1 Error
hi! link   phpInterpDollarCurly2 Error
hi! link   phpInterpSimpleBracketsInner String
hi! link   phpInterpSimpleCurly Delimiter
hi! link   phpInterpVarname Identifier
hi! link   phpTodo Keyword 
hi! link   phpDocTodo Keyword
hi! link   phpSpecialFunction Keyword
hi! link   phpRegionSync Keyword

hi! link   jsVarSelector Constant
hi! link   jsIdentifier Constant
hi! link   jsConstant  Constant
hi! link   jsCoreConstant  Constant
hi! link   jsComment Comment
hi! link   jsDocTags Keyword 
hi! link   jsDocCustomTags Keyword
hi! link   jsException Exception
hi! link   jsBoolean Boolean
hi! link   jsStorageClass  StorageClass
hi! link   jsSCKeyword StorageClass
hi! link   jsFCKeyword Define
hi! link   jsStructure Structure
hi! link   jsStringSingle  String
hi! link   jsStringDouble  String
hi! link   jsBacktick  String
hi! link   jsNumber  Number
hi! link   jsFloat Float
hi! link   jsMethods Function
hi! link   jsFunction Keyword
hi! link   jsBaselib Function
hi! link   jsRepeat  Repeat
hi! link   jsConditional Keyword
hi! link   jsScriptLabel Label
hi! link   jsStatement Keyword 
hi! link   jsKeyword Keyword 
hi! link   jsType  Type
hi! link   jsInclude Include
hi! link   jsDefine Keyword 
hi! link   jsvaScriptBackslashSequences SpecialChar
hi! link   jsvaScriptBackslashDoubleQuote SpecialChar
hi! link   jsBackslashSingleQuote SpecialChar
hi! link   jsParent  Delimiter
hi! link   jsBrackets  Delimiter
hi! link   jsIdentifierConst Delimiter
hi! link   jsParentError Error
hi! link   jsOctalError  Error
hi! link   jsInterpSimpleError Error
hi! link   jsInterpBogusDollarCurley Error
hi! link   jsInterpDollarCurly1 Error
hi! link   jsInterpDollarCurly2 Error
hi! link   jsInterpSimpleBracketsInner String
hi! link   jsInterpSimpleCurly Delimiter
hi! link   jsInterpVarname Identifier
hi! link   jsTodo Keyword 
hi! link   jsDocTodo Keyword
hi! link   jsSpecialFunction Keyword
hi! link   jsRegionSync Keyword
" ----
" Extra settings currently without values
" ----

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings --

" ----
" EoF
