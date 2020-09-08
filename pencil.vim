Plug 'reedes/vim-pencil'

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType * call InitPencil()
augroup END

function InitPencil()
  if &ft == 'text'
    call pencil#init({'wrap': 'hard'})  
  elseif &ft == 'markdown'
    return
  else
    call pencil#init() 
  endif
endfunction
