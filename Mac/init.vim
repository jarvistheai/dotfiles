syntax enable

set nocompatible
set showcmd
" set guicursor=
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
"set splitbelow
set splitright
set cursorcolumn
set cursorline
set noignorecase
"map <esc> :noh<CR>

"Find and replace word under cursor
noremap <F4> *:%s///gc \| noh<left><left><left><left><left><left><left><left><left>

nnoremap <leader>/ /\<\><left><left>
nnoremap <leader>? /\<\><left><left>

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
set list
"Toggle set list on/off
noremap <F5> :set list!<CR>

call plug#begin()
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
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

let g:mapleader = "\<Space>"

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" RustFmt config
let g:rustfmt_autosave = 1

set updatetime=50
filetype plugin indent on
set laststatus=2

set colorcolumn=80

" Gruvbox colorscheme
"let g:gruvbox_contrast_dark = 'hard'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
"set background=dark
highlight Normal ctermbg=none guibg=none

highlight ColorColumn ctermbg=1 guibg=lightgrey

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo -S tee > /dev/null %

" insert new line in normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

"Nerdtree
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Emmet Leader key
let g:user_emmet_leader_key=','

" Emmet enable only for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ '
let g:airline_symbols.notexists = ' Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty=' ⚡'

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1
let g:airline_inactive_alt_sep=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"sudo save
command! -nargs=0 Sw w !sudo tee % > /dev/null

"Buffers
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

"Window switching
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
tnoremap <leader>h <C-\><C-n> :wincmd h<CR>
tnoremap <leader>j <C-\><C-n> :wincmd j<CR>
tnoremap <leader>k <C-\><C-n> :wincmd k<CR>
tnoremap <leader>l <C-\><C-n> :wincmd l<CR>

"Exit terminal mode
tnoremap <leader>q <C-\><C-n>

"Open terminal
nnoremap <leader>t :belowright 25sp term://zsh<CR>

"Resizing Window
nnoremap <Leader>] :vertical resize +5<CR>
nnoremap <Leader>[ :vertical resize -5<CR>
nnoremap <leader>} :resize +5<CR>
nnoremap <leader>{ :resize -5<CR>
nnoremap <leader>r :resize 30<CR>

"Splitting windows
noremap <Leader>- :<C-u>split<CR>
noremap <Leader>\ :<C-u>vsplit<CR>

" set statusline=
" set statusline+=\ %f
" set statusline+=\ %m
" set statusline+=%=
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\ [%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" set statusline+=\ 

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" souring the coc config file
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

"COC-Configuration and shortcuts
call SourceIfExists("~/.config/nvim/coc.vim")

command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

