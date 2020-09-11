
" release autogroup in MyAutuCmd
augroup MyAutoCmd autocmd!
augroup END

" 構文チェック
syntax enable
" エンコーディング
set encoding=utf-8
set fileencodings=utf-8
"set fileencoding=UTF-8
"set termencoding=UTF-8
" スクロールするときに下が見えるようにする
set scrolloff=5

set noswapfile
set nowritebackup
set nobackup
" ビープ音を消す
set vb t_vb=
set novisualbell
" 行・列の番号を右下に表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" クリップボードをデフォルトのレジスタとして指定する。後にYankRingを使うので、'unnamedplus'が存在しているかどうかで、設定を分ける必要がある
if has('unnamedplus')
	" set clipboard& clipboard+=unnamedplus
	set clipboard& clipboard+=unnamedplus,unnamed
else
	" set clipboard& clipboard+=unnamed
	set clipboard& clipboard+=unnamed
endif

" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効化する
set textwidth=0
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際に大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
"set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし、大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチをおこなう
set incsearch
" 検索結果をハイライト表示
:set hlsearch
" Adding Apr/07/2017
" 画面上でタブ文字が占める幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=0
" タブ入力を複数の空白入力に置き換えない
set noexpandtab
" 行頭の余白内でTabを打ち込むと、shifthwidthの数だけインデントする
set smarttab
" 連続した空白に対してTab-keyやBackspace-keyでカーソルが動く幅
set softtabstop=-1
" 改行時に前の行のインデントを継続する
set autoindent
" autoindentと同様であるが、C構文を認識
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" カラー設定
set t_Co=256
"colorscheme hybrid
colorscheme molokai

"let g:htbrid_reduced_contrast = 1
set background=dark
" 行番号表示
set number
" タイトルをウィンドウ枠に表示
set title
set undolevels=300
" コマンド・検索パターンの履歴
set history=10000
" IME設定
set iminsert=0
set imsearch=0
set imdisable
" ステータスライン
set laststatus=2
" メッセージ表示欄
set cmdheight=1
" 置換の時にgオプションをデフォルトで有効にする
set gdefault
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドを画面下に表示させる
set showcmd
" タブ補完
set wildmenu
"set wildmode=list:longest
set wildmode=list:full
" 最後まで検索を終えたら、次の検索で先頭に移る
set wrapscan

" カーソルの回り込みができるようにする
set whichwrap=b,s,h,l,<,>,[,]

set cindent
"set mouse=a
"set ttymouse=xterm2

" 行を強調表示
set cursorline

" 列を強調表示する
set cursorcolumn

" Adding Apr/06/2017
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



" Adding Apr/17/2017
augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
				\ exe "normal g'\"" | endif
augroup END
"==============================================================================





" マクロおよびキー設定=========================================================
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
inoremap fj <Esc>
inoremap jf <Esc>
cmap w!! w !sudo tee > /dev/null %
" ESCを二回押すことでハイライトを消す
"nmap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を*で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索時にジャンプした際に、検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" 行表示単位で行移動する
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
" 画面切り替え
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up> <C-w>-<CR>
nnoremap <S-Down> <C-w>+<CR>

nnoremap ; :
nnoremap : ;
"let mapleader = ","
"noremap \ ,
"noremap <Leader>h ^
"noremap <Leader>l $
"nnoremap <Leader>/ *
"nnoremap <F3> :noh<CR>
nnoremap <ESC><ESC> :nohl<CR>
noremap <Space>h ^
noremap <Space>l $
noremap <Space>/ *
noremap <Space>f <C-f>
noremap <Space>b <C-b>
noremap <Space>d <C-d>
noremap <Space>u <C-u>

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
" /{pattern}の入力中は'/'をタイプすると'\/'が入力される
" ?`pattern}の入力中は'?'をタイプすると'\?'を入力される
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" 表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
" インサードモードにおいても移動
"inoremap <c-d> <delete>
"inoremap <c-j> <down>
"inoremap <c-k> <up>
"inoremap <c-h> <left>
"inoremap <c-l> <right>
" Move left&right on Insert-mode. At first, default set <C-h> to empty.
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ESCキーの代わり
imap <C-j> <esc>
noremap! <C-j> <esc>

" <space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>

" make, grepなどのコマンド後に、自動的にQuickFixを開く
"autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
"autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

"==============================================================================



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
"
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
"
"
"NeoBundleLazy 'kana/vim-smartinput', {
"			\ "autoload": {"insert": 1}}
"let s:hooks = neobundle#get_hooks("vim-smartinput")
"function! s:hooks.on_source(bundle)
"	" 括弧内でのスペース入力
"	call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
"	call smartinput#define_rule({
"			\ 	'at'	: '(\%#)',
"			\	'char'	: '<Space>',
"			\	'input'	: '<Space><Space><Left>',
"			\	})
"	call smartinput#define_rule({
"			\	'at'	: '( \%# )',
"			\	'char'	: '<BS>',
"			\	'input'	: '<Del><BS>',
"			\	})
"	" 改行時に行末スペースの除去
"	call smartinput#define_rule({
"			\	'at'	: '\s\+\%#',
"			\	'char'	: '<CR>',
"			\	'input'	: "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
"			\	})
"	" C++で;を忘れないようにする
"	" call smartinput#define_rule({
"			\	'at'	: '\%(\<struct\>\|\<class\>\|\<enum\>\)\s*\w\+.*\%#',
"			\	'char'	: '{',
"			\	'input'	: '{};<Letf><Left>',
"			\	'filetype'	: ['cpp'],
"			\	})
"endfunction
"


" Adding Apr/05/2017
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'kana/vim-smartinput'
Plug 'miyakogi/seiya.vim'
Plug 'Yggdroot/IndentLine'
"Plug 'lervag/vimtex'
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
"Plug 'w0gn/vim-hybrid'
Plug 'plasticboy/vim-markdown'
"Plug 'kannokanno/previm'
"Plug 'tyru/open-browser.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'kannokanno/previm'
Plug 'tomasr/molokai'
call plug#end()

"Add Jan/04/2018
"au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'firefox'
let g:previm_open_cmd = 'google-chrome'

"let vim_markdown_preview_github=2

let s:plug = {
			\ "plugs": get(g:, 'plugs', {})
			\ }

function! s:plug.is_installed(name)
	return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction


if s:plug.is_installed("lightline.vim")
	let g:indentLine_faster = 1
	nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
	let g:lightline = { 'colorscheme' : 'wombat', }
endif

if s:plug.is_installed("neocomplete.vim")
	let g:acp_enableAtStartup = 0
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
				\'default' : '',
				\'vimshell' : $HOME.'/.vimshell_hist',
				\'scheme' : $HOME.'/.gosh_completions'
				\}

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w'
	
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
		" For no inserting <CR> key.
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	" Close popup by <Space>
	"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
	
	" Enable omni completion.
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	" options.
	"	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	"	inoremap <expr><C-g>	neocomplete#undo_completion()
	"	inoremap <expr><C-l>	neocomplete#complete_common_string()
	let g:neocomplete#max_list = 20	
endif

if s:plug.is_installed("nerdtree")
	" Open NERDTree with Ctrl+e
	map <C-e> :NERDTreeToggle<CR>
	" 隠しファイルをデフォルトで表示させる
	"let NERDTreeShowHidden = 1
endif

if s:plug.is_installed('vim-smartinput')
	call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
	call smartinput#define_rule({
			\ 	'at'	: '(\%#)',
			\	'char'	: '<Space>',
			\	'input'	: '<Space><Space><Left>',
			\	})
	call smartinput#define_rule({
			\	'at'	: '( \%# )',
			\	'char'	: '<BS>',
			\	'input'	: '<Del><BS>',
			\	})
	" 改行時に行末スペースの除去
	call smartinput#define_rule({
			\	'at'	: '\s\+\%#',
			\	'char'	: '<CR>',
			\	'input'	: "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
			\	})
	" C++で;を忘れないようにする
	call smartinput#define_rule({
			\	'at'	: '\%(\<struct\>\|\<class\>\|\<enum\>\)\s*\w\+.*\%#',
			\	'char'	: '{',
			\	'input'	: '{};<Letf><Left>',
			\	'filetype'	: ['cpp'],
			\	})
endif


if s:plug.is_installed('lervag/vimtex')
	"let b:did_vimtex_indent = 0
	"let b:did_inident = 0
endif
"let b:did_inident = 1

" Adding Apr/14/2017
" setting highlight-file for tex
let g:tex_conceal = ''

" ハイライト色設定
"highlight Pmenu ctermbg=4
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4
" AutoComplPopの設定
"let g:acp_enableAtStartup = 0
" Shellのように振る舞う
"set completeopt=menu,preview
" Adding Apr/28/2017
:noremap \b cw\begin{<C-R>"}<CR>\end{<C-R>"}

" Adding Mar/06/2017
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

