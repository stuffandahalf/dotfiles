set tabstop=4
set shiftwidth=4
set autoindent
set ruler
set number
set relativenumber
if hostname() =~ "^DST"
	set colorcolumn=120
else
	set colorcolumn=80
endif
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

" colorscheme evening with "amber" text
colorscheme evening
highlight Normal ctermfg=214

au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.inc set filetype=nasm
au BufReadPost,BufNewFile *.vue,*.html,*.templ set syntax=html expandtab tabstop=2 shiftwidth=2 foldmethod=indent colorcolumn=120
au BufReadPost,BufNewFile *.js set syntax=javascript expandtab tabstop=2 shiftwidth=2 foldmethod=indent colorcolumn=120 foldlevel=1
au BufReadPost,BufNewFile *.ts set syntax=typescript expandtab tabstop=2 shiftwidth=2 foldmethod=indent colorcolumn=120 foldlevel=1

let g:netrw_banner=0
filetype plugin indent on
packadd! matchit

let mapleader=" "
" utility remaps
nnoremap <leader>f :find *
nnoremap <leader>F :FZF<CR>
nnoremap <leader>g :grep --exclude-dir node_modules -rni <cword> .<CR>
vnoremap <leader>g y:grep --exclude-dir node_modules -rni "<C-r>"" .<CR>
nnoremap <leader>j :jumps<CR>
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qq :cclose<CR>
nnoremap <leader>t :$tabnew<CR>
nnoremap <leader>T :tabclose<CR>
nnoremap <leader>z :suspend<CR>

" tab quick switching
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>$ 1gtgT

" vertical pane creation
nnoremap <leader>v :Vex!<CR><C-w>=
nnoremap <leader>V :Vex<CR><C-w>=

" make comments
vnoremap <leader>cah s<!--<ESC>gpa--><ESC>
nnoremap <leader>cal :s/^\(\s*\)/\1\/\/ /<CR>
nnoremap <leader>crl :s/^\(\s*\)\/\/ \?/\1/<CR>
vnoremap <leader>cas s/*<ESC>gpa*/<ESC>
nnoremap <leader>cav :s/^/" /<CR>
nnoremap <leader>crv :s/^" //<CR>

" git shortcuts
nnoremap <leader>Gb :!git branch --show-current<CR>
nnoremap <leader>Gs :!git status<CR>
nnoremap <leader>GD :!git diff<CR>
nnoremap <leader>Gd :!git diff %<CR>
nnoremap <leader>Ga :!git add %<CR><CR>

