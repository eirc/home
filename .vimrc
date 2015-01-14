scriptencoding utf-8

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'ruby-matchit'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'haya14busa/incsearch.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Colors
syntax on
set background=light
colorscheme solarized
set hlsearch

" Tabs
set expandtab
set tabstop=4
set softtabstop=2
set shiftwidth=2

" Code settings
set autoindent
set smartindent
set showmatch
set cursorline
set ruler
"set relativenumber
set number
set scrolloff=8

" Highligh special characters
set list
set lcs=tab:⫦—,nbsp:.,trail:.,extends:▸,precedes:◂

" File settings
set backup
set autoread
set backspace=indent,eol,start
set encoding=UTF8
"set bin
set noeol
set hidden

" Commands
set history=50
set showcmd
set incsearch
set ignorecase
set smartcase
set wildmenu

" alias common write and quit commands to case insensitive variants
command! W w
command! Wq wq
command! WQ wq
command! Q q

" Disable arrow keys!
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" map double esc to clear search highlight
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" Add matchit plugin for more than one char matches
runtime macros/matchit.vim

" NERDTree
" How can I open a NERDTree automatically when vim starts up if no files were specified?
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show hidden files by default
let NERDTreeShowHidden = 1
" Hide vim swp files
let NERDTreeIgnore = ['\.swp$', '\~$', '\.DS_Store']

map <Leader>t :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" CTRLP
" Find hidden files
let g:ctrlp_show_hidden = 1
" Smart fast ctrlp command https://github.com/kien/ctrlp.vim/issues/273
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" incsearch plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Use old regexp engine because new one is very slow for ruby files
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set regexpengine=1

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
