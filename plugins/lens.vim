Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

let g:lens#disabled = 1
let g:lens#height_resize_max = 34
let g:lens#height_resize_min = 6
let g:lens#width_resize_max = 140
let g:lens#width_resize_min = 30

fun! IsIgnored()
  return index(map(['fern', 'fzf', 'far', 'fugitive', 'coc-explorer'], '&filetype =~ v:val'), 1) > -1
endfun

au BufEnter * if !IsIgnored() | call lens#run() | endif
