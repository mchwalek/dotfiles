scriptencoding utf-8

" Gotta be first
set nocompatible

call plug#begin('~/.vim/plugged')

" ----- Making Vim look good ------------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----------------------------
Plug 'w0rp/ale'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" ----- Working with Git ----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-endwise'
Plug 'adelarsq/vim-matchit'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

set t_Co=256
" ----- altercation/vim-colors-solarized settings -----
set background=dark

" Set the colorscheme
colorscheme solarized

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste = 1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1

let g:rspec_command = "Dispatch rspec {spec}"

set listchars=tab:╶─,trail:·,extends:>,precedes:<
set list
hi SpecialKey ctermfg=7

set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase

map <silent> <c-p> :FZF<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>a :Dispatch rake<CR>
