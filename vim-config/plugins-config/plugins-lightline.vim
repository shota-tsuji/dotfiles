if g:_is_plugged("lightline.vim")
	let g:indentLine_faster = 1
	nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
	" let g:lightline = { 'colorscheme' : 'wombat', }
	let g:lightline = {
                \ 'colorscheme' : 'wombat',
                \ 'active': {
                \   'left': [
                \       ['mode', 'paste'],
                \       ['readonly', 'filename', 'modified', 'anzu']
                \   ]
                \ },
                \ 'component_function': {
                \   'anzu': 'anzu#search_status'
                \ }
                \ }
endif
