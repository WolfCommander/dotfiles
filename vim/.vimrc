execute pathogen#infect()
let $PYTHONPATH='/usr/lib/python3.4/site-packages'	"for powerline
set laststatus=2

set ts=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

if has("audocmd")
	filetype on
	autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
endif

set wildmenu
set wildmode=longest,list
set showtabline=2

set autoindent

syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

hi Normal ctermbg=none

inoremap jj <ESC>
