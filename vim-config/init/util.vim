" :eなどでファイルを開く際に、フォルダが存在しない場合は自動生成
function! s:mkdir(dir, force)
	if !isdirectory(a:dir) && (a:force || input(printf('"%s" does not exist. Create? [y/N]',a:dir)) =~? '^y\%[es]$')
		call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
	endif
endfunction
"autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
	execute 'source ' . s:local_vimrc
endif

"let vim_markdown_preview_github=2
"
" クリップボードをデフォルトのレジスタとして指定する。後にYankRingを使うので、'unnamedplus'が存在しているかどうかで、設定を分ける必要がある
if has('unnamedplus')
	" set clipboard& clipboard+=unnamedplus
	set clipboard& clipboard+=unnamedplus,unnamed
else
	" set clipboard& clipboard+=unnamed
	set clipboard& clipboard+=unnamed
endif

"autocmd BufNewFile *.java 0r ~/.vim/template/template.java
" Load files
"autocmd BufNewFile,BufRead *.md setfiletype markdown
"autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python %
"
"autocmd BufNewFile,BufRead *.asm set filetype=nasm
"autocmd BufNewFile,BufRead *.inc set filetype=nasm
"
"augroup vimrcEx
"	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
"				\ exe "normal g'\"" | endif
"augroup END
