set mouse+=a

" let mapleader = " "
" nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Alt+J and Alt+K to swap lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> :m .-2<CR>==gi
inoremap <A-j> :m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Now j and k keys don't skip wrapped lines
nnoremap k gk
nnoremap j gj

if exists('g:vscode')
  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>

  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  nnoremap xx dd
  nnoremap X D
  nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
  nnoremap <silent> gn :<C-u>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
  nnoremap <silent> gp :<C-u>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
  nnoremap <silent> gr :<C-u>call VSCodeNotify('goToNextReference')<CR>
  nnoremap <silent> gR :<C-u>call VSCodeNotify('goToPreviousReference')<CR>
  nnoremap <silent> gl :<C-u>call VSCodeNotify('editor.action.openLink')<CR>
  nnoremap <silent> gh :<C-u>call VSCodeNotify('closeMarkersNavigation')<CR>
  nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>

else

  " Delete buffer instead of quit
  nnoremap <silent> ZZ :bd<CR>
  " I hate escape more than anything else
  inoremap jk <Esc>
  inoremap kj <Esc>

  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>
  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>
  " Use control-c instead of escape
  inoremap <silent> <C-c> <Esc>
  " <TAB>: completion.
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent> <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

  " Better window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Terminal window navigation
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>

  " Moving between vim splits without pressing Ctrl+w first. 
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Move buffer with alt + n or alt + p
  nnoremap <silent> <A-n> :bnext!<cr>
  nnoremap <silent> <A-p> :bprev!<cr>
  inoremap <silent> <A-n> <esc>:bnext!<cr>
  inoremap <silent> <A-p> <esc>:bprev!<cr>

  " Better nav for omnicomplete
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

  inoremap <expr> <c-l> ("\<right>")
  inoremap <expr> <c-h> ("\<left>")

  " TAB in general mode will move to text buffer
  nnoremap <silent> <TAB> :bnext!<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious!<CR>

  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>

  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>

  " Press F12 to reload config
  nnoremap <silent><F12> :source $MYVIMRC<cr>:echo "Config reload"<cr>
endif
