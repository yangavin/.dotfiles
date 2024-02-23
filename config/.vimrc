" Move through wrapped line (not just \n)
map j gj
map k gk
" H and L to move to the end of line
map H g^
map L g$


" Syntax highlighting
syntax on

set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

let mapleader = " "
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
