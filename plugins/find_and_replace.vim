Plug 'brooth/far.vim'

set lazyredraw            " improve scrolling performance when navigating through large results

let g:space_key_map = get(g:, 'space_key_map', {})
let g:space_key_map.f = [':call QuickSearch()', 'quick find']
let g:space_key_map.F = [':Farr', 'find and replace']

let g:far#source = 'rgnvim'

fun! QuickSearch() abort
  let l:currWord = expand('<cword>')
  execute "F " . l:currWord
endfun

let g:far#window_width=80
" Use %:p with buffer option only
let g:far#file_mask_favorites=['**/*.ts', '**/*.vim', '**/*.go', '**/*.*']
let g:far#default_file_mask = '**/*.*'
let g:far#window_min_content_width=30
let g:far#enable_undo=1
let g:far#auto_preview = 1
" let g:far#check_window_resize_period = 86400000


"     Below are the default mappings and corresponding variable names in

" x v_x   - Exclude item under the cursor.

" i v_i   - Include item under the cursor.

" t v_t   - Toggle item exclusion under the cursor.

" f v_f   - Smartly toggle item exclusion under the cursor: exclude all items when all are excluded, otherwise exclude all items.

" X       - Exclude all items.

" I       - Include all items.

" T       - Toggle exclusion for all items.

" F       - Smartly toggle exclusion for all items: include all items when all are excluded, otherwise exclude all items.

" <CR>    - Jump to the source code of the item under the cursor. See |far-jump|

" p       - Open preview window (if not) and scroll to the item under the cursor. See |far-preview|

" P       - Close preview window. See |far-preview|

" CTRL-K  - Scroll preview window up (if open). See |far-preview|, |g:far#preview_window_scroll_step|

" CTRL-J  - Scroll preview window down (if open). See |far-preview|, |g:far#preview_window_scroll_step|

" zo      - Expand node under the cursor.

" zc      - Collapse node under the cursor.

" za      - Toggle node expanding under the cursor.

" zs      - Smartly toggle exclusion for all nodes: expand all nodes when all are collapsed, otherwise collapse all nodes.

" zr v_zr - Expand all nodes.

" zm v_zm - Collapse all nodes.

" zA v_zA - Toggle exclusion for all nodes.

" zS v_zS - Smartly toggle exclusion for all nodes: expand all nodes when all are collapsed, otherwise collapse all nodes.

" s v_s   - Execute |:Fardo|<CR>, to replace all included items.

" u v_s   - Execute |:Farundo|<CR>, to undo the last replacement by |:Fardo|.

" U v_U   - Execute |:Farundo| --all=1<CR>, to undo all replacements by |:Fardo|. For param '--all=' see |farundo-params|.

" q v_q   - Close searching result buffer and its preview buffer (if exists)
