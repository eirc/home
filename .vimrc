scriptencoding utf-8

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'carlobaldassi/ConqueTerm'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Colors
syntax on
colorscheme darkblue
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

" Shamelessly stolen from https://gist.github.com/tejr/5890634
"
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif
