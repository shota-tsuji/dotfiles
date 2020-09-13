":source ~/.vim/vim-config/init/plugin-checker.vim

"let s:plug = {
"			\ "plugs": get(g:, 'plugs', {})
"			\ }
"
"function! s:plug.is_installed(name) "関数の再定義：
"	return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
"endfunction

"if s:plug.is_installed("lightline.vim")
	let g:indentLine_faster = 1
	nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
	let g:lightline = { 'colorscheme' : 'wombat', }
"endif
