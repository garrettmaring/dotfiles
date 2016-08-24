" Garrett Maring
" Plugins {{{
filetype off " Required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim " Set runtime path

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
Plugin 'keith/swift.vim' " Swift syntax
Plugin 'mitsuse/autocomplete-swift'
Plugin 'craigemery/vim-autotag'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'Shougo/neosnippet'
"" Both the below plugins are needed for vim-notes
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
"" Dash
Plugin 'rizzatti/dash.vim'
call vundle#end()
" }}}
" Core {{{
let mapleader="\<Space>"
" enable filetype detection and: 
" * load plugins relevant to filetype
" * calculate indentation based on fileype
filetype plugin indent on
" Who needs it?
set noswapfile " No .swp file
" force manually configuring pasted text
set nopaste
" default to English spelling
set spelllang=en_us

" esc
inoremap jk <ESC>
" write
noremap <LEADER>w <ESC> :w<CR>
" quit
noremap <LEADER>q <ESC> :q<CR>
" load .vimrc
noremap <LEADER>source <ESC> :source ~/.vimrc<CR>
" }}}
" Colors {{{
color smyck

autocmd ColorScheme * highlight Comment ctermfg=Red
autocmd ColorScheme * highlight Folded ctermfg=Green cterm=NONE ctermbg=NONE
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Blue ctermbg=NONE
" }}}
" UI Layout {{{
" nicer vertical characters
set fillchars+=vert:\|
" allow vim to set title of the shell
set title
" flash errors instead of beeping
set visualbell
" lines numbers relative to line that cursor is on
set relativenumber
" see current absolute line number
set number
" No column length restriction for syntax highlighting
set synmaxcol=0
" disable left scrollbar
set guioptions-=l
" disable right scrollbar
set guioptions-=r
" }}}
" Mouse & Keyboard {{{
" backspace works as expected
set backspace=indent,eol,start
" enable mouse in all modes
set mouse=a
" }}}
" Movement {{{
" jump to beginning/end of code block
noremap <LEADER>[ [{
noremap <LEADER>] ]}
" jump to beginning/end of parens
noremap <LEADER>( [(
noremap <LEADER>) ])
" }}}
" Tabs & Spaces {{{
" copies indentation of current line when entering a new line with 'O'
set autoindent
" tab key inserts spaces instead of tab character
set expandtab
" indents conform to edited tab settings
set smarttab
set softtabstop=0
" width of an indent in space
set shiftwidth=2
" width of a hardtabstop in spaces
set tabstop=2
" }}}
" Search & Select {{{
" search as characters are entered
set incsearch
" default to ignore case
set ignorecase
" will not ignore case if capital characters are entered
set smartcase
" highlight search
set hlsearch
" substiture with /g by default
set gdefault

" turn off search highlight
nnoremap <LEADER>nh :noh<CR>
" highlight everything inside block (inclusive)
noremap <LEADER>%% V$%
vnoremap <LEADER>%% $%
" }}}
" Folding {{{
set foldenable
set foldnestmax=10
set foldmethod=marker

" toggle fold
noremap zz za
" }}}
" Top Tabs {{{
" hide buffers instead of closing them
set hidden
" ignore QuickFix buffer
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup end

" create new buffer
nnoremap <C-T> :enew<CR>
" go to next buffer
nnoremap <C-l> :bnext<CR>
" go to previous buffer
nnoremap <C-h> :bprevious<CR>
"" close buffer and move to previous one - like closing a tab
nnoremap <C-q> :bp <BAR> bd #<CR>
"" toggle between last open buffer and current buffer
nnoremap <C-TAB> :b #<CR>
" }}}
" Tables {{{
let g:table_mode_header_fillchar="="
let g:table_mode_corner_corner="\u25CB"
" }}}
" Regex {{{
"" (http://vim.wikia.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic)
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//
" }}}
" Git {{{
" max width for commit messages
au FileType gitcommit set tw=72
" }}}
" Languages {{{
syntax enable

" javascript {{{

" }}}
" css & friends {{{
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
" this fixes issues with names like vertical-align etc.
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" scss
au BufRead,BufNewFile *.scss set filetype=scss.css
au FileType scss setlocal omnifunc=csscomplete#CompleteCSS
" }}}
" rust {{{
let g:racer_cmd = "/usr/local/src/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"
" }}}
" swift {{{
" build on every write
autocmd! BufWritePost *.swift :NeomakeSh swift build
" }}}
" Languages }}}
" Plugin Configs {{{
" Status Line {{{
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'separator': { 'left': "\ue0b0" },
  \ 'subseparator': { 'left': "\ue0b1" }
\ }
" }}}
" Neosnippets {{{
" do not run default snippets as they are not installed
let g:neosnippet#disable_runtime_snippets= {
\   '_': 1,
\ }
" set directory
let g:neosnippet#snippets_directory='~/.vim/Snippets'
" hides text of snippet
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" use javascript snippets in jsx files
let g:neosnippet#scope_aliases = {
\   'javascript.jsx': 'javascript',
\ }

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}
" HardMode {{{
autocmd VimEnter, BufNewFile, BufReadPost * silent! call HardMode()

" toggle hard mode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" }}}
" Dash {{{
nnoremap <Leader>d :Dash<CR>
" }}}
" NerdTree {{{
map <LEADER>n :NERDTreeToggle<CR>
nnoremap <LEADER>f :GitFiles<CR>
nnoremap <LEADER>nf :NERDTreeFind<CR>
" }}}
" Neomake {{{
" check files after every write and read
autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake
" open list when entries added. value 2 preserves cursor location
let g:neomake_open_list = 2
" set location list height
let g:neomake_list_height = 8

" bash
let g:neomake_sh_enabled_makers = ['shellcheck']
" rust
let g:neomake_rust_enabled_makers = ['rustc']
" javascript
" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
let g:neomake_javascript_enabled_makers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" swift
let g:neomake_swift_enabled_makers = ['swiftlint']
let g:neomake_swift_swiftlint_maker = {
      \ 'args': ['lint', '--config', './.swiftlint.yml', '--quiet'],
      \ 'errorformat': '%f:%l:%c: %trror: %m,%f:%l:%c: %tarning: %m,%f:%l: %tarning: %m,%f:%l: %trror: %m',
      \ 'append_file': 0,
      \ }
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
" if there aren't input patterns set for completion, set it to {}
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
  " only trigger autocomplete after 
  let g:deoplete#omni#input_patterns.javascript = ['[^. *\t]\.\w*']
  let g:deoplete#omni#input_patterns.swift = ['[^. *\t]\.\w*']
endif
" when autocomplete menu is showing, tab through options
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" }}}
" Notes {{{
let g:notes_directories = ['~/Notes' ]
let g:notes_suffix = '.txt'
" }}}
" Tern {{{
au FileType javascript setlocal omnifunc=tern#Complete

au filetype javascript nnoremap <leader>type :TernType<CR>
au filetype javascript nnoremap <leader>def :TernDef<CR>
au filetype javascript nnoremap <leader>doc :TernDoc<CR>
" }}}
" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}
" Plugin Configs }}}
" Misc {{{

" }}}
