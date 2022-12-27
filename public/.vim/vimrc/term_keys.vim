""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings actual for teminal version of Vim only.
" Includes mappings for plugins as well
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix for vim not receiving proper keys for <S-arrow> or <C-arrow>
" When inside Tmux window
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
	map <Esc>[B <Down>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Path to the vimrcs directory under local vim config directory 
let myvimrt = fnamemodify(expand(split(&rtp, ',')[0] . "/vimrc/"), ":p:h")

" <leader>ev opens new split with .vimrc for edit
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>

" <leader>eb opens new split with base Vim configuration for edit
nnoremap <silent> <leader>eb :vsplit <C-r>=myvimrt . "/base.vim"<cr><cr>

" <leader>es opens new split with shared key mappings for edit
nnoremap <silent> <leader>es :vsplit <C-r>=myvimrt . "/shared_keys.vim"<cr><cr>

" <leader>et opens new split with terminal Vim key mappings for edit
nnoremap <silent> <leader>et :vsplit <C-r>=myvimrt . "/term_keys.vim"<cr><cr>

" <leader>eu opens new split with terminal UI configuration for edit
nnoremap <silent> <leader>eu :vsplit <C-r>=myvimrt . "/ui.vim"<cr><cr>

" <leader>sv reloads the .vimrc file
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:nohl<cr>

" List current key mappings in normal mode (use when forget my config)
nnoremap <leader>lk :nmap<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation between buffers and splits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigate between open buffers similarly to Tmux navigation between windows
nnoremap <silent> <C-n> :bnext<cr>
nnoremap <silent> <C-p> :bprev<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command line enhancements and commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Make <Ctrl-p> and <Ctrl-n> behave like <Up> and <Down> on command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle for numbers display and line highlight
nmap <F2> :set number!<cr>:set relativenumber!<cr>:set cursorline!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle NERDTree panel on and off
nmap <leader>n :NERDTreeToggle<cr>

