" release autogroup in MyAutuCmd
augroup MyAutoCmd autocmd!
augroup END

"let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
"let $PATH = "~/.pyenv/shims:".$PATH


" AutoComplPopの設定
"let g:acp_enableAtStartup = 0
" Shellのように振る舞う
"set completeopt=menu,preview
:noremap \b cw\begin{<C-R>"}<CR>\end{<C-R>"}

runtime! vim-config/init/*.vim
runtime! vim-config/plugins-config/*.vim
