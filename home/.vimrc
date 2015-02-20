" My really bad .vimrc
"
" I mean it.  Thing sucks donkey balls.  But it works for me.

set nocompatible
filetype off

" Plugins ----------- {{{
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'edkolev/tmuxline.vim'
Plugin 'geekjuice/vim-spec'
Plugin 'kien/ctrlp.vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tomtom/tinykeymap_vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vadimr/bclose.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/taglist.vim'
call vundle#end()
" }}}

" Options ---------- {{{
set encoding=utf-8
set modeline
set modelines=5
set autoindent
set showmode
set showcmd
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=5
set showbreak=↪
set splitbelow
set splitright
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1


" Wildmenu stuffs {{{
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.manifest
set wildignore+=*.sw?
set wildignore+=*.DS_Store
" }}}

" Tabs/Spaces/Wrapping {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set wrap
set textwidth=80
set cindent
set smarttab
" }}}

" Searching and cursor movement{{{
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set cursorline
set cursorcolumn

set scrolloff=4
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <silent> <leader><space> :noh<CR>:call clearmatches()<CR>

" Move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" }}}

" Filetypes ----------- {{{
augroup ft_markdown
	au!
	au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
augroup END

augroup ft_ruby
	au!
	au FileType ruby setlocal foldmethod=syntax
	au FileType ruby,eruby,yaml set ai ts=2 sw=2 sts=2 et
augroup END

augroup ft_css
	au!
	au FileType css,scss set sw=4 sts=4 ts=4 noet
augroup END

augroup ft_javascript
	au!
	au FileType javascript setlocal foldenable|setlocal foldmethod=syntax|setlocal foldlevel=2
	au FileType javascript,jade set ai ts=2 sw=2 sts=2 et
augroup END
" }}}


filetype plugin indent on

" Formatting


set mouse+=a
if &term =~ '^screen'
	set ttymouse=xterm2
endif

set statusline=[%n]\ %f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P

let mapleader = ","
let g:mapleader = ","

augroup cursor_line
	au!
	au WinLeave,InsertEnter * set nocursorline nocursorcolumn
	au WinEnter,InsertLeave * set cursorline cursorcolumn
augroup END

syntax on

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

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: "\<TAB>"
let g:neosnippet#snippets_directory='~/.neosnippets'

if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" CTRL-P
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](.git|.svn|vendor|node_modules)'
	\ }

" vim-airline
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#default#section_truncate_width = {
	\ 'y': 120,
	\ 'x': 110,
	\ 'z': 100
\ }

map <Leader>ar :AirlineRefresh<CR>

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

set background=dark
silent! colorscheme base16-google

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F3> :NERDTreeToggle<CR>
noremap <leader>q :Bclose<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

