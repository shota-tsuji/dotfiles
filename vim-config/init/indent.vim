set wrap		" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set textwidth=0	" 入力されているテキストの最大幅を無効化する
set shiftround	" インデントをshiftwidthの倍数に丸める
set tabstop=4		" 画面上でタブ文字が占める幅
set shiftwidth=0	" 自動インデントでずれる幅
"set noexpandtab		" タブ入力を複数の空白入力に置き換えない
set expandtab
set smarttab		" 行頭の余白内でTabを打ち込むと、shifthwidthの数だけインデントする
set softtabstop=-1	" 連続した空白に対してTab-keyやBackspace-keyでカーソルが動く幅
"set autoindent		" 改行時に前の行のインデントを継続する
set noautoindent
" autoindentと同様であるが、C構文を認識
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
