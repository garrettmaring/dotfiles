" Vundle Set Up!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
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
" " Using dracula theme

"" NerdTree Preferences
map <C-n> :NERDTreeToggle<CR>
