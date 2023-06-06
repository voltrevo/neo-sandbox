call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
  Plug 'Mofiqul/vscode.nvim'
call plug#end()

"nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-t> :NERDTreeToggle<CR>

"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
let g:coc_global_extensions = [
  \   'coc-tsserver',
  \   'coc-json',
  \   'coc-css',
  \   'coc-eslint',
  \   'coc-prettier'
  \ ]
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

lua require('vscode').load('dark')

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Try to keep 5 lines of context when scrolling
set scrolloff=5
set sidescrolloff=2

" Create backups
set backup
set backupdir=~/.vim-backups
let backupvar = "set backupext=~" . strftime("%Y-%m-%d-%H:%m:%S")
execute backupvar

" Use that ~/.vim-backups dir for swapfiles too
set swapfile
set dir=~/.vim-backups

" Search options: incremental search, highlight search
set hlsearch
set incsearch

" Allow edit buffers to be hidden
set hidden

" CursorLine is nice, you'll like it
set cursorline

" Line numbers
set number

" Smart case is cool. If all lowercase, do case insensitve search, using
" anything uppercase makes it case sensitive.
set ignorecase
set smartcase

set colorcolumn=80

" Use autoindent ONLY
autocmd FileType * set nosmartindent|set nocindent
