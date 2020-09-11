Plug 'reedes/vim-pencil'

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END
