"rs+=vert:\| Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-abolish' " Advanced search and replace
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'benekastah/neomake'
Plugin 'Shougo/deoplete.nvim'
Plugin 'ternjs/tern_for_vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer' " Rust autocomplete
Plugin 'wikitopian/hardmode'
Plugin 'keith/swift.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"" Both the below plugins are needed for vim-notes
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
call vundle#end()

"" Colors & Themes
color smyck

autocmd ColorScheme * highlight Comment ctermfg=Red
autocmd ColorScheme * highlight Folded ctermfg=Green cterm=NONE ctermbg=NONE

"" Status Line
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'separator': { 'left': "\ue0b0" },
  \ 'subseparator': { 'left': "\ue0b1" }
\ }

set fillchars+=vert:\|
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Blue ctermbg=NONE


"" The Basics
let mapleader="\<Space>"
syntax enable
filetype plugin indent on
set nopaste
set backspace=indent,eol,start "" Backspace works as expected
set autoindent "" Copies indentation of current line when entering a new line with 'O'
set expandtab "" Tab key inserts spaces instead of tab character
set smarttab "" Indents conform to edited tab settings
set softtabstop=0
set shiftwidth=2 "" Width of an indent in spaces
set tabstop=2 "" Width of a hardtabstop in spaces
set relativenumber
set number "" Line Numbers
set mouse=a "" Mouse events
set ignorecase
set smartcase "" If capitals entered, will not ignore case
set visualbell
set incsearch " Search as characters are entered
set synmaxcol=0 " No column length restriction for syntax highlighting
set title " Vim controls tab title
set noswapfile " No .swp file

"" Mappings
inoremap jk <ESC>
noremap <LEADER>w <ESC> :w<CR>
noremap <LEADER>q <ESC> :q<CR>
noremap <LEADER>source <ESC> :source ~/.vimrc<CR>
"" Quickly highlight everything inside block (inclusive)
noremap <LEADER>%% V$%
vnoremap <LEADER>%% $%
"" Jump to beginning/end of code block
noremap <LEADER>[ [{
noremap <LEADER>] ]}
"" Jump to beginning/end of parens
noremap <LEADER>( [(
noremap <LEADER>) ])
"" Easier fold toggle
noremap zz za

"" Hard Mode
autocmd VimEnter, BufNewFile, BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

"" Regex
"" (http://vim.wikia.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic)
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

"" Tables
let g:table_mode_header_fillchar="="
let g:table_mode_corner_corner="\u25CB"

"" Tabs
set hidden
nnoremap <C-T> :enew<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
"" Closes a buffer and moves to previous one - like closing a tab
nnoremap <C-q> :bp <BAR> bd #<CR>
"" Go back and forth between last open buffer
nnoremap <C-TAB> :b #<CR>
"" Ignore QuickFix buffer
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup end

"" NerdTree
map <LEADER>n :NERDTreeToggle<CR>
nnoremap <LEADER>f :GitFiles<CR>
nnoremap <LEADER>nf :NERDTreeFind<CR>

"" Git
au FileType gitcommit set tw=72

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
" Check files after every write and read
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_css_enabled_makers = ['stylelint']
"let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_rust_enabled_makers = ['rustc']
let g:neomake_open_list = 2
let g:neomake_list_height = 8 "Set location list height

" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
let g:neomake_javascript_enabled_makers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

"" Deoplete (Autocomplete)
let g:deoplete#enable_at_startup = 1
" If there aren't input patterns set for completion, set it to {}
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.javascript = ['[^. *\t]\.\w*']
endif
" Tab for completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"" Snippets
let g:UltiSnipsExpandTrigger="<c-u>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Notes
let g:notes_directories = ['~/Notes' ]
let g:notes_suffix = '.txt'


"""""""""""""""""
" Languages
"""""""""""""""""

"" Javascript
au filetype javascript nnoremap <leader>type :TernType<CR>
au filetype javascript nnoremap <leader>def :TernDef<CR>
au filetype javascript nnoremap <LEADER>doc :TernDoc<CR>
au FileType javascript setlocal omnifunc=tern#Complete
let g:tern_show_argument_hints='on_move'
let g:jsx_ext_required = 0

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
nnoremap <LEADER>tstr <ESC> :silent !tmux send-keys -t right "cargo test" C-m<CR>
nnoremap <LEADER>tstj <ESC> :silent !tmux send-keys -t right "npm test" C-m<CR>
