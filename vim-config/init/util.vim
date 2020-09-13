" :eなどでファイルを開く際に、フォルダが存在しない場合は自動生成
function! s:mkdir(dir, force)
	if !isdirectory(a:dir) && (a:force || input(printf('"%s" does not exist. Create? [y/N]',a:dir)) =~? '^y\%[es]$')
		call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
	endif
endfunction
"autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" vim起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
"autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
"function! s:ChangeCurrentDir(directory, bang)
"	if a:directory == ''
"		lcd %:p:h
"	else
"		execute 'lcd' . a:directory
"	endif
"	if a:bang == ''
"		pwd
"	endif
"endfunction

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
	execute 'source ' . s:local_vimrc
endif

"au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'firefox'
let g:previm_open_cmd = 'google-chrome'

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

" テンプレートファイル(拡張子ごとに設定)
" Adding Apr/29/2017
"autocmd BufNewFile *.py 0r ~/.vim/template/template.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
"autocmd BufNewFile *.c 0r ~/.vim/template/template.c setlocal tabstop=2 softtabstop=2 shiftwidth=2
"autocmd BufNewFile *.cpp 0r ~/.vim/template/template.cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2

"autocmd BufNewFile *.java 0r ~/.vim/template/template.java
" Load files
"autocmd BufNewFile,BufRead *.md setfiletype markdown
autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python %

augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
				\ exe "normal g'\"" | endif
augroup END
