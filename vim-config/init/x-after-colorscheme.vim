" To override colorscheme, load after used-colorscheme.

let g:InactiveBackGround = 'ctermbg=darkgray'

augroup ChangeBackGround
    autocmd!
    " フォーカスをcolorscheme 準拠に切り替え）
    " フォーカスを外した時（フォーカスしていないときの背景色に切り替え）
    autocmd FocusLost * execute('hi Normal '.g:InactiveBackGround)
    autocmd FocusLost * execute('hi NonText '.g:InactiveBackGround)
    autocmd FocusLost * execute('hi SpecialKey '.g:InactiveBackGround)
    autocmd FocusLost * execute('hi EndOfBuffer '.g:InactiveBackGround)
augroup end
