set iskeyword+=-                      	" treat dash separated words as a word text object"
set nocompatible "Remove compability with older versions.
set formatoptions-=cro                  " Stop newline continution of comments
syntax enable                           " Enables syntax highlighing
set encoding=utf-8                      " The encoding displayed
" set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8

set ignorecase "When searching, make the search case insensitive
set hlsearch "When searching, the text is highlighted
set tabstop=2 "2 spaces when pressing tab.
set softtabstop=2 "Same as above"
set expandtab "Same as above
set shiftwidth=2 "If there's a matching bracket, vim will put it properly"
set shiftround "An extension of above"
set autoindent "When you press enter on a tabbed line, Next line is idented properly"
set smartindent "Indent enhancement"
set smarttab "tab enhancement"
set textwidth=100 "The text width before vim wraps the line"
set clipboard=unnamed,unnamedplus "Make vim able to copy and paste from outside vim"
set encoding=utf8 "Enforces utf-8"
set cursorline "Highlight where your current line is"
set termguicolors
set updatetime=200 "Time before vim is refreshed. Default 4000, the stronger your pc, the lower you may set it."
set display+=lastline "Never shortens messages"
set linebreak "Prevent vim from wrap in the middle of a word"
set scrolloff=999 "Make sure there's at least few lines visible between cursor and edge of window. Setting to 999 will make the cursor always on middle of screen"
set autoread "Auto reload file if there's outside edit"
set backspace=indent,eol,start "you may backspace over indentation, endofline, startofline"
" set foldmethod=syntax
set nofoldenable        "dont fold by default
set mouse=a

if !isdirectory(g:config . '/backup')
  call mkdir(g:config . '/backup', "p", 0700)
endif
set backupdir=g:config.'/backup'
set formatoptions+=j "When editing a comment, and in insert mode you press enter, there's a leading comment added"
set noswapfile "Disable swap file. Makes my life easier to be honest, but make sure to save frequently"
set nrformats-=octal
if !isdirectory(g:config . '/undodir')
  call mkdir(g:config . '/undodir', "p", 0700)
endif

set undodir=g:config.'/undodir'
set splitbelow
set splitright
set incsearch

if !isdirectory(g:config.'/tmp')
  call mkdir(g:config.'/tmp', "p", 0700)
endif
set directory=g:config.'/tmp'
set formatoptions-=tc
set path+=**
set number relativenumber
set wildmenu
set wildignore+=**/node_modules/**
set wildmode=longest:full,list:full
set signcolumn=number

" Enable syntax highlighting
syntax on

nnoremap [w :setlocal nowrap<cr>
nnoremap ]w :setlocal wrap<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap fs w! !sudo tee > /dev/null %

set norelativenumber
