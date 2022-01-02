" :h NERDTree-<CR>
if g:_is_plugged("nerdtree")
	" Open NERDTree with Ctrl+e
	"map <C-e> :NERDTreeToggle<CR>
	nnoremap <silent><C-e> :NERDTreeToggle<CR>
	" 隠しファイルをデフォルトで表示させる
	let NERDTreeShowHidden = 1

    let NERDTreeCustomOpenArgs = {'file':{'reuse': 'all', 'where': 't', 'stay': 1}}

    " autocmd BufWinEnter * silent NERDTreeMirror
endif
