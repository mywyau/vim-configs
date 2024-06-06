" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim 
set guicursor=n-v-c:ver25,i-ci-ve:ver25,r-cr:hor20,o:hor50

" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Add plugins here
" Rust support
Plug 'neovim/nvim-lspconfig'             " Collection of configurations for built-in LSP client
Plug 'rust-lang/rust.vim'                " Rust support
Plug 'dense-analysis/ale'                " Asynchronous linting and fixing
Plug 'nvim-lua/plenary.nvim'             " Common utilities for Neovim
Plug 'nvim-telescope/telescope.nvim'     " Fuzzy finder
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter for better syntax highlighting
Plug 'hrsh7th/nvim-cmp'                  " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'              " LSP source for nvim-cmp
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" Enable nvim-cmp
lua << EOF
local cmp = require'cmp'
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
  },
}
EOF

" Setup LSP
lua << EOF
require'lspconfig'.rust_analyzer.setup{}
EOF

" Enable Treesitter for better syntax highlighting
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "rust", "c", "cpp", "python", "javascript" },
    highlight = {
    enable = true,
  },
}
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

" remaps from the Primeagen

let mapleader = " "

nnoremap <leader>pv :Vex<CR>

nnoremap <leader><CR>:so ~/.config/nvim/init.vim<CR>


" Telescope settings for fuzzy finding
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Set colorscheme to catppuccin-macchiato
if has("termguicolors")
    set termguicolors
endif
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin

" Set cursor shapes for different modes
let &t_SI = "\e[6 q" " Vertical bar cursor in insert mode
let &t_SR = "\e[6 q" " Vertical bar cursor in replace mode
let &t_EI = "\e[6 q" " Block cursor in normal mode (adjust if needed)



