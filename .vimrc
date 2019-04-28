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

set ignorecase
set smartcase

set incsearch
set hlsearch

autocmd Filetype python setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype haskell setlocal ts=2 softtabstop=2 sw=2 expandtab
" auto remove trailing spaces
" auto run prettier on js files
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx PrettierAsync
"key re mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" line moves
nnoremap  ∆ :m .+1<CR>==
nnoremap  ˚ :m .-2<CR>==
inoremap  ∆ <Esc>:m .+1<CR>==gi
inoremap  ˚ <Esc>:m .-2<CR>==gi
vnoremap  ∆ :m '>+1<CR>gv=gv
vnoremap  ˚ :m '<-2<CR>gv=gv
" search related remapping
nnoremap <silent> <BS> :nohlsearch<CR>
nnoremap / /\v
nmap		 <C-p> :FZF<cr>

" set undo
if has('persistent_undo')
  set undofile
endif
set undodir=$HOME/.vim-undo-dir
set undolevels=5000
" gruvbox theme configs
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors = 16

" Nerd tree toggle
nmap <leader>h :NERDTreeToggle<CR>
"javascript specific setup
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:airline_powerline_fonts = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:flutter_command = '/Users/patrick/code/frameworks/flutter/bin/flutter'


let g:airline#extensions#tabline#enabled = 1
let g:jsx_ext_required = 0
" you complete me config
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
		 \}
" ctrl-p ignore for js
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|__screenshots__|__image_snapshots__ | \.(git))$',
      \ 'file': '\v\.(png|jpg|jpeg|svg)$',
      \ }

" download vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" plugin installations
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'idris-hackers/idris-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mileszs/ack.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
" reason ml plugin
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" for neovim
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"" for vim 8 with python
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"  " the path to python3 is obtained through executing `:echo exepath('python3')` in vim
"  let g:python3_host_prog = "/usr/local/bin/python3"
"endif
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
call plug#end()

" reason configs
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/patrick/code/reason/reason-language-server.exe'],
    \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1
