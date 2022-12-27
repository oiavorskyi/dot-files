""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file defines all UI related settings relevant to
" console only
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fix color scheme compatibility
set termguicolors

" Select preferred color scheme
packadd! dracula
colorscheme dracula

" Enable syntax highlighting
syntax enable

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
