augroup vim-anzu
    " 一定時間キー入力がないとき，ウィンドウを移動したとき，タブを移動したときに
    " 検索ヒット数の表示を消去する
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
