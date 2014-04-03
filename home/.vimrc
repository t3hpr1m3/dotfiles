" General configuration
set nocompatible
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

let mapleader = ","
let g:mapleader = ","

" Giving Vundle a try
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vadimr/bclose.vim'
Plugin 'minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'

filetype plugin indent on

set background=dark
silent! colorscheme solarized

" Automatically open NERDTree if no files are specified
autocmd vimenter * if !argc() | NERDTree | endif

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F3> :NERDTreeToggle<CR>
noremap <leader>q :Bclose<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap <C-F> :filetype detect<CR>


augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
	autocmd FileType scss set sw=4 sts=4 ts=4 noet
augroup END
