"if s:plug.is_installed("neocomplete.vim")
"	let g:acp_enableAtStartup = 0
"	let g:neocomplete#enable_at_startup = 1
"	let g:neocomplete#enable_smart_case = 1
"	let g:neocomplete#sources#syntax#min_keyword_length = 3
"
"	" Define dictionary.
"	let g:neocomplete#sources#dictionary#dictionaries = {
"				\'default' : '',
"				\'vimshell' : $HOME.'/.vimshell_hist',
"				\'scheme' : $HOME.'/.gosh_completions'
"				\}
"
"	" Define keyword.
"	if !exists('g:neocomplete#keyword_patterns')
"		let g:neocomplete#keyword_patterns = {}
"	endif
"	let g:neocomplete#keyword_patterns['default'] = '\h\w'
"	
"	" Recommended key-mappings.
"	" <CR>: close popup and save indent.
"	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"	function! s:my_cr_function()
"		return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"		" For no inserting <CR> key.
"	endfunction
"	" <TAB>: completion.
"	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"	"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"	" Close popup by <Space>
"	"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"	
"	" Enable omni completion.
"	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"	" options.
"	"	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"	"	inoremap <expr><C-g>	neocomplete#undo_completion()
"	"	inoremap <expr><C-l>	neocomplete#complete_common_string()
"	let g:neocomplete#max_list = 20	
"endif
