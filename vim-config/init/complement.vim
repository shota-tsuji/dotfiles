" AutoComplPopの設定
"let g:acp_enableAtStartup = 0
" Shellのように振る舞う
"set completeopt=menu,preview
:noremap \b cw\begin{<C-R>"}<CR>\end{<C-R>"}
"set completeopt=menuone,noinsert
set completeopt=menuone
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>" "補完表示時のEnterで改行をしない

" @effect: 補完ウィンドウ内選択，選択された文字の非入力，Enterでの確定と入力
"inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
"inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

" @effect: 補完ウィンドウの非表示，insert modeを抜けない
"inoremap <expr><Esc> pumvisible() ? "<C-e>" : "<Esc>"
