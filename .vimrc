set number
set scrolloff=8
set rnu  

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
syntax enable

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'rust-lang/rust.vim'             " Syntax highlighting and more
Plug 'dense-analysis/ale'             " Asynchronous linting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'            " LSP completion
Plug 'neovim/nvim-lspconfig'          " LSP configuration


call plug#end()


" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Set up LSP for Rust
lua << EOF
require'lspconfig'.rust_analyzer.setup{}
EOF

" ALE configuration for Rust
let g:ale_fixers = {
    \ 'rust': ['rustfmt'],
    \}
let g:ale_linters = {
    \ 'rust': ['cargo', 'rustc'],
    \}

" Additional Rust settings
let g:rustfmt_autosave = 1


let g:lightline = {'colorscheme': 'catppuccin_macchiato'}
let mapleader = " "

nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR>:so  ~/.vimrc<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" Change to vertical bar cursor in all modes
if has("nvim")
    let &t_SI = "\e[6 q"
    let &t_SR = "\e[6 q"
    let &t_EI = "\e[6 q"
else
    let &t_SI = "\e[5 q"
    let &t_SR = "\e[5 q"
    let &t_EI = "\e[5 q"
endif








