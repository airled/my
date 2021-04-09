execute pathogen#infect()
set number
syntax on
set expandtab
set shiftwidth=2
set softtabstop=2

filetype plugin indent on

let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
