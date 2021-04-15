Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

if exists('g:started_by_firenvim')
  au TextChanged * ++nested write
  au TextChangedI * ++nested write
endif
