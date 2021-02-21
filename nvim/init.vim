:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

syntax on
filetype plugin indent on

set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=1
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=10
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set colorcolumn=80
" faster scrolling
set ttyfast
" better command-line completion
set wildmenu

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
Plug 'fatih/vim-go'
" Plug 'SirVer/ultisnips'
Plug 'vim-pandoc/vim-pandoc'
Plug 'rwxrob/vim-pandoc-syntax-simple'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'gruvbox-community/gruvbox'
Plug 'srcery-colors/srcery-vim' 

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" -- vim pandoc settings
let g:pandoc#folding#fdc = 1

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
"""
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
" let g:webdevicons_enable_airline_statusline = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ultisnips .*
" let g:UltiSnipsExpandTrigger           = '<s-tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<s-tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<s-tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<leader><s-tab>'
" 
"""
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gdc   <cmd>lua vim.lsp.buf.declaration()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""" prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWrite *.js Neoformat
autocmd BufWrite *.ts Neoformat

"""
" file search 
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

""" ::: THEME ::: 
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if (has("termguicolors"))
 set termguicolors
endif

let g:srcery_italic=1
let g:srcery_bold=1
let g:srcery_underline=1
colorscheme srcery
let g:lightline = {
  \ 'colorscheme': 'srcery',
  \ }


" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic=1
" let g:gruvbox_bold=1
" let g:gruvbox_underline=1
" let g:gruvbox_italicize_comments=1

" " let g:gruvbox_invert_selection='0'
" colorscheme gruvbox
" set background=dark
" let g:lightline = {'colorscheme' : 'gruvbox'}

"""leader
let mapleader = " "

""" KEYBINDINGS
inoremap <C-c> <esc>
nmap <C-b> :NERDTreeToggle<CR>
imap <C-b> <ESC>:NERDTreeToggle<CR>
nmap <A-a> m<CR>
nmap <C-\> <C-^>
imap <C-\> <ESC> <C-^>
vnoremap <C-c> "*y :let @+=@*<CR> 
map <C-v> "+p
map <C-S-v> "+P
map <c-i> :tabn<CR>
noremap <leader>/ :Commentary<cr>
:imap jj <Esc>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader><CR> :so ~/.config/nvim/init.vim <CR>
" Toggling Line Numbers on
nnoremap <silent><leader>no :set rnu!<CR>
nnoremap <silent><leader>ni :set nu!<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

""" c++ special

nmap <F9> :!g++ %<CR>
imap <F9> <ESC>:w<CR>:!g++ %
nmap <F8> :!./a.out<CR>
inoremap <C-c> <esc>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  }
}
EOF

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>p :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
