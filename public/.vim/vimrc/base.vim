""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file define base options that affect all file types
" and could be shared both between console Vim and IdeaVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibility with Vi
set nocompatible

" Enable file types recognition
filetype plugin on

" Expand tabs to 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Make split behavior more usual for me
set splitbelow
set splitright

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
