" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

nmap <C-_> <PLUG>NERDCommenterToggle

" Mappings:
" [count]<leader>cc |NERDCommenterComment|
"
" Comment out the current line or text selected in visual mode.
"
" [count]<leader>cn |NERDCommenterNested|
"
" Same as cc but forces nesting.
"
" [count]<leader>c<space> |NERDCommenterToggle|
"
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
"
" [count]<leader>cm |NERDCommenterMinimal|
"
" Comments the given lines using only one set of multipart delimiters.
"
" [count]<leader>ci |NERDCommenterInvert|
"
" Toggles the comment state of the selected line(s) individually.
"
" [count]<leader>cs |NERDCommenterSexy|
"
" Comments out the selected lines with a pretty block formatted layout.
"
" [count]<leader>cy |NERDCommenterYank|
"
" Same as cc except that the commented line(s) are yanked first.
"
" <leader>c$ |NERDCommenterToEOL|
"
" Comments the current line from the cursor to the end of line.
"
" <leader>cA |NERDCommenterAppend|
"
" Adds comment delimiters to the end of line and goes into insert mode between them.
"
" |NERDCommenterInsert|
"
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
"
" <leader>ca |NERDCommenterAltDelims|
"
" Switches to the alternative set of delimiters.
"
" [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
"
" Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
"
" [count]<leader>cu |NERDCommenterUncomment|
"
" Uncomments the selected line(s).
