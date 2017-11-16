execute pathogen#infect()
set bg=dark
syntax on
filetype on
filetype plugin indent on
let mapleader = " "
let maplocalleader = "\\"
set showmode
set number "show line numbers
set relativenumber
set showcmd "shows command in bottom bar
set cursorline "highlights the current line
set wildmenu
set showmatch
colorscheme gruvbox

set noswapfile

set shiftwidth=2
set softtabstop=2
set tabstop=2
set encoding=utf-8

set splitbelow
set splitright

autocmd Filetype python setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
" auto remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
"key re mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap		 <C-p> :FZF<cr>
"javascript specific setup
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:airline_powerline_fonts = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_column_always = 1

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:airline#extensions#tabline#enabled = 1

" enable autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
