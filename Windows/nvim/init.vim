:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'ap/vim-css-color'
Plug 'dkarter/bullets.vim'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'tc50cal/vim-terminal'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized_flood'
