"Basic
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set number
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set mouse=a
set smarttab
set smartindent
set expandtab
set clipboard=unnamedplus
set updatetime=300
set timeoutlen=300
set autoread
set termguicolors
set nowrap
syntax on
filetype plugin indent on

"Plugins
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/everforest'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

"NerdTree
nnoremap <C-f> :NERDTreeFind<CR>
map <C-b> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

"Theme OneDark
"let g:airline_theme='onedark'
"let g:onedark_termcolors=256
"colorscheme onedark

"Theme Everforest
"colorscheme everforest
"let g:everforest_background = 'hard'
"let g:airline_theme='everforest'
"set background=dark

"Gruvbox Material
colorscheme gruvbox-material
let g:airline_theme='base16_gruvbox_dark_hard'
let g:gruvbox_material_background = 'hard'
set background=dark

"Emmet config
let g:user_emmet_leader_key='<C-Z>'

"Tagbar
nmap <F2> :TagbarToggle<CR>

"Coc
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
