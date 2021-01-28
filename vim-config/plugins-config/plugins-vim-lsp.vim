" golang
"let g:completor_gocode_binary = '/home/shota/Work/bin/gocode'
let g:completor_auto_trigger = 1
"inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
function! Tab_Or_Complete() abort
	if pumvisible()
		return "\<C-N>"
		"return "\<Down>"
	elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
		return "\<C-R>=completor#do('complete')"
	else
		return "\<Tab>"
	endif
endfunction
inoremap <expr><Tab> Tab_Or_Complete()

if executable('golsp')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif
