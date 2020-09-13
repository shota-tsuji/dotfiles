if g:_is_plugged("lightline.vim")
	let g:indentLine_faster = 1
	nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
	let g:lightline = { 'colorscheme' : 'wombat', }
endif
