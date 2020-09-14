Plug 'liuchengxu/vim-which-key'

" Map leader to which_key
nnoremap <silent> <space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <space> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> [ :<c-u>WhichKey '['<CR>
vnoremap <silent> [ :<c-u>WhichKeyVisual '['<CR>
nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
vnoremap <silent> ] :<c-u>WhichKeyVisual ']'<CR>

" Create map to add keys to
" let g:which_key_map =  {}
" Define a separator

" Coc Search & refactor
" nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

let g:which_key_sep = '=>'
let g:which_key_use_floating_win = 0

let g:space_key_map = get(g:, 'space_key_map', {})
let g:left_bracket_key_map = {}
let g:right_bracket_key_map = {}

let g:left_bracket_key_map.w = ['setlocal no wrap', 'Remove wrap on current buffer']
let g:right_bracket_key_map.w = ['setlocal wrap', 'Turns on wrap for current buffer']

let g:space_key_map.w = {
      \ 'name': '+window',
      \ 'v': ['<c-w>v', 'split vertical'],
      \ 'h': ['<c-w>s', 'split horizontal'],
      \ 'q': ['q', 'quit'],
      \ 'Q': ['Q', 'quit (force)'],
      \ 'w': ['w', 'save file'],
      \ 'd': ['bd', 'delete'],
      \ 'D': ['bd!', 'delete (force)'],
      \ }

au VimEnter * call which_key#register('<space>', 'g:space_key_map')
au VimEnter * call which_key#register('[', 'g:left_bracket_key_map')
au VimEnter * call which_key#register(']', 'g:right_bracket_key_map')
