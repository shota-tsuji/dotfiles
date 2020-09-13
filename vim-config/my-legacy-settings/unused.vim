" make, grepなどのコマンド後に、自動的にQuickFixを開く
"autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
"autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

"NeoBundleLazy "thinca/vim-quickrun", {
"			\ "autoload": {
"			\	"mappings": [['nxo', '<Plug>(quickrun)']]
"			\ }}
"nmap <Leader>Q <Plug>(quickrun)
"let s:hooks = neobundle#get_hooks("vim-quickrun")
"function! s:hooks.on_source(bundle)
"	let g:quickrun_config = {
"				\ "*": {"runner": "remote/vimproc"},
"				\ }
"endfunction
"
"NeoBundle "scrooloose/syntastic", {
"			\ "build": {
"			\	"mac": ["pip install flake8", "npm -g install coffeelint"],
"			\	"unix": ["pip install flake8", "npm -g install coffeelint"],
"			\ }}
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"NeoBundleLazy "davidhalter/jedi-vim", {
"			\ "autoload": {
"			\	"filetypes": ["python", "python3", "djangohtml"],
"			\ },
"			\ "build": {
"			\	"mac": "pip install jedi",
"			\	"unix": "pip install jedi",
"			\ }}
"let s:hooks = neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
"	" jediにvimの設定を任せると'completeopt+=preview'するので、自動設定機能をOFFにして手動で設定を行う
"	let g:jedi#auto_vim_configuration = 0
"	" 補完の最初の項目が選択された状態だと使いにくいためオフにする
"	let g:jedi#popup_select_first = 0
"	" quickrunと被るため大文字に変更
"	let g:jedi#rename_command = '<Leader>R'
"	" gundoと被るため大文字に変更
"	let g:jedi#goto_command = '<Leader>G'
"	" docstringを表示しない
"	autocmd FileType python setlocal completeopt-=preview
"endfunction
