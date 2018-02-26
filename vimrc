set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-jdaddy' " for json formatting
"Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
" check out the new powerline project
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
" for python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'Valloric/YouCompleteMe'
"Plugin taglist
call vundle#end()
filetype plugin indent on

" Appearance
let python_highlight_all=1
syntax on
if has('gui_running')
    set background=light
    set lines=50 columns=95
    let g:solarized_termcolors = 256
else
    set t_Co=256
    set background=dark
    " solarized options
    let g:solarized_termcolors = 256         " if using solarized for terminal colors, otherwise 256 (or comment out)
    "let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
    let g:solarized_termtrans = 1           " for iterm2
endif
colorscheme solarized
highlight Comment cterm=italic
" if italics is not working, try this:
" the first character (^[) is an escape char: ctrl-V ESC
set t_ZH=[3m
set t_ZR=[23m

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
\ [%l/%L\ (%p%%)
set ruler
set visualbell

" code folding
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
set foldlevelstart=20

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
    \ set fileformat=unix
au BufNewFile,BufRead *.c
    \ set tabstop=4 |
    \ set softtabstop=0 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix

" Searches for tags file in current folder and works its way up to
" root looking for one.
set tags=./tags;/

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Syntastic config
let g:syntastic_check_on_open=1

" flag unnecessary white space
" mpl: annoying
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ErrorMsg /\s\+$/
"
" Powerline
set laststatus=2

" SimpylFold config
let g:SimpylFold_docstring_preview=1

" YouCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion=1
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
