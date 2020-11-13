au BufWrite * if &ft == 'vim' | call ReIndent() | endif
au BufWrite * if &ft == 'sh' | call ReIndent() | endif
au BufWrite * if &ft == 'bash' | call ReIndent() | endif

function ReIndent() abort
  let l:current_line = line(".")
  exe "normal! gg=G"
  exe l:current_line
endfunction
