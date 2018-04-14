set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/base16-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'wincent/command-t'
" Plug 'tpope/projectionist'

" python settings
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-flake8'

" autocomplete
" Plug 'davidhalter/jedi-vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'ervandew/supertab'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()           " required!

" Appearance
let python_highlight_all=1
" set t_Co=256
set background=dark
" solarized options
let g:solarized_termcolors = 256         " if using solarized for terminal colors, otherwise 256 (or comment out)
let g:solarized_termtrans = 1           " for iterm2

colorscheme solarized
"h colorscheme base16-default-dark
let base16colorspace=256
" colorscheme base16-solarized-dark
highlight Comment cterm=italic
" if italics is not working, try this:
" the first character (^[) is an escape char: ctrl-V ESC
" set t_ZH=[3m
" set t_ZR=[23m

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
\ [%l/%L\ (%p%%)
set ruler
set visualbell

" search settings
set hlsearch
set ignorecase
set smartcase
" look ahead
set incsearch
" regex - \v so that \ is not required for all meta-syntax
"nnoremap / /\v
" use backspace to clear the hightlight search:
nnoremap <BS> :nohl<CR>

" backspace behavior - allow backspace previous to insert point
set backspace=indent,eol,start

" don't wrap lines by default
set nowrap

" command line completion
set wildmenu
" show partial commands in the last line
"set showcmd

" set encoding
set encoding=utf-8

" programming setup
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |
    \ set fileformat=unix

set foldmethod=indent
set foldlevelstart=1

" Searches for tags file in current folder and works its way up to
" root looking for one.
set tags=./tags;/

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>
map <Leader>nt :NERDTreeToggle<CR>

" Syntastic config
let g:syntastic_check_on_open=1

" flag unnecessary white space
" mpl: annoying
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ErrorMsg /\s\+$/
"
" Powerline
set laststatus=2

" tagbar
map <Leader>tb :TagbarToggle<CR>
