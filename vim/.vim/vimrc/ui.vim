""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file defines all UI related settings relevant to
" console only
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Select preferred color scheme
try
    colorscheme solarized
    let g:solarized_termtrans = 1
    let g:solarized_termcolors=16
"    let g:solarized_visibility = "high"
"    let g:solarized_contrast = "high"
"    let g:zenburn_transparent = 1
"    let g:zenburn_force_dark_Background = 1
"    let g:zenburn_high_Contrast=1
"    let g:zenburn_alternate_Visual = 1
"    let g:zenburn_unified_CursorColumn = 1
"    let g:zenburn_old_Visual = 1
catch
endtry
set background=dark
