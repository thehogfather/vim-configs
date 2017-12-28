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

" Nerd tree toggle
nmap <leader>h :NERDTreeToggle<CR>
"javascript specific setup
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:airline_powerline_fonts = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_column_always = 1

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:airline#extensions#tabline#enabled = 1
let g:jsx_ext_required = 0
" you complete me config
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
		 \}

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
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'scrooloose/nerdtree'
Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
call plug#end()


