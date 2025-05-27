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
set incsearch
" fuzzyish searching
set path+=**
set wildmenu

let uname = substitute(system('uname'), '\n', '', '')
let arch = substitute(system('uname -m'), '\n', '', '')
if uname ==? 'darwin'
	if arch ==? 'arm64'
		set runtimepath+=/opt/homebrew/opt/fzf
	elseif arch ==? 'amd64'
		set runtimepath+=/usr/local/opt/fzf
	endif
endif

"colorscheme darkblue
" colorscheme evening with "amber" text
colorscheme evening
highlight Normal ctermfg=214

au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.inc set filetype=nasm
au BufReadPost,BufNewFile *.vue,*.html set syntax=html expandtab tabstop=2 shiftwidth=2 foldmethod=indent colorcolumn=120
au BufReadPost,BufNewFile *.js set syntax=javascript expandtab tabstop=2 shiftwidth=2 foldmethod=indent colorcolumn=120 foldlevel=1
au BufReadPost,BufNewFile *.ts set syntax=typescript expandtab tabstop=2 shiftwidth=2 foldmethod=indent colorcolumn=120 foldlevel=1

let g:netrw_banner=0
filetype plugin indent on
packadd! matchit

let mapleader=" "
nnoremap <leader>f :find *
nnoremap <leader>F :FZF<CR>
nnoremap <leader>g :grep -rni
nnoremap <leader>T :tabnew<CR>
nnoremap <leader>z :suspend<CR>
" tab quick switching
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

