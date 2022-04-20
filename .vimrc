set nocompatible
syntax enable
filetype plugin indent on

" General Settings
set path+=**				" Searches current directory recursively
set hidden					" Needed to keep multiple buffers open
set nobackup				" No auto backups
set noswapfile				" No swap
set encoding=UTF-8
set t_Co=256				" Set if term supports 256 colors
set number					" Show line numbers
set showmatch				" Show matching brackets
set clipboard=unnamedplus	" Copy & Paste between vim and other programs
set linebreak
set ignorecase				" Do case insensitive matching
set smartcase				" Do smart case matching
set mouse=a					" Enable the mouse
set shiftwidth=4       	 	" One tab == four spaces. 
set tabstop=4             	" One tab == four spaces.
set softtabstop=4
set spelllang=en_us			" Default language for the spell check
set backspace=indent,eol,start

" Styling Settings
highlight Comment cterm=italic
highlight SpellBad ctermbg=Red ctermfg=Yellow
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE ctermbg=NONE
highlight SpellLocal cterm=Underline ctermbg=NONE

" Plugins
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Use release branch (recommend)
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
call plug#end()

" let g:ycm_use_clangd = 0

" vim & vim airline theme settings
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'base16_gruvbox'
" let NERDTreeHighlightCursorline = 0
" Vim Theme Settings
let g:gruvbox_contrast_dark='soft'
set background=dark
colorscheme gruvbox 
let NERDTreeHighlightCursorline=0

" Keybindings
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-q> :bd<CR>

" Auto Commands
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

