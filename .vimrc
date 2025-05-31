set encoding=UTF-8
set nocompatible
set noerrorbells
set exrc
set expandtab 
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set smartindent
set smarttab
set autoindent
set cindent
set showcmd
set number
set relativenumber
set autowrite
set autoread
set wrap
set incsearch 
set noswapfile
set smartcase 
syntax on
set clipboard=unnamedplus
filetype plugin on 
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set ttyfast
set wildmenu
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgreen
set ignorecase
set smartcase

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"""leader
let mapleader = " "

""" KEYBINDINGS
nmap <A-a> m<CR>
nmap <C-\> <C-^>
imap <C-\> <ESC> <C-^>
vnoremap <C-c> "*y :let @+=@*<CR> 
map <C-v> "+p
map <C-S-v> "+P
map <c-i> :tabn<CR>
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>p "_dP
nnoremap dd "_dd
nnoremap <leader><CR> :so ~/.vimrc<CR>


""" for transparent background
highlight Normal ctermbg=NONE 
highlight Normal ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight Folded ctermbg=NONE
highlight NonText ctermbg=NONE
highlight SpecialKey ctermbg=NONE
highlight VertSplit ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
highlight clear LineNr
highlight clear SignColumn
highlight clear CursorLine
set cursorline
set noshowmode
set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set nocursorline
""" trasparent end
