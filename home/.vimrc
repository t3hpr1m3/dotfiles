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
Plugin 'chr4/nginx.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'gasparch/vim-elixir-fold'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'janko-m/vim-test'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'Konfekt/FastFold'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'moll/vim-node'
Plugin 'mtth/scratch.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'pearofducks/ansible-vim'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'posva/vim-vue'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
if has('nvim')
	Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plugin 'Shougo/deoplete.vim'
	Plugin 'roxma/nvim-yarp'
	Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'slim-template/vim-slim'
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

if has('conceal')
	set conceallevel=2 concealcursor=i
endif


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

" Colors {{{
" silent! colorscheme base16-eighties
" let g:airline_theme='base16_eighties'
silent! colorscheme base16-onedark
let g:airline_theme='onedark'
function! s:base16_customize() abort
	" (group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
	call Base16hi("CursorLine", "", g:base16_gui03, "", "none", "underline", "")
	call Base16hi("CursorColumn", "", g:base16_gui03, "", g:base16_cterm03, "", "")
	call Base16hi("ColorColumn", "", g:base16_gui03, "", g:base16_cterm03, "", "")
	call Base16hi("Folded", g:base16_gui03, g:base16_gui03, g:base16_cterm03, g:base16_cterm05)
	call Base16hi("LineNr", g:base16_gui03, g:base16_gui03, g:base16_cterm03, g:base16_cterm05)
	call Base16hi("SignColumn", g:base16_gui03, g:base16_gui03, g:base16_cterm03, g:base16_cterm05)
	call Base16hi("GitGutterAdd", g:base16_gui00, g:base16_gui01, g:base16_cterm00, g:base16_cterm01)
	call Base16hi("GitGutterChange", g:base16_gui00, g:base16_gui08, g:base16_cterm00, g:base16_cterm0D)
	call Base16hi("GitGutterDelete", g:base16_gui03, g:base16_gui06, g:base16_cterm03, g:base16_cterm08)
	call Base16hi("GitGutterChangeDelete", g:base16_gui03, g:base16_gui06, g:base16_cterm03, g:base16_cterm06)
	call Base16hi("PMenu", g:base16_gui03, g:base16_gui06, g:base16_cterm00, g:base16_cterm0D)
	call Base16hi("PMenuSel", g:base16_gui03, g:base16_gui06, g:base16_cterm00, g:base16_cterm01)
	call Base16hi("DiffAdd", g:base16_gui0B, g:base16_gui01, g:base16_cterm00, g:base16_cterm01)
	call Base16hi("DiffDelete", g:base16_gui0B, g:base16_gui01, g:base16_cterm00, g:base16_cterm08)
	call Base16hi("DiffChange", g:base16_gui0B, g:base16_gui01, g:base16_cterm00, g:base16_cterm0D)
	call Base16hi("DiffChanged", g:base16_gui0B, g:base16_gui01, g:base16_cterm00, g:base16_cterm01)
	call Base16hi("DiffText", g:base16_gui0B, g:base16_gui01, g:base16_cterm00, g:base16_cterm01)
endfunction
" augroup on_change_colorschema
" 	autocmd!
" 	autocmd ColorScheme * call s:base16_customize()
" augroup END
if &diff
	syntax off
endif
" }}}
" }}}

" Bindings ------------ {{{
let mapleader = ","
let g:mapleader = ","

noremap <silent> <leader><space> :noh<CR>:call clearmatches()<CR>

" Move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
if has('nvim')
	noremap <BS> <C-w>h
endif

map <Leader>ar :AirlineRefresh<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <F3> :NERDTreeToggle<CR>
noremap <leader>q :Bclose<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Leader>. :Ag<Space>

nnoremap <C-W>M <C-W>\|<C-W>_
nnoremap <C-W>m <C-W>=

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
	au BufNewFile,BufRead *.mobile.erb let b:eruby_subtype='html'
	au BufNewFile,BufRead *.mobile.erb set filetype=eruby
augroup END

augroup ft_css
	au!
	au FileType css,scss set sw=4 sts=4 ts=4 noet
augroup END

augroup ft_javascript
	au!
	au FileType javascript setlocal foldenable|setlocal foldmethod=syntax|setlocal foldlevel=2
	au FileType jade set ai ts=2 sw=2 sts=2 et
	au FileType javascript set ai ts=2 sw=2 sts=2 et
augroup END

augroup ft_python
	au!
	au FileType python setlocal foldenable|setlocal foldmethod=syntax|setlocal foldlevel=2
	au FileType python set ai ts=8 sw=8 sts=8 noet
augroup END

augroup ft_terraform
	au!
	au FileType terraform set ai ts=4 sts=4 sw=4 noet
augroup END

augroup ft_go
	au!
	" au FileType go nmap <leader>r <Plug>(go-run)
	" au FileType go nmap <leader>b <Plug>(go-build)
	" au FileType go nmap <leader>t <Plug>(go-test)
	" au FileType go nmap <leader>c <Plug>(go-coverage)
	au FileType go setlocal foldmethod=syntax
	au FileType go setlocal ts=4 sts=4 sw=4 noet
	" au FileType go nnoremap <silent> <leader>s <Plug>(go-test-func)
	" au FileType go nnoremap <silent> <leader>a <Plug>(go-test)
	" au FileType go nnoremap <leader>s <Plug>(go-test-func)
	au FileType go nmap <leader>a <Plug>(go-test)
augroup END

augroup ft_vue
	au!
	au BufNewFile,BufFilePre,BufRead *.vue set filetype=vue
	au FileType vue set ts=2 sts=2 sw=2 et
augroup END
" }}}

" Formatting ---------- {{{
set mouse+=a
if &term =~ '^screen'
	if !has('nvim')
		set ttymouse=xterm2
	endif
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

" deoplete {{{
let g:deoplete#enable_at_startup = 1
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
let g:dispatch_compilers = {}

" function XvfbTransform(cmd) abort
"   return 'xvfb-run -a ' . a:cmd
" endfunction

" if filereadable(fnamemodify('script/capybara_browser', ':p'))
"   let g:test#custom_transformations = {'xvfb': function('XvfbTransform')}
"   let g:test#transformation = 'xvfb'
" endif

" function! DockerComposeTransform(cmd) abort
" 	if a:cmd =~# '\./bin/rspec.*'
" 		return 'docker-compose exec spring ' . a:cmd
" 	else
" 		return a:cmd
" 	end
" endfunction

" if filereadable(fnamemodify('docker-compose.yml', ':p'))
" 	let g:test#custom_transformations = {'dockercompose': function('DockerComposeTransform')}
" 	let g:test#transformation = 'dockercompose'
" endif
" }}}

" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}

" vim-go {{{
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = 'goimports'
let g:go_addtags_transform = 'camelcase'
"let g:go_debug=['lsp']
" }}}
" }}}
