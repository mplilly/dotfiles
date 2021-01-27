if &compatible
    " only set nocp when compatible is already set (avoid side-effects)
    set nocompatible
endif

if exists('*minpac#init')
    call minpac#init()
    " needed?
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('vim-jp/syntax-vim-ex', {'type': 'opt'})

    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
    call minpac#add('tpope/vim-vinegar', {'type': 'opt'})
    " call minpac#add('tpope/', {'type': 'opt'})
    "
    call minpac#add('christoomey/vim-tmux-navigator')

    call minpac#add('kien/ctrlp.vim')
    call minpac#add('wincent/command-t')
    call minpac#add('scrooloose/nerdtree')
    " call minpac#add('tpope/projectionist')

    " python settings
    call minpac#add('vim-scripts/indentpython.vim')
    call minpac#add('vim-scripts/taglist.vim')
    call minpac#add('majutsushi/tagbar')
    call minpac#add('nvie/vim-flake8')
    call minpac#add('ambv/black')

    " autocomplete
    call minpac#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
    if !has('nvim')
        " vim8 for deoplete
        call minpac#add('roxma/nvim-yarp')
        call minpac#add('roxma/vim-hug-neovim-rpc')
    endif
    call minpac#add('zchee/deoplete-jedi')

    call minpac#add('ervandew/supertab')

    call minpac#add('altercation/vim-colors-solarized')
    call minpac#add('jnurmine/Zenburn')
    call minpac#add('chriskempson/base16-vim')
    call minpac#add('itchyny/landscape.vim')
    call minpac#add('itchyny/lightline.vim')
endif

" minpac shortcuts
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" neovim python
let g:python3_host_prog = "~/.virtualenv/nvim/bin/python3"

" Appearance
let python_highlight_all=1
" base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" italics
highlight Comment cterm=italic
" if italics is not working, try this:
" the first character (^[) is an escape char: ctrl-V ESC
" set t_ZH=[3m
" set t_ZR=[23m

" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
" \ [%l/%L\ (%p%%)
set ruler
set visualbell
set noshowmode

" search settings
set hlsearch
set ignorecase
set smartcase
" look ahead
set incsearch
" regex - \v so that \ is not required for all meta-syntax
"nnoremap / /\v
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

" indenting, shift: ctrl-t, ctrl-d
set expandtab
set shiftwidth=4
set autoindent
set smartindent	
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

"autocmd BufWritePost *.py call Flake8()

" markdown 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" code completion
let g:deoplete#enable_at_startup=1
" let g:deoplete#disable_auto_complete=1

set foldmethod=indent
set foldlevelstart=5
set nofoldenable


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
" conflicts with <C-j>, <C-k> window movement
let g:NERDTreeMapJumpPrevSibling='<Nop>'
let g:NERDTreeMapJumpNextSibling='<Nop>'

" Powerline
set laststatus=2

" tagbar
map <Leader>tb :TagbarToggle<CR>

" command-t
map <Leader>b :CommandTBuffer<CR>
