:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'ap/vim-css-color'
" Plug 'dag/vim-fish'
Plug 'dkarter/bullets.vim'
" Plug 'glepnir/dashboard-nvim'
" Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
" Plug 'neoclide/coc.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'tc50cal/vim-terminal'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set encoding=UTF-8

let g:dashboard_custom_header = []
let g:dashboard_default_executive = 'fzf'

nnoremap <C-b> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized_flood'

let g:rainbow_active = 1

let g:VM_set_statusline = 0

let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
let g:VM_maps['Select All'] = '<C-A-g>'

" use <C-space> for trigger completion and navigate to 
" the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <C-space> 
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<C-space>" :
	\ coc#refresh()
" inoremap <expr> <C-space> pumvisible() ? "\<C-n>" : "\<C-space>"
" inoremap <expr> <C-S-space> pumvisible() ? "\<C-p>" : "\<C-S-space>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm(): "\<Tab>"

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
