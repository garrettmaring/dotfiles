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

"" Top Tabs
"" Unmap ctr-w switch between panes. Make it []
nnoremap <C-r> :tabnext<CR>
nnoremap <C-e> :tabprev<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <C-t> :tabnew<CR>


"" It's so pretty! (Visual Preferences)
" " Using dracula theme

"" NerdTree Preferences
map <C-n> :NERDTreeToggle<CR>
