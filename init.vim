call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chase/vim-ansible-yaml'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'hail2u/vim-css3-syntax'
" Plug 'othree/svg-properties-syntax.vim'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'gcorne/vim-sass-lint'
Plug 'ntpeters/vim-airline-colornum'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
Plug 'activebridge/rails-snippets'
Plug 'honza/vim-snippets'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-commentary'

Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/EasyGrep'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/Toggle'
Plug 'vim-scripts/surround.vim'
Plug 'vim-scripts/rainbow-end'
Plug 'vim-scripts/vim-qf'

Plug 'w0rp/ale'

Plug 'nvim-lua/plenary.nvim'                                  " dependency for telescope
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " dependency for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'

Plug 'airblade/vim-localorie'
Plug 'airblade/vim-gitgutter'

Plug 'joshdick/onedark.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'miyakogi/conoline.vim'

call plug#end()

colorscheme onedark
set guifont=Monospace:h13         " Font

set number
set expandtab ts=2 sw=2 ai        " Two spaces instead tab
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile
set list
set listchars=trail:•             " Show spaces in end of line
set clipboard=unnamedplus
set scrolloff=10                  " Show 3 lines of context around the cursor.
set autoread
au FocusGained * :checktime

map gitk :!gitk %:p &<cr><ESC>

map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>
map <C-a> <esc>ggVG<end>
vnoremap < <gv
vnoremap > >gv

" Bubble single&multiple lines
vnoremap <A-Up> <esc>`<gv:m '<-2<cr>gv
vnoremap <A-Down> <esc>`>gv:m '>+1<cr>gv
nnoremap <A-Up> mz:m-2<cr>`z
nnoremap <A-Down> mz:m+<cr>`z

" ALE
let g:ale_fix_on_save = 1
let g:lint_on_insert_leave = 1
let g:lint_on_text_changed = 0
" let g:ale_sign_column_always=1"
"
" Rgrep
map <C-f> :Rgrep<cr>
let Grep_Default_Filelist = '*.*'
let Grep_Skip_Files = '*.log *.sql *.png *.jpg *.jpeg *.gif'
let Grep_Skip_Dirs = '.git tmp coverage log solr public _site node_modules'

" Telescope
nnoremap <A-o> <cmd>Telescope find_files<cr>
nnoremap <S-tab> <cmd>Telescope buffers<cr>

" Highlight cursor (only for current window)
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1

" Commentary
map <C-c> <esc>gcc<end>
map <C-x> <esc>gcu<end>
vmap <C-c> gc
map cp "+y<CR>

" NERDTree
map <F2> :NERDTreeToggle<cr>
map gt   :NERDTreeFind<cr>
let NERDTreeAutoDeleteBuffer = 1

" GitGutter
set updatetime=100
let g:gitgutter_map_keys = 0

" Rails
map gV :Eview<CR>
map gC :Econtroller<CR>
map gM :Emodel<CR>
map gH :Ehelper<CR>
map gJ :Ejavascript<CR>
map gS :Estylesheet<CR>

" vim-localorie
nnoremap <silent> lt :call localorie#translate()<CR>
autocmd CursorMoved *.yml echo localorie#expand_key()

autocmd BufWritePre *.* :%s/\s\+$//e

cmap <S-Insert>  <C-R>+

if exists("+undofile")
    set udf
    set undodir=~/.vim/undo
endif
