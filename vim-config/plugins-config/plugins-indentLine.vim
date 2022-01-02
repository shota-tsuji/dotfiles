let g:indentLine_char = '¦'
" print indentLine on tab. (1 space needs end of this setting 'set')
"set list listchars=tab:\¦\ 
set list listchars=tab:\┆\ 
" list objects which want not to print indentLine.
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']

" To edit markdown url-link, set conceal.
let g:indentLine_setConceal = 0
