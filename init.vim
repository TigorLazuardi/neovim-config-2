if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:split_rc = split($MYVIMRC, '/')
let g:config_folder = g:split_rc[0:-2]
let g:config = '/'.join(g:config_folder, '/')

exe 'source '.g:config.'/mappings/commands.vim'
exe 'source '.g:config.'/settings/settings.vim'
exe 'source '.g:config.'/settings/autos.vim'

call plug#begin()

if exists('g:vscode')
  for f in split(glob(g:config.'/vscode/*.vim'), '\n')
    exe 'source' f
  endfor
else
  exe 'source '.g:config.'/mappings/mappings.vim'
  for f in split(glob(g:config.'/plugins/*.vim'), '\n')
    exe 'source' f
  endfor
endif
