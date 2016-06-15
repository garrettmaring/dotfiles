" Vundle Set Up!

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'benekastah/neomake'
Plugin 'Valloric/ListToggle'

call vundle#end()            " required

"" The Basics
let mapleader=","
syntax on
filetype plugin indent on
set backspace=indent,eol,start "" Backspace works as expected
set expandtab "" Tab key inserts spaces instead of tab character
set smarttab
set softtabstop=0
set shiftwidth=2 "" Width of an indent in spaces
set tabstop=2 "" Width of a hardtabstop in spaces
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

"" Neomake
" Check file after every write
autocmd! BufWritePost * Neomake
" Check file after every read
autocmd! BufReadPost * Neomake
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = ['rustc']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_open_list = 2

"" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
