" Turn off annoying bell
set belloff=all

syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set autoindent
set smartindent
" set noexpandtab
set expandtab
set nospell

" Turn of backup ~ files from being created
set nobackup
set nowritebackup

" Display | to show tabstops
set list
set listchars=tab:\|\ 

" Search related
set incsearch
set hlsearch
set ignorecase
set smartcase

" Bind tab switch keys
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>

set background=dark

set foldmethod=syntax
set foldlevelstart=20

match ErrorMsg '\s\+$'
set colorcolumn=80

" Map clipboard to yank
set clipboard+=unnamedplus
