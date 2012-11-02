" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Colors
syntax on
colorscheme desert
set background=dark
set hlsearch

" Tabs
set expandtab
set softtabstop=2
set shiftwidth=2

" Code settings
set autoindent
set smartindent
set showmatch
"set cursorline
set ruler
set number
filetype indent on

" Highligh special characters
set list
set lcs=tab:⫦—,nbsp:.,trail:.,extends:▸,precedes:◂

" File settings
set backup
set autoread
set backspace=indent,eol,start
set encoding=UTF8
set bin
set noeol

" Commands
set history=50
set showcmd
set incsearch
set wildmenu

command W w
command Wq wq
command WQ wq
command Q q

