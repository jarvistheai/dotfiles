syntax enable

set nocompatible
set showcmd
set noerrorbells
setglobal tabstop=4 softtabstop=4
setglobal shiftwidth=4
set expandtab
set smartindent
set nu
set linebreak
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set relativenumber
set scrolloff=25
set cmdheight=2
set nowrap
set hidden
set ruler
set shortmess+=c
set splitright
set cursorcolumn
set cursorline
set noignorecase
set completeopt=menuone,noselect,noinsert
set updatetime=50
set laststatus=2
set colorcolumn=80
set signcolumn=yes
filetype plugin indent on
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
set list

let g:mapleader = "\<Space>"

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
call plug#end()

source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/maps.vim
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/airline.vim

" RustFmt config
let g:rustfmt_autosave = 1

" Gruvbox colorscheme
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
"set background=dark
highlight Normal ctermbg=none guibg=none
highlight ColorColumn ctermbg=1 guibg=lightgrey
highlight CursorLineNr ctermbg=black
highlight CursorLine ctermbg=black
highlight CursorColumn ctermbg=black

" Emmet Leader key
let g:user_emmet_leader_key=','

" Emmet enable only for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
