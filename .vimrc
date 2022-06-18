set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-commentary'

Plugin 'joshdick/onedark.vim'

Plugin 'sgur/vim-editorconfig'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

autocmd BufEnter * let g:editorconfig_root_chdir = finddir('.git/..', expand('%:p:h').';')

set encoding=utf-8
scriptencoding utf-8
set list
set listchars=eol:\|,tab:··\|
set backspace=indent,eol,start

syntax enable

set splitright
set sessionoptions-=options
set number
set relativenumber
set scrolloff=999
set showmatch
set ruler
set cursorline
set cursorcolumn
set autoread
set wrapscan

set noswapfile
set pastetoggle=<F2>

set incsearch
set hlsearch
map <space> /
map <C-space> ?
nnoremap <CR> :nohlsearch<CR><CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <A-h> :tabprevious<CR>
map <A-l> :tabnext<CR>

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" inoremap { <Esc>o{<CR><BS>}<Esc>i<CR><Esc>ko<Tab>
" inoremap { {}<Esc>i
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i


set spell
set path=.,,**
set laststatus=2
set wildmode=longest,list,full
set wildmenu
set nu
set ignorecase
set smartcase
set virtualedit=block

" no nerd tree installed solution
" map <C-n> :Lex %:h<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.build/*
set mouse=a

" managed by editorconfig
" set smarttab
set autoindent smartindent

"set soft word wrapping
set wrap
set linebreak

set cc=80
"set tw=80
set formatoptions+=t

filetype on
filetype plugin on
filetype indent on

" managed by editorconfig
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype json setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype c setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
autocmd Filetype html,xml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType c,cpp,java,scala set commentstring=//\ %s
autocmd FileType sh,ruby,python,conf,fstab set commentstring=\#\ %s
autocmd FileType tex set commentstring=%\ %s
autocmd FileType mail set commentstring=>\ %s
autocmd FileType vim set commentstring=\"\ %s
autocmd FileType conf set filetype=make
augroup filetypedetect
    au BufRead,BufNewFile *tmux.conf set filetype=sh
augroup END
autocmd BufEnter * lcd %:p:h

set background=dark
colorscheme onedark
set t_Co=256
set t_ut=

highlight Search ctermbg=239
highlight Search ctermfg=111

hi clear SpellBad
hi SpellBad cterm=underline

function! Compile(fileName, filePath)
	let build = input("ul, lx, xl, sh, or py: ")
	if l:build == "ul"
		execute "! build uml " . a:fileName . " " . a:filePath
		redraw!
	endif
	if l:build == "lx"
		execute "! build latex " . a:fileName . " " . a:filePath
		redraw!
	endif
	if l:build == "xl"
		execute "! build xelatex " . a:fileName . " " . a:filePath
		redraw!
	endif
	if l:build == "py"
		execute "! build python " . a:fileName . " " . a:filePath
		redraw!
	endif
	if l:build == "sh"
		execute "! build shell " . a:fileName . " " . a:filePath
		redraw!
	endif
endfunction

map <C-u> :call Compile('%:t:r', '%:h')<CR>
