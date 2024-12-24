filetype plugin indent on
set tabstop=4
set shiftwidth=4
set autoindent
set ruler
set number
set relativenumber
set colorcolumn=80
set re=0 "fix syntax timeout on mac
syntax on
set foldmethod=syntax
set foldlevel=99

au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.inc set filetype=nasm
au BufReadPost,BufNewFile *.vue,*.html set syntax=html expandtab tabstop=2 shiftwidth=2 foldmethod=indent
