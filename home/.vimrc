" General configuration set nocompatible
set modeline
set modelines=5
set hlsearch
set incsearch
set showmode

" Formatting
set nowrap
set textwidth=0
set backspace=indent,eol,start
set tabstop=4
set sts=4
set shiftwidth=4
set noexpandtab
set smartindent
set smarttab

set autoindent
set cindent
set cinoptions=+0

syntax on
set number
set showmatch
set matchtime=5
set novisualbell
set laststatus=2
set ruler

set mouse=a
set title

set statusline=[%n]\ %f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P

let mapleader = ","
let g:mapleader = ","

" Giving Vundle a try
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vadimr/bclose.vim'
Plugin 'minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Shougo/neocomplcache.vim'
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'geekjuice/vim-spec'
" Plugin 'geekjuice/vim-mocha'
Plugin 'pangloss/vim-javascript'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
		\ }

" CTRL-P
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': 'vendor\|\.git'
	\ }

" vim-spec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:mocha_js_command = '!$(npm bin)/mocha {spec}'

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

filetype plugin indent on

set background=dark
silent! colorscheme solarized

" Automatically open NERDTree if no files are specified
" autocmd vimenter * if !argc() | NERDTree | endif

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F3> :NERDTreeToggle<CR>
noremap <leader>q :Bclose<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" nmap <C-F> :filetype detect<CR>


augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai ts=2 sw=2 sts=2 et
	autocmd FileType scss set sw=4 sts=4 ts=4 noet
	autocmd FileType javascript set ai ts=2 sw=2 sts=2 et
augroup END
