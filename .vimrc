set encoding=utf-8
scriptencoding utf-8

" Gotta be first
set nocompatible

source ~/.plugins_vimrc

" --- General settings ---
set backspace=indent,eol,start
set completeopt=longest,menuone
set ruler
set number
set showcmd
set incsearch
set wildmenu

syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------
" ----- altercation/vim-colors-solarized settings -----
set background=dark

" Set the colorscheme
let g:solarized_termtrans = 1
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

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    autocmd FileType cs nnoremap <buffer> <Leader>os <Nop>
    autocmd FileType cs nnoremap <buffer> <Leader>oscf :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>osfm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>osfs :OmniSharpFindSymbol<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> <Leader>osfd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>ospd :OmniSharpPreviewDefinition<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>osfi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>osfu :OmniSharpFindUsages<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>osdc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>osrn :OmniSharpRename<CR>
augroup END
