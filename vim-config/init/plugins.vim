call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'miyakogi/seiya.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
"Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'kana/vim-smartinput'
Plug 'Yggdroot/indentLine'
Plug 'kovisoft/slimv'
Plug 'osyo-manga/vim-anzu'
Plug 'yegappan/mru'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
Plug 'chrisgrieser/nvim-origami'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/persistence.nvim'
Plug 'tpope/vim-fugitive'

call plug#end()

let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
