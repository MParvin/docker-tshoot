let mapleader = "\\"

call plug#begin('~/.local/share/nvim/plugged')

" Golang specific plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Enable syntax highlighting
syntax on

" Enable file type detection
filetype plugin indent on

" Set up vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Set up CoC (Conquer of Completion)
let g:coc_global_extensions = ['coc-go']

" Key mappings for vim-go
nmap <leader>r <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
