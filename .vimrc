" Vundle Set Up!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"" The Basics
let mapleader=","
syntax on
filetype plugin indent on
set backspace=indent,eol,start "" Backspace works as expected
set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set number "" Line Numbers
set mouse=a "" Mouse events
set ignorecase
set smartcase "" If capitals entered, will not ignore case
set visualbell
set incsearch " search as characters are entered
inoremap jk <ESC>
inoremap wjk <ESC> :w<CR>
noremap <LEADER>source :source ~/.vimrc<CR> "" Reload vim settings


"" Top Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
nnoremap <C-T> :enew<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
"" Closes a buffer and moves to previous one - like closing a tab
nnoremap <C-p> :bp <BAR> bd #<CR>
"" Go back and forth between last open buffer
nnoremap <TAB> :b #<CR>

"" Visual Preferences

"" NerdTree Preferences
map <C-n> :NERDTreeToggle<CR>
nnoremap <LEADER>f :GitFiles<CR>
nnoremap <LEADER>nf :NERDTreeFind<CR>

"" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { "mode": "active"}
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
