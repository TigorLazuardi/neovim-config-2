if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let $CONFIG = '$HOME/.config/nvim'

au BufWrite * if &ft == 'vim' | call ReIndent() | endif

function ReIndent() abort
  let l:current_line = line(".")
  exe "normal! gg=G"
  exe l:current_line
endfunction

source $CONFIG/mappings/mappings.vim
source $CONFIG/mappings/commands.vim

if exists('g:vscode')
  " VS code vim
  call plug#begin()
  Plug 'tpope/vim-surround'
  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'gcmt/wildfire.vim' " Enter key
  Plug 'wellle/targets.vim' " enhance default motions
  Plug 'kana/vim-textobj-entire' " buffer select. e motion key
  Plug 'sgur/vim-textobj-parameter' " argument select. a motion key
  Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html property select. x motion key
  Plug 'Julian/vim-textobj-variable-segment' " camelcase & snakecase select. v motion key
  Plug 'kana/vim-textobj-line' " select line. l motion key

  " Finds now search multi-lines and not just current line
  " Plug 'dahu/vim-fanfingtastic'

  " Text multi-line auto spacing.
  Plug 'godlygeek/tabular'

  " Expands find and replace to something magical
  Plug 'tpope/vim-abolish'
  " source $CONFIG/clip.vim

  " Repeat some plugin commands with '.'
  Plug 'tpope/vim-repeat'

  " Clipboard Management
  source $CONFIG/clip.vim

  call plug#end()

  set clipboard=unnamedplus
  set autoread "Auto reload file if there's outside edit"
  set backspace=indent,eol,start "you may backspace over indentation, endofline, startofline"
  set ignorecase "When searching, make the search case insensitive
  set hlsearch "When searching, the text is highlighted
else
  " Ordinary NVIM
  call plug#begin()
  source $CONFIG/settings/settings.vim

  " Must be loaded before all else
  source $CONFIG/mappings/whichkey.vim

  source $CONFIG/plugins/find_and_replace.vim

  source $CONFIG/theme.vim

  if exists('g:started_by_firenvim')
    source $CONFIG/firenvim.vim
  endif

  " Vim dev icons
  Plug 'ryanoasis/vim-devicons'

  " Snippets
  source $CONFIG/ultisnips.vim

  source $CONFIG/pencil.vim

  " Auto-completion
  source $CONFIG/coc.vim

  " Go support. Run :PlugInstall manually after having go sdk installed and added to $PATH
  source $CONFIG/vimgo.vim

  " FZF support. May not work properly on Windows Subsytem for Linux
  source $CONFIG/fzf.vim

  " Rust support. Need cargo installed first then run :PlugInstall
  source $CONFIG/rust.vim

  " Clipboard management. Delete no longer adds to clipboard and clipboard syncs with CLIPBOARD and no
  " longer with PRIMARY
  source $CONFIG/clip.vim

  " File Explorer. Key: <leader>e
  " source $CONFIG/fern.vim

  " Tags generator
  source $CONFIG/gutentags.vim

  " Txt support
  source $CONFIG/prose.vim

  " Unix shell commands sugars. Check ':h eunuch'
  Plug 'tpope/vim-eunuch'

  source $CONFIG/surround.vim

  " Syntax coloring
  Plug 'sheerun/vim-polyglot'

  " Git integration
  source $CONFIG/plugins/fugitive.vim

  " Easy commenting
  Plug 'tpope/vim-commentary'

  Plug 'mhinz/vim-signify'

  " Repeat some plugin commands with '.'
  Plug 'tpope/vim-repeat'


  " For some coding respect with other devs
  source $CONFIG/editorconfig.vim

  " Finds now search multi-lines and not just current line
  " Plug 'dahu/vim-fanfingtastic'

  " Text multi-line auto spacing.
  Plug 'godlygeek/tabular'

  " Expands find and replace to support context replace with brackets
  Plug 'tpope/vim-abolish'

  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'gcmt/wildfire.vim' " Enter key
  Plug 'wellle/targets.vim' " enhance default motions
  Plug 'kana/vim-textobj-entire' " buffer select. e motion key
  Plug 'sgur/vim-textobj-parameter' " argument select. a motion key
  Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html property select. x motion key
  Plug 'Julian/vim-textobj-variable-segment' " camelcase & snakecase select. v motion key
  Plug 'kana/vim-textobj-line' " select line. l motion key

  " Statistics
  " Plug 'wakatime/vim-wakatime'

  source $CONFIG/floaterm.vim

  source $CONFIG/ale.vim

  source $CONFIG/markdown.vim

  source $CONFIG/plugins/lens.vim

  call plug#end()
endif

if exists('g:fvim_loaded')
  " good old 'set guifont' compatibility
  set guifont=FiraCode\ Nerd\ Font\ Mono:h16
  " Ctrl-ScrollWheel for zooming in/out
  nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
  nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
  nnoremap <A-CR> :FVimToggleFullScreen<CR>
  FVimCursorSmoothMove v:true
  FVimCursorSmoothBlink v:true
endif
