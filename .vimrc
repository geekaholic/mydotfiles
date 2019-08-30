" Turn off annoying bell
set belloff=all

" Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

" Pathogen stuff (manage plugins)
execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Powerline alternative plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" Uncomment for powerline. make sure Font is installed
"set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
" Use set guifont? to check current font
" Use below font with gvim
set guifont=Source\ Code\ Pro\ Medium\ 11

" Nerdtree plugin map to ctrl n
map <C-n> :NERDTreeToggle<CR>

" Enable ag plugin for searching
let g:ag_prg="env ag --vimgrep"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Go lint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

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

" Set status line to display git
set statusline=%f%{fugitive#statusline()}%=%c,%l/%L\ %P
set laststatus=2

set background=dark

let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme slime-contrast
colorscheme vividchalk
set foldmethod=syntax
set foldlevelstart=20

match ErrorMsg '\s\+$'
set colorcolumn=80

setlocal omnifunc=syntaxcomplete#Complete

filetype plugin on
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd Filetype ruby,scss,haml,html,css,yml setlocal ts=2 sts=2 sw=2 expandtab

" xml formatting
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft 
  set ft= 
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d  
  $d  
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

let php_sql_query=1
let php_htmlInStrings=1

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
