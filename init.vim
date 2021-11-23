" START :: ----- VIM-PLUG PLUGINS -----
call plug#begin()

Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot' " Multiple language-support packs
Plug 'mattn/emmet-vim'      " HTML Writing tool
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto-completion tool, VS-Code like
Plug 'preservim/nerdtree' " File tree manager
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " File finder
Plug 'junegunn/fzf.vim' " File finder, same as above
Plug 'itchyny/lightline.vim' " Better bottom line
Plug 'taohexxx/lightline-buffer' " Aaand a buffer manager for it
Plug 'ryanoasis/vim-devicons' " Icons, yay!
Plug 'airblade/vim-gitgutter' " Git gutter literally
Plug 'jiangmiao/auto-pairs'   " Auto-close regular identation tokens 
Plug 'ctrlpvim/ctrlp.vim'     " Fuzzy Finder for everything
Plug 'norcalli/nvim-colorizer.lua' "Fastest colorized in the west
Plug 'dense-analysis/ale' "Linter
Plug 'andweeb/presence.nvim'
Plug 'calviken/vim-gdscript3'

call plug#end()
" END :: ----- VIM-PLUG PLUGINS -----


" START :: ----- VIM MISC CONFIG -----
set number
set termguicolors
" let ayucolor="dark"
" colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
" END :: ----- VIM MISC CONFIG -----


" START :: ----- ALE CONFIG -----
let b:ale_linter_aliases = ['javascript', 'jsx', 'python']
let g:ale_linters = {
\   'javascript': ['eslint', 'flow-language-server'],
\   'jsx': ['eslint'],
\   'python': ['autopep8', 'yapf'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\   'python': ['flake8', 'pylint'],
\}
" END :: ----- ALE CONFIG -----


" START ----- COLORIZER CONFIGURATION -----
" Attaches to every FileType mode
lua require'colorizer'.setup()
" END ----- COLORIZER CONFIGURATION -----


" START  ----- CTRL P CONFIGURATION -----
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
" END  ----- CTRL P CONFIGURATION -----


" START  ----- LIGHTLINE CONFIGURATION -----
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline
let g:lightline = {
      \ 'colorscheme': 'darcula',
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

" remap keys
nnoremap <A-Left> :bprev<CR>
nnoremap <A-Right> :bnext<CR>
nnoremap <A-h> :bprev<CR>
nnoremap <A-l> :bnext<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 50

" max file extension length
let g:lightline_buffer_maxfextlen = 5

" min file name length
let g:lightline_buffer_minflen = 1

" min file extension length
let g:lightline_buffer_minfextlen = 0

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20
" END  ----- LIGHTLINE CONFIGURATION -----


" START  ----- DEOPLETE CONFIGURATION -----
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'enable_smart_case': 1,
\ 'enable_refresh_always': 0,
\ 'auto_complete_delay': 200,
\ 'sources._': ['buffer', 'tags'],
\ 'cache_limit_size': 5000000
\ })
" END  ----- DEOPLETE CONFIGURATION -----


" START  ----- NERD-TREE CONFIGURATION -----
" Visuals
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Keys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" END  ----- NERD-TREE CONFIGURATION -----
