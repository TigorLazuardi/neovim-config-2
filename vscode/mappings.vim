xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Now going down / up does not skip wrap
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" Easy go to end of line or start of line
nnoremap gh ^
nnoremap gl $
vnoremap gh ^
vnoremap gl $

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


nnoremap xx dd
nnoremap X D

nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <silent> gn :<C-u>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
nnoremap <silent> gp :<C-u>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
nnoremap <silent> gr :<C-u>call VSCodeNotify('goToNextReference')<CR>
nnoremap <silent> gR :<C-u>call VSCodeNotify('goToPreviousReference')<CR>
nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
