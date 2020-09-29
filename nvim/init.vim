
"    @@@  @@@  @@@  @@@@@@@@@@   @@@@@@@    @@@@@@@
"    @@@  @@@  @@@  @@@@@@@@@@@  @@@@@@@@  @@@@@@@@
"    @@!  @@@  @@!  @@! @@! @@!  @@!  @@@  !@@
"    !@!  @!@  !@!  !@! !@! !@!  !@!  @!@  !@!
"    @!@  !@!  !!@  @!! !!@ @!@  @!@!!@!   !@!
"    !@!  !!!  !!!  !@!   ! !@!  !!@!@!    !!!
"    :!:  !!:  !!:  !!:     !!:  !!: :!!   :!!
"     ::!!:!   :!:  :!:     :!:  :!:  !:!  :!:
"      ::::     ::  :::     ::   ::   :::   ::: :::
"       :      :     :      :     :   : :   :: :: :


" setting general settings
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set expandtab
set shiftwidth=4
set softtabstop=4
let g:currentTabbing="soft"
let g:color="dark"
set smarttab
set tw=80

" binding keys
let mapleader = ",,"
autocmd FileType * inoremap jk <Esc>

" setting colorscheme
set bg=dark
let ayucolor="light"
colorscheme mono_tl

" disabling permanent search highlight
set nohlsearch

" binding spell checking
map <leader>us :setlocal spell! spelllang=en<CR>
map <leader>se :setlocal spell! spelllang=sv<CR>

" save file
nnoremap <silent> <C-S> :w<CR>
inoremap <silent> <C-S> <Esc>:w<CR>

" formats code on filesave
autocmd BufWritePre * %s/\s\+$//e
map <leader>fo :Neoformat<CR>

" setting folding method
set foldmethod=manual

" persistent folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim silent! mkview
  autocmd BufWinEnter *.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim silent! loadview
augroup END

" setting paste
set clipboard=unnamedplus

" settings for easymotion
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
let g:easymotion#is_active = 0
map <space>k <Plug>(easymotion-k)
map <space>j <Plug>(easymotion-j)

" skeletons
autocmd BufNewFile *.tex  0r /usr/share/nvim/runtime/skeletons/skeleton.tex
autocmd BufNewFile *.c	  0r /usr/share/nvim/runtime/skeletons/skeleton.c
autocmd BufNewFile *.h	  0r /usr/share/nvim/runtime/skeletons/skeleton.h
autocmd BufNewFile *.cpp  0r /usr/share/nvim/runtime/skeletons/skeleton.cpp
autocmd BufNewFile *.dot  0r /usr/share/nvim/runtime/skeletons/skeleton.dot
autocmd BufNewFile *.html 0r /usr/share/nvim/runtime/skeletons/skeleton.html
autocmd BufNewFile doc_*  0r /usr/share/nvim/runtime/skeletons/documentation.txt

" plugins
call plug#begin('~/.config/nvim/vendor')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/vim-tmux-clipboard'
Plug 'liuchengxu/graphviz.vim'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'easymotion/vim-easymotion'
Plug 'sbdchd/neoformat'
Plug 'alloyed/lua-lsp'
call plug#end()

" loading small functions
source ~/.config/nvim/after/functions.vim

" loading snippets
source ~/.config/nvim/after/snippets.vim

" Loading Coc settings
source ~/.config/nvim/after/coc.vim
