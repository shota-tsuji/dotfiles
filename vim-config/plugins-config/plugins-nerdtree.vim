" :h NERDTree-<CR>
if g:_is_plugged("nerdtree")
	" Open NERDTree with Ctrl+e
	"map <C-e> :NERDTreeToggle<CR>
	nnoremap <silent><C-e> :NERDTreeToggle<CR>
	" 隠しファイルをデフォルトで表示させる
	let NERDTreeShowHidden = 1

    let NERDTreeCustomOpenArgs = {'file':{'reuse': 'all', 'where': 't', 'keepopen':1, 'stay': 0}}

    " autocmd BufWinEnter * silent NERDTreeMirror
endif
