:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

set encoding=UTF-8
set nocompatible
set noerrorbells
set exrc
set expandtab 
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set noeb vb t_vb=

set smartindent
set smarttab
set autoindent
set cindent
 
set showcmd
" set number
" set relativenumber
set autowrite
set autoread
set wrap
set incsearch 
set noswapfile
set smartcase 
syntax on
set clipboard=unnamedplus
syntax enable
filetype plugin on 

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=1

" faster scrolling
set ttyfast

" better command-line completion
set wildmenu

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Search "
set ignorecase
set smartcase

""" FOLDING
" set foldmethod=syntax

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go'
" Plug 'SirVer/ultisnips'
Plug 'vim-pandoc/vim-pandoc'
Plug 'rwxrob/vim-pandoc-syntax-simple'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
" Plug 'vim-airline/vim-airline'

call plug#end()

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
" let g:airline_powerline_fonts = 1
let g:airline_stl_path_style = 'short'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

"ultisnips .*
" let g:UltiSnipsExpandTrigger           = '<s-tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<s-tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<s-tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<leader><s-tab>'
" 
""" prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.ts Neoformat

"""
" file search 
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"


let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" nmap <C-p> :Files<CR>
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""" ::: THEME ::: 

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
" let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark
let g:lightline = {'colorscheme' : 'gruvbox'}

" syntax on
" " colorscheme onedark
" " let g:onedark_terminal_italics=1
" " let g:lightline = {
" "   \ 'colorscheme': 'onedark',
" "   \ }

" if (has("termguicolors"))
"  set termguicolors
" endif

" set background=dark
" set termguicolors
" colorscheme darkspace
" let g:darkspace_italics=1
" let g:airline_theme='darkspace'
" syntax enable
" set background=dark
" colorscheme shapeshifter

" To enable the nightowl theme
" colorscheme night-owl
" let g:lightline = { 'colorscheme': 'nightowl' }
"
"""leader
let mapleader = " "

""" KEYBINDINGS
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
vnoremap < <gv
vnoremap > >gv
" Toggling Line Numbers on
nnoremap <silent><leader>no :set rnu!<CR>
nnoremap <silent><leader>ni :set nu!<CR>

""" c++ special

nmap <F9> :!g++ %<CR>
imap <F9> <ESC>:w<CR>:!g++ %
nmap <F8> :!./a.out<CR>

""" cursor line (|) on insert mode :)
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" greatest remap ever
vnoremap <leader>p "_dP
nnoremap dd "_dd
nnoremap <leader><CR> :so ~/.vimrc<CR>


" for transparent background
" function! AdaptColorscheme()
"  highlight clear CursorLine
"  highlight Normal ctermbg=none
"  highlight LineNr ctermbg=none
"  highlight Folded ctermbg=none
"  highlight NonText ctermbg=none
"  highlight SpecialKey ctermbg=none
"  highlight VertSplit ctermbg=none
"  highlight SignColumn ctermbg=none
" endfunction
" autocmd ColorScheme * call AdaptColorscheme()

" " vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
" " hi Normal ctermbg=NONE 
" highlight Normal guibg=NONE ctermbg=NONE
" highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
" highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
" highlight clear LineNr
" highlight clear SignColumn

" set cursorline
" set noshowmode
" " Enable CursorLine
" set nocursorline
" " Default Colors for CursorLine

" " Change Color when entering Insert Mode
" autocmd InsertEnter * set nocursorline

" " Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * set nocursorline

" trasparent end

" Show whitespace "
" set list listchars=tab:»·,trail:·,nbsp:·
" set listchars=tab:»·,trail:↲,extends:>,precedes:<,space:·,nbsp:␣
" set list
 
" Toggle tabs and EOL
" map <leader>l :set list!<CR> 

" vim pandoc settings
let g:pandoc#folding#fdc = 0

" execute "set t_8f=\e[38;2;%lu;%lu;%lum"
" execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" :autocmd BufWinLeave * !~/reset-cursor %:p
