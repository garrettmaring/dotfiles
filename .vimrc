" Vundle Set Up!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-sensible'

call vundle#end()            " required
filetype plugin indent on    " required

"" The Basics
syntax on
filetype plugin indent on
set nocompatible              " be iMproved, required
set expandtab
set shiftwidth=2
set tabstop=2
set number

"" It's so pretty! (Visual Preferences)
colorscheme PaperColor
set t_Co=256

"" NerdTree Preferences
map <C-n> :NERDTreeToggle<CR>
