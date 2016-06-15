" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'benekastah/neomake'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Valloric/ListToggle'
Plugin 'ternjs/tern_for_vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer' " Rust autocomplete
call vundle#end()

"" Colors & Themes
color smyck

"" The Basics
let mapleader="\<Space>"
syntax on
filetype plugin indent on
set backspace=indent,eol,start "" Backspace works as expected
set expandtab "" Tab key inserts spaces instead of tab character
set smarttab "" Indents conform to edited tab settings
set softtabstop=0
set shiftwidth=2 "" Width of an indent in spaces
set tabstop=2 "" Width of a hardtabstop in spaces
set number "" Line Numbers
set mouse=a "" Mouse events
set ignorecase
set smartcase "" If capitals entered, will not ignore case
set visualbell
set incsearch " search as characters are entered
set nopaste
inoremap jk <ESC>
noremap <LEADER>w <ESC> :w<CR>
noremap <LEADER>q <ESC> :q<CR>
noremap <LEADER>source <ESC> :source ~/.vimrc<CR>

"" Tab Bar
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

"" NerdTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <LEADER>f :GitFiles<CR>
nnoremap <LEADER>nf :NERDTreeFind<CR>

"" NerdTree Git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"" Neomake
" Check files after every write and write
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = ['rustc']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_open_list = 2 " So location buffer can open

"" Deoplete (Autocomplete)
let g:deoplete#enable_at_startup = 1
" If there aren't input patterns set for completion, set it to {}
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.javascript = ['[^. *\t]\.\w*']
endif
" Tab for completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>qf'

"""""""""""""""""
" Languages
"""""""""""""""""

"" Javascript
au filetype javascript nnoremap <leader>t :TernType<CR>
au filetype javascript nnoremap <leader>f :TernDef<CR>
au filetype javascript nnoremap K :TernDoc<CR>
au FileType javascript setlocal omnifunc=tern#Complete
let g:jsx_ext_required = 0 " Will use jsx highlighting on .js extension
let g:tern_show_argument_hints='on_move'

"" CSS & SCSS
au BufRead,BufNewFile *.scss set filetype=scss.css
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType scss setlocal omnifunc=csscomplete#CompleteCSS
augroup VimCSS3Syntax " This fixes issues with names like vertical-align etc.
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

"" Rust
let g:racer_cmd = "/usr/local/src/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"


"""""""""""""""""
" Insanity
"""""""""""""""""

"" Mappings to execute tests in the adjacent pane from vim
nnoremap <LEADER>tr <ESC> :silent !tmux send-keys -t right "cargo test" C-m<CR>
nnoremap <LEADER>tj <ESC> :silent !tmux send-keys -t right "npm test" C-m<CR>
