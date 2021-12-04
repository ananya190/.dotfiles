syntax on

set exrc

set noerrorbells

set number
set relativenumber

set softtabstop=4
set tabstop=4
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set ruler

set incsearch
set hlsearch

set path=++
set wildmenu

set cc=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set background=dark

set hidden

set foldmethod=manual
" set foldlevel=1
" set foldclose=all

" VIM-PLUG
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
" NERDTree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'
Plug 'frazrepo/vim-rainbow'

"COLORSCHEMES
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vv9k/vim-github-dark'
Plug 'bignimbus/pop-punk.vim'
Plug 'glepnir/oceanic-material'
Plug 'nickaroot/vim-xcode-dark-theme'
Plug 'mazleo/vim-astro'
Plug 'arzg/vim-colors-xcode'
Plug 'haishanh/night-owl.vim'
Plug 'fenetikm/falcon'
Plug 'nanotech/jellybeans.vim'
Plug 'h3xx/vim-late_evening'
Plug 'fielding/vice'
Plug 'sstallion/vim-wtf'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

let mapleader = " "
nnoremap ; :
nnoremap G G$
vnoremap G G$
inoremap jk <Esc>

nnoremap <leader>ff <cmd>Telescope find_files()<cr>
nnoremap <leader>fg <cmd>Telescope live_grep()<cr>
nnoremap <leader>fb <cmd>Telescope buffers()<cr>
nnoremap <leader>fh <cmd>Telescope help_tags()<cr>
" nnoremap <leader>fs <cmd>Telescope grep_string<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>


set cmdheight=2
set showcmd

let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

colorscheme dracula

autocmd FileType swift colorscheme xcodewwdc

" lightline customization
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }

" NERDTreeShowHidden
let NERDTreeShowHidden=1


" NERDTreeGitStatusIndicator Icons
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Return to last save? position when opening files 
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Save folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
