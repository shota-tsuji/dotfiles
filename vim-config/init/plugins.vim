call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'miyakogi/seiya.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'kannokanno/previm'
Plug 'previm/previm'
Plug 'tomasr/molokai'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'maralla/completor.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
"Plug 'cohama/lexima'

"Plug 'junegunn/vim-easy-align'
"Plug 'Shougo/neocomplete.vim'
Plug 'kana/vim-smartinput'
Plug 'Yggdroot/indentLine'
Plug 'kovisoft/slimv'
"Plug 'lervag/vimtex'
"Plug 'vim-latex/vim-latex'
"Plug 'lervag/vimtex'
"Plug 'w0gn/vim-hybrid'
"Plug 'kannokanno/previm'
"Plug 'tyru/open-browser.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
"Plug 'lambdalisue/vim-pyenv'
"if has('nvim')
"	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"	Plug 'Shougo/deoplete.nvim'
"	Plug 'roxma/nvim-yarp'
"	Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'obcat/vim-hitspop'
Plug 'osyo-manga/vim-anzu'
Plug 'yegappan/mru'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
call plug#end()

let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
