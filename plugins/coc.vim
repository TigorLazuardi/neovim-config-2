Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

set hidden
set nobackup
set nowritebackup

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<TAB>" 

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup coc_autos
	au!
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

let g:space_key_map.d = ['<Plug>(coc-definition)', 'Go To Definition']

let g:space_key_map.e = [':CocCommand explorer', 'explorer']
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
autocmd BufLeave * if &ft == 'coc-explorer' | q | endif

let g:space_key_map.c = {
			\ 'name': '+lists',
			\ 'c': [':CocFzfListResume', 'resume previous buffer'],
			\ 'C': [':CocFzfList', 'list coc lists in fzf buffer'],
			\ 'D': [':CocFzfList diagnostics --current-buf', 'diagnostics (current buffer)'],
			\ 'd': [':CocFzfList diagnostics', 'diagnostics'],
			\ 'x': [':CocFzfList commands', 'commands'],
			\ 'e': [':CocFzfList extensions', 'extensions'],
			\ 'l': [':CocFzfList locations', 'locations'],
			\ 'o': [':CocFzfList outline', 'outline'],
			\ 's': [':CocFzfList symbols', 'symbols'],
			\ }

let g:space_key_map.l = {
			\ 'name' : '+lsp' ,
			\ '.' : [':CocConfig'                          , 'config'],
			\ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
			\ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
			\ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
			\ 'b' : [':CocNext'                            , 'next action'],
			\ 'B' : [':CocPrev'                            , 'prev action'],
			\ 'c' : [':CocList commands'                   , 'commands'],
			\ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
			\ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
			\ 'e' : [':CocList extensions'                 , 'extensions'],
			\ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
			\ 'F' : ['<Plug>(coc-format)'                  , 'format'],
			\ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
			\ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
			\ 'I' : [':CocList diagnostics'                , 'diagnostics'],
			\ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
			\ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
			\ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
			\ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
			\ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
			\ 'O' : [':CocList outline'                    , 'outline'],
			\ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
			\ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
			\ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
			\ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
			\ 'R' : ['<Plug>(coc-references)'              , 'references'],
			\ 's' : [':CocList -I symbols'                 , 'references'],
			\ 'S' : [':CocList snippets'                   , 'snippets'],
			\ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
			\ 'u' : [':CocListResume'                      , 'resume list'],
			\ 'U' : [':CocUpdate'                          , 'update CoC'],
			\ 'v' : [':Vista!!'                            , 'tag viewer'],
			\ 'z' : [':CocDisable'                         , 'disable CoC'],
			\ 'Z' : [':CocEnable'                          , 'enable CoC'],
			\ }

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codelens-action)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <F2> <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> K :call CocActionAsync('doHover')<CR>

" mappings
nnoremap <silent> <leader><leader> :<C-u>CocFzfList<CR>
nnoremap <silent> <leader>a        :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>b        :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>c        :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>x        :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <leader>l        :<C-u>CocFzfList location<CR>
nnoremap <silent> <leader>o        :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>s        :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader>p        :<C-u>CocFzfListResume<CR>

" Using CocList
" Show all diagnostics
" nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workleader symbols
nnoremap <silent> <leader>cy  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>


let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
vmap <C-j> <Plug>(coc-snippets-select)
set completeopt=noinsert,menuone,noselect
set shortmess+=c

imap <c-m> <Plug>(coc-snippets-expand-jump)
vmap <c-m> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
			\ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<c-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-y> pumvisible() ? coc#_select_confirm() : "\<c-y>"


inoremap <expr><c-d> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(1) : "\<c-d>"
inoremap <expr><c-u> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(0) : "\<c-u>"
nnoremap <expr><c-d> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(1) : "\<c-d>"
nnoremap <expr><c-u> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(0) : "\<c-u>"


let g:coc_global_extensions = [
			\ 'coc-tsserver', 
			\ 'coc-word', 
			\ 'coc-vimlsp', 
			\ 'coc-tag',
			\ 'coc-json',
			\ 'coc-emoji',
			\ 'coc-prettier',
			\ 'coc-emoji',
			\ 'coc-emmet',
			\ 'coc-dictionary',
			\ 'coc-diagnostic',
			\ 'coc-yaml',
			\ 'coc-pairs',
			\ 'coc-yank',
			\ 'coc-snippets',
			\ ]

autocmd FileType markdown,vimwiki,wiki,md let b:coc_pairs_disabled = ['`']
inoremap <silent> <cr> <C-g>u<CR><c-r>=coc#on_enter()<CR>
