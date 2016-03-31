" Vundle Set Up!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'Raimondi/delimitMate'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

"" The Basics
syntax on
filetype plugin indent on
set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set number
set mouse=a
set ignorecase
set smartcase
set visualbell
imap jk <ESC>
imap wjk <ESC> :w<CR>

"" Top Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
nmap <C-T> :enew<CR>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
"" Closes a buffer and moves to previous one - like closing a tab
nmap <C-p> :bp <BAR> bd #<CR>

"" It's so pretty! (Visual Preferences)
"" Using dracula theme (see plugins)

"" NerdTree Preferences
map <C-n> :NERDTreeToggle<CR>
