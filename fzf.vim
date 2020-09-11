if !executable('fzf')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
endif
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:space_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'History'],
      \ ';' : [':Commands'              , 'Commands'],
      \ 'a' : [':Ag'                    , 'Text Ag'],
      \ 'b' : [':BLines'                , 'Current Buffer'],
      \ 'B' : [':BUFFERS'               , 'Open Buffers'],
      \ 'c' : [':Commits'               , 'Commits'],
      \ 'C' : [':BCommits'              , 'Buffer Commits'],
      \ 'f' : [':Files'                 , 'Files'],
      \ 'g' : [':GFiles'                , 'Git Files'],
      \ 'G' : [':GFiles?'               , 'Modified Git Files'],
      \ 'h' : [':History'               , 'File History'],
      \ 'H' : [':History:'              , 'Command History'],
      \ 'l' : [':Lines'                 , 'Lines'] ,
      \ 'm' : [':Marks'                 , 'Marks'] ,
      \ 'M' : [':Maps'                  , 'Normal Maps'] ,
      \ 'p' : [':Helptags'              , 'Help Tags'] ,
      \ 'P' : [':Tags'                  , 'Project Tags'],
      \ 's' : [':CocList snippets'      , 'Snippets'],
      \ 'S' : [':Colors'                , 'Color Schemes'],
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }
