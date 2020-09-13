
" release autogroup in MyAutuCmd
augroup MyAutoCmd autocmd!
augroup END

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let $PATH = "~/.pyenv/shims:".$PATH

" 構文チェック
syntax enable
set encoding=utf-8	" エンコーディング
set fileencodings=utf-8
"set fileencoding=UTF-8
"set termencoding=UTF-8
set scrolloff=5		" スクロールするときに下が見えるようにする

set noswapfile
set nowritebackup
set nobackup
set vb t_vb=	" ビープ音を消す
set novisualbell
set ruler		" 行・列の番号を右下に表示する
set nocompatible	" compatibleオプションをオフにする
set nostartofline	" 移動コマンドを使ったとき、行頭に移動しない
set matchpairs& matchpairs+=<:>	" 対応括弧に<と>のペアを追加

" クリップボードをデフォルトのレジスタとして指定する。後にYankRingを使うので、'unnamedplus'が存在しているかどうかで、設定を分ける必要がある
if has('unnamedplus')
	" set clipboard& clipboard+=unnamedplus
	set clipboard& clipboard+=unnamedplus,unnamed
else
	" set clipboard& clipboard+=unnamed
	set clipboard& clipboard+=unnamed
endif

set showmatch	" 対応括弧をハイライト表示する
set matchtime=3	" 対応括弧の表示秒数を3秒にする
set wrap		" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set textwidth=0	" 入力されているテキストの最大幅を無効化する
set shiftround	" インデントをshiftwidthの倍数に丸める
set infercase	" 補完の際に大文字小文字の区別しない
" 文字がない場所にもカーソルを移動できるようにする
"set virtualedit=all
set hidden		" 変更中のファイルでも、保存しないで他のファイルを表示
set switchbuf=useopen	" 新しく開く代わりにすでに開いてあるバッファを開く
set ignorecase	" 小文字の検索でも大文字も見つかるようにする
set smartcase	" ただし、大文字も含めた検索の場合はその通りに検索する
set incsearch	" インクリメンタルサーチをおこなう
:set hlsearch	" 検索結果をハイライト表示

set tabstop=4		" 画面上でタブ文字が占める幅
set shiftwidth=0	" 自動インデントでずれる幅
set noexpandtab		" タブ入力を複数の空白入力に置き換えない
set smarttab		" 行頭の余白内でTabを打ち込むと、shifthwidthの数だけインデントする
set softtabstop=-1	" 連続した空白に対してTab-keyやBackspace-keyでカーソルが動く幅
set autoindent		" 改行時に前の行のインデントを継続する
" autoindentと同様であるが、C構文を認識
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

set t_Co=256	" カラー設定
"colorscheme hybrid
colorscheme molokai

"let g:htbrid_reduced_contrast = 1
set background=dark
set number	" 行番号表示
set title	" タイトルをウィンドウ枠に表示
set undolevels=300
set history=10000	" コマンド・検索パターンの履歴
set iminsert=0		" IME設定
set imsearch=0
set imdisable

set laststatus=2	" ステータスライン
set cmdheight=1		" メッセージ表示欄
set gdefault	" 置換の時にgオプションをデフォルトで有効にする
set ruler		" カーソルが何行目の何列目に置かれているかを表示する
set showcmd	" コマンドを画面下に表示させる
set wildmenu	" タブ補完
set wildmode=list:full	"set wildmode=list:longest
set wrapscan	" 最後まで検索を終えたら、次の検索で先頭に移る

set whichwrap=b,s,h,l,<,>,[,]	" カーソルの回り込みができるようにする

set cindent
"set mouse=a
"set ttymouse=xterm2

" 行を強調表示
set cursorline

" 列を強調表示する
set cursorcolumn

"hi Comment ctermfg=lightgray
"highlight Comment ctermfg=green
"highlight Normal ctermfg=252 ctermbg=233
"highlight Normal guibg=NONE ctermbg=NONE

" コメントblue，選択行(light) gray
"highlight Normal ctermfg=blue ctermbg=gray

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
"==============================================================================

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

" make, grepなどのコマンド後に、自動的にQuickFixを開く
"autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
"autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

"NeoBundleLazy "thinca/vim-quickrun", {
"			\ "autoload": {
"			\	"mappings": [['nxo', '<Plug>(quickrun)']]
"			\ }}
"nmap <Leader>Q <Plug>(quickrun)
"let s:hooks = neobundle#get_hooks("vim-quickrun")
"function! s:hooks.on_source(bundle)
"	let g:quickrun_config = {
"				\ "*": {"runner": "remote/vimproc"},
"				\ }
"endfunction
"
"NeoBundle "scrooloose/syntastic", {
"			\ "build": {
"			\	"mac": ["pip install flake8", "npm -g install coffeelint"],
"			\	"unix": ["pip install flake8", "npm -g install coffeelint"],
"			\ }}
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"NeoBundleLazy "davidhalter/jedi-vim", {
"			\ "autoload": {
"			\	"filetypes": ["python", "python3", "djangohtml"],
"			\ },
"			\ "build": {
"			\	"mac": "pip install jedi",
"			\	"unix": "pip install jedi",
"			\ }}
"let s:hooks = neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
"	" jediにvimの設定を任せると'completeopt+=preview'するので、自動設定機能をOFFにして手動で設定を行う
"	let g:jedi#auto_vim_configuration = 0
"	" 補完の最初の項目が選択された状態だと使いにくいためオフにする
"	let g:jedi#popup_select_first = 0
"	" quickrunと被るため大文字に変更
"	let g:jedi#rename_command = '<Leader>R'
"	" gundoと被るため大文字に変更
"	let g:jedi#goto_command = '<Leader>G'
"	" docstringを表示しない
"	autocmd FileType python setlocal completeopt-=preview
"endfunction
"
"au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'firefox'
let g:previm_open_cmd = 'google-chrome'

"let vim_markdown_preview_github=2

" ハイライト色設定
"highlight Pmenu ctermbg=4
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4
" AutoComplPopの設定
"let g:acp_enableAtStartup = 0
" Shellのように振る舞う
"set completeopt=menu,preview
:noremap \b cw\begin{<C-R>"}<CR>\end{<C-R>"}

":source ~/.vim/vim-config/init/plugin-checker.vim

runtime! vim-config/init/*.vim
runtime! vim-config/plugins-config/*.vim
