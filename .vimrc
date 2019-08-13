set nocompatible
set number
set backspace=indent,eol,start
set mouse=a
set clipboard=unnamedplus,autoselectplus
set ttyfast
set t_Co=256

set noshowmode
set novisualbell
set noerrorbells

set wildmenu
set wildmode=full
set wildignore=*.o,*.in,*.navl,*.snm,*.pdf,*.dvi,*.ui,*.user,*~,*#*
set ruler
set laststatus=2
set stal=2

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

"
" airline options
"
let g:airline_detect_modified = 1
let g:airline#extensions#fugitiveline#enabled = 1
"let g:airline#extensions#tagline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0  
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
set ttimeoutlen=50
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline_theme='dark'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇ '
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'
