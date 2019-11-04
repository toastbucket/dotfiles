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

set listchars=tab:\|-,nbsp:_,space:_
set list

colorscheme maxcolors

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

" Mode map
let g:airline_mode_map = {
            \ '__' : '--',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'VL',
            \ '' : 'VB',
            \ 's'  : 'S',
            \ 'S'  : 'SL',
            \ 't'  : 'T',
            \ }

"
" YouCompleteMe options
"
let g:ycm_show_diagnostics_ui=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_echo_current_diagnostic=0
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_confirm_extra_conf=0
let g:ycm_auto_trigger=0
let g:ycm_keep_logfiles=0
let g:ycm_cache_omnifunc=0
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_use_clangd = 1
let g:ycm_clangd_uses_ycmd_caching = 1
let g:ycm_clangd_args = ['--background-index', '--all-scopes-completion', '--suggest-missing-includes']

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

"
" FZF options
"
let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'down': '~15%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

"
" FZF colors
"
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Number'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Type'],
  \ 'fg+':     ['fg', 'Statement', 'Special', 'Type'],
  \ 'bg+':     ['bg', 'CursorLine', 'Normal'],
  \ 'hl+':     ['fg', 'type'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Type'],
  \ 'spinner': ['fg', 'Typedef'],
  \ 'header':  ['fg', 'Type']
  \ }

"
" gutentags options
"
let g:gutentags_enabled = 1
let g:gutentags_modules = ['ctags']
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_background_update = 1
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_auto_set_tags = 1
let g:gutentags_plus_nomap = 1

"
" install vim-plug
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/youcompleteme', {'do': 'TERM=xterm ./install.py --clangd-completer ' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'vim-scripts/seetab'
Plug 'shougo/echodoc.vim'

call plug#end()
