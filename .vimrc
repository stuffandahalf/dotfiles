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

let uname = system('uname')
let arch = system('uname -a')
if uname == 'Darwin\n'
	if arch == 'aarch64\n'
		set runtimepath+=/opt/homebrew/opt/fzf
	elseif arch == 'amd64\n'
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

filetype plugin indent on
packadd! matchit

let mapleader = " "
nnoremap <leader>f :find *
nnoremap <leader>F :FZF<CR>
nnoremap <leader>g :grep -rni
nnoremap <leader>T :tabnew<CR>
nnoremap <leader>z :suspend<CR>

