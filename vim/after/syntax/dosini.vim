syn match  dosiniLabel    "^.\{-}\ze\s*=" nextgroup=dosiniNumber,dosiniValue contains=dosiniComment
syn match  dosiniValue    "=\zs.*" contains=dosiniComment
syn match  dosiniComment  "#.*"
