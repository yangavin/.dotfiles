" Set 'scrolloff' to 8
set scrolloff=8

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Change cursor style for different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Keymaps
let mapleader = " "
nnoremap <leader>qq :q<CR>
nnoremap <leader>e :Ex<CR>
