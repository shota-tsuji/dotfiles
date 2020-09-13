" 構文チェック
syntax enable
set encoding=utf-8	" エンコーディング
set fileencodings=utf-8

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

set showmatch	" 対応括弧をハイライト表示する
set matchtime=3	" 対応括弧の表示秒数を3秒にする
set infercase	" 補完の際に大文字小文字の区別しない
" 文字がない場所にもカーソルを移動できるようにする
"set virtualedit=all
set hidden		" 変更中のファイルでも、保存しないで他のファイルを表示
set switchbuf=useopen	" 新しく開く代わりにすでに開いてあるバッファを開く
set ignorecase	" 小文字の検索でも大文字も見つかるようにする
set smartcase	" ただし、大文字も含めた検索の場合はその通りに検索する
set incsearch	" インクリメンタルサーチをおこなう
:set hlsearch	" 検索結果をハイライト表示
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
" 行を強調表示
set cursorline
" 列を強調表示する
set cursorcolumn
