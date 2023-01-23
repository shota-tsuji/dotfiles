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
let mapleader = ","
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

" 表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
" Move left&right on Insert-mode. At first, default set <C-h> to empty.
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" <space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>

" /{pattern}の入力中は'/'をタイプすると'\/'が入力される
" ?`pattern}の入力中は'?'をタイプすると'\?'を入力される
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" vim-anzu
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

" tab navigation
nnoremap gh :tabprev<CR>
nnoremap gl :tabnext<CR>

" [plugin(MRU)]
nnoremap m :MRU<CR>
" nnoremap q :q<CR>

augroup QfAutoCommands
    autocmd!

    " Auto-close quickfix window
    " autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
augroup END
