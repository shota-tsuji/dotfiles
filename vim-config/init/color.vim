" ハイライト色設定
"highlight Pmenu ctermbg=4
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4

"hi Comment ctermfg=lightgray
"highlight Comment ctermfg=green
"highlight Normal ctermfg=252 ctermbg=233
"highlight Normal guibg=NONE ctermbg=NONE

" コメントblue，選択行(light) gray
"highlight Normal ctermfg=blue ctermbg=gray

set t_Co=256	" カラー設定
"colorscheme hybrid
colorscheme molokai

"let g:htbrid_reduced_contrast = 1
set background=dark
set cindent
"set mouse=a
"set ttymouse=xterm2
highlight Comment ctermfg=lightblue

" To override colorscheme, load after used-colorscheme.
let g:InactiveBackGround = 'ctermbg=darkgray'
augroup ChangeBackGround
    autocmd!
    " フォーカスをcolorscheme 準拠に切り替え）
    " フォーカスを外した時（フォーカスしていないときの背景色に切り替え）
    ":autocmd FocusLost * execute('highlight Normal ' . g:InactiveBackGround)
    ":autocmd FocusLost * execute('highlight NonText '.g:InactiveBackGround)
    ":autocmd FocusLost * execute('highlight SpecialKey '.g:InactiveBackGround)
    ":autocmd FocusLost * execute('highlight EndOfBuffer '.g:InactiveBackGround)
    autocmd FocusLost * highlight Normal ctermbg=darkgray guibg=darkgray
    autocmd WinLeave * 'highlight Normal ctermbg=darkgray guibg=darkgray'
    "highlight Normal ctermbg=darkgray guibg=darkgray
augroup end
