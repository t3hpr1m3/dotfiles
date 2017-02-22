" My really bad .vimrc
"
" I mean it.  Thing sucks donkey balls.  But it works for me.

set nocompatible
filetype off

" Plugins ------------- {{{
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'janko-m/vim-test'
Plugin 'kien/ctrlp.vim'
Plugin 'Konfekt/FastFold'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'moll/vim-node'
Plugin 'mtth/scratch.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'pearofducks/ansible-vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tomtom/tinykeymap_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vadimr/bclose.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/taglist.vim'
Plugin 'fatih/vim-go'
call vundle#end()
" }}}

" Options ------------- {{{
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
" set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:␉\ ,eol:¬,precedes:«,extends:»
set lazyredraw
set matchtime=5
set showbreak=+++\ 
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
" }}}

" Bindings ------------ {{{
let mapleader = ","
let g:mapleader = ","

set background=dark
silent! colorscheme base16-twilight
let g:airline_theme='base16_twilight'

noremap <silent> <leader><space> :noh<CR>:call clearmatches()<CR>

" Move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
map <Leader>ar :AirlineRefresh<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F3> :NERDTreeToggle<CR>
noremap <leader>q :Bclose<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Leader>. :Ag<Space>


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

set foldmethod=marker
" }}}
" }}}

" Filetypes ----------- {{{
filetype plugin indent on
map <Leader>d :filetype detect<CR>
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

augroup ft_python
	au!
	au FileType python setlocal foldenable|setlocal foldmethod=syntax|setlocal foldlevel=2
	au FileType python set ai ts=8 sw=8 sts=8 noet
augroup END

augroup ft_go
	au!
	au FileType go nmap <leader>r <Plug>(go-run)
	au FileType go nmap <leader>b <Plug>(go-build)
	au FileType go nmap <leader>t <Plug>(go-test)
	au FileType go nmap <leader>c <Plug>(go-coverage)
" }}}

" Formatting ---------- {{{
set mouse+=a
if &term =~ '^screen'
	set ttymouse=xterm2
endif

set statusline=[%n]\ %f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P

augroup cursor_line
	au!
	au WinLeave,InsertEnter * set nocursorline nocursorcolumn
	au WinEnter,InsertLeave * set cursorline cursorcolumn
augroup END

syntax on
" }}}

" Plugin Settings ----- {{{
"
" neocomplete {{{
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
" }}}

" neosnippet {{{
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
" }}}

if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" CTRL-P {{{
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](.git|.svn|vendor|node_modules)'
	\ }
" }}}

" Scratch {{{
let g:scratch_autohide = 1
" }}}

" vim-airline {{{
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#default#section_truncate_width = {
	\ 'y': 120,
	\ 'x': 110,
	\ 'z': 100
\ }
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let airline#extensions#c_like_langs = ['c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php', 'scss']
" }}}

" vim-test {{{
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
let test#strategy = "dispatch"
let test#ruby#bundle_exec = 0
let test#elixir#exunit#executable = "mixt"
let g:dispatch_compilers = {}
let g:dispatch_compilers['mixt'] = 'exunit'

" if filereadable(fnamemodify('docker-compose.yml', ':p'))
" 	let test#ruby#rspec#executable = "docker-compose run app rspec"
" 	let test#javascript#mocha#executable = "docker-compose run app mocha"
" 	let test#elixir#exunit#executable = "docker-compose run app mix test"
" endif
" }}}

" vim-spec {{{
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" }}}

" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}
" }}}
