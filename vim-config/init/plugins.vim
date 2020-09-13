call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
"Plug 'Shougo/neocomplete.vim'
Plug 'kana/vim-smartinput'
Plug 'miyakogi/seiya.vim'
Plug 'Yggdroot/IndentLine'
"Plug 'lervag/vimtex'
"Plug 'vim-latex/vim-latex'
"Plug 'lervag/vimtex'
"Plug 'w0gn/vim-hybrid'
Plug 'plasticboy/vim-markdown'
"Plug 'kannokanno/previm'
"Plug 'tyru/open-browser.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'kannokanno/previm'
Plug 'tomasr/molokai'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'maralla/completor.vim'
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
"Plug 'lambdalisue/vim-pyenv'
"if has('nvim')
"	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"	Plug 'Shougo/deoplete.nvim'
"	Plug 'roxma/nvim-yarp'
"	Plug 'roxma/vim-hug-neovim-rpc'
"endif
call plug#end()
