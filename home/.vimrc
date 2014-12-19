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

set number
set showmatch
set matchtime=5
set novisualbell
set laststatus=2
set ruler

set mouse+=a
if &term =~ '^screen'
	set ttymouse=xterm2
endif
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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'vadimr/bclose.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'geekjuice/vim-spec'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'
Plugin 'tomtom/tinykeymap_vim'
syntax on

" neocomplcache
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_dictionary_filetype_lists = {
"	\ 'default' : ''
"		\ }

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ }
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" CTRL-P
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': 'vendor\|\.git|node_modules\'
	\ }

" vim-spec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Check to see if we have a fig.yml file
" If we do, pipe all commands through `fig run app $cmd`
if filereadable(fnamemodify('fig.yml', ':p'))
	let g:rspec_command = "!fig run app bash -c \"bundle exec rspec {spec}\""
	let g:mocha_js_command = "!fig run app bash -c \"\\$(npm bin)/mocha {spec}\""
endif

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

filetype off
filetype plugin indent on

set background=dark
silent! colorscheme solarized

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F3> :NERDTreeToggle<CR>
noremap <leader>q :Bclose<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


augroup myfiletypes
	autocmd!
	autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
	autocmd FileType ruby,eruby,yaml set ai ts=2 sw=2 sts=2 et
	autocmd FileType scss set sw=4 sts=4 ts=4 noet
	autocmd FileType javascript,jade set ai ts=2 sw=2 sts=2 et
augroup END
