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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

call vundle#end()           " required!
filetype plugin indent on   " required!

" Appearance
syntax on
if has('gui_running')
    set background=light
else
    set t_Co=16
    set background=dark
    " solarized options
    let g:solarized_termcolors = 16         " if using solarized for terminal colors, otherwise 256 (or comment out)
    "let g:solarized_visibility = "high"
    "let g:solarized_contrast = "high"
    let g:solarized_termtrans = 1           " for iterm2
endif
colorscheme solarized
highlight Comment cterm=italic
" if italics is not working, try this:
" the first character (^[) is an escape char: ctrl-V ESC
"set t_ZH=[3m
"set t_ZR=[23m

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

" programming setup
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set showmatch   " matching brackets
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

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