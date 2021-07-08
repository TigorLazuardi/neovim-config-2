if has('win32')
    let g:split_rc = split($MYVIMRC, '\')
    let g:config_folder = g:split_rc[0:-2]
    let g:config = join(g:config_folder, '\')	
else
    let g:split_rc = split($MYVIMRC, '/')
    let g:config_folder = g:split_rc[0:-2]
    let g:config = '/'.join(g:config_folder, '/')
endif


call plug#begin()

if exists('g:vscode')
    for f in split(glob(g:config.'/vscode/*.vim'), '\n')
        exe 'source '.g:config.'/mappings/commands.vim'
        exe 'source '.g:config.'/settings/settings.vim'
        exe 'source '.g:config.'/settings/autos.vim'
        exe 'source' f
    endfor
elseif exists('g:started_by_firenvim')
    for f in split(glob(g:config.'/firenvim/*.vim'), '\n')
        exe 'source' f
    endfor
elseif exists('g:gui_oni')
    " Gui Oni Configuration here
else
    exe 'source '.g:config.'/mappings/commands.vim'
    exe 'source '.g:config.'/settings/settings.vim'
    exe 'source '.g:config.'/settings/autos.vim'
    exe 'source '.g:config.'/mappings/mappings.vim'
    exe 'source '.g:config.'/firenvim/firenvim.vim'
    for f in split(glob(g:config.'/default-plugs/*.vim'), '\n')
        exe 'source' f
    endfor
endif

call plug#end()
