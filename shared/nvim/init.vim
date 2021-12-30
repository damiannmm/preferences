:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab
:set softtabstop=4
:set mouse=a
:set nowildmenu

call plug#begin()

Plug 'akinsho/toggleterm.nvim'
Plug 'ap/vim-css-color'
Plug 'dag/vim-fish'
Plug 'dkarter/bullets.vim'
Plug 'gelguy/wilder.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set encoding=UTF-8

if $unamer =~ 'WSL'
    set clipboard+=unnamedplus
    let g:clipboard = {
      \ 'name': 'win32yank-wsl',
      \ 'copy': {
      \     '+': 'win32yank -i --crlf',
      \     '*': 'win32yank -i --crlf',
      \ },
      \ 'paste': {
      \     '+': 'win32yank -o --lf',
      \     '*': 'win32yank -o --lf',
      \ },
      \ 'cache_enabled': 0,
      \ }

    inoremap <C-j> <Esc>o
endif

let g:airline_powerline_fonts = 1
let g:airline_theme = 'understated'

let g:rainbow_active = 1

let g:dashboard_custom_header = []
let g:dashboard_default_executive = 'fzf'

nnoremap <silent><C-f> :Rg<CR>

let g:VM_set_statusline = 0

let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
let g:VM_maps['Select All'] = '<C-A-g>'

let g:tagbar_width = 24
nnoremap <silent><C-p> :TagbarToggle<CR>

let g:NERDTreeWinSize = 24
nnoremap <silent><C-b> :NERDTreeToggle<CR>

autocmd TermEnter term://*toggleterm#*
  \ tnoremap <silent><C-j> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><C-j> <Cmd>exe v:count1 . "ToggleTerm size=8"<CR>
" inoremap <silent><C-j> <Esc><Cmd>exe v:count1 . "ToggleTerm size=8"<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <C-space>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<C-space>" :
  \ coc#refresh()

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<Tab>"

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

call wilder#setup({
  \ 'modes': [':', '/', '?'],
  \ 'next_key': '<Down>',
  \ 'previous_key': '<Up>',
  \ 'accept_key': '<Tab>',
  \ 'reject_key': '<Left>',
  \ })

call wilder#set_option('pipeline', [
  \ wilder#branch(
  \     wilder#cmdline_pipeline({
  \         'language': 'python',
  \         'fuzzy': 1,
  \     }),
  \     wilder#python_search_pipeline({
  \         'pattern': wilder#python_fuzzy_pattern(),
  \         'sorter': wilder#python_difflib_sorter(),
  \         'engine': 're',
  \     }),
  \ ),
  \ ])

call wilder#set_option('renderer', wilder#renderer_mux({
  \ ':': wilder#popupmenu_renderer({
  \     'highlighter': wilder#basic_highlighter(),
  \     'left': [' ', wilder#popupmenu_devicons()],
  \     'right': [' ', wilder#popupmenu_scrollbar()],
  \ }),
  \ '/': wilder#wildmenu_renderer(wilder#wildmenu_airline_theme({
  \     'highlights': {},
  \     'highlighter': wilder#basic_highlighter(),
  \ })),
  \ }))
