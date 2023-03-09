""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defines common key mappings that could be used both by
" Vim and by IdeaVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" We need to set it up before sourcing any other files
let mapleader = " "
let g:mapleader = " "

" Remove highlighting from search results
nnoremap <silent> <leader><cr> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and splits management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Resize window size with Shift+arrow
map <S-up>    <C-w>-
map <S-down>  <C-w>+
map <S-left>  3<C-w>>
map <S-right> 3<C-w><

" Quick vertical split
nmap vv <C-w>v

" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Split line at the cursor with K
" nmap K i<cr><esc>
