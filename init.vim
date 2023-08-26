" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" Color support
set t_Co=256

" Syntax
filetype plugin indent on
syntax on

" True color if available
let term_program=$TERM_PROGRAM
if $TERM !=? 'xterm-256color'
    set termguicolors
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

call plug#begin()
" Appearance
Plug 'vim-airline/vim-airline'

" Utilities
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'

" Completion / linters / formatters
Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
Plug 'plasticboy/vim-markdown'

" Git
Plug 'airblade/vim-gitgutter'

"Color Scheme
Plug 'sainnhe/vim-color-forest-night'

call plug#end()

" Important!!
if has('termguicolors')
    set termguicolors
endif

" For dark version.
set background=dark

" For light version.
" set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'

" For better performance
" let g:everforest_better_performance = 1

" Transparency
let g:everforest_transparent_background = 1
colorscheme everforest

" File browser
let NERDTreeShowHidden=1

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" Enter/Exiting insert mode
" Set the timeout for mapping sequence
set timeoutlen=500

" Define the double 'ii' key sequence to exit insert mode
inoremap ii <Esc>

