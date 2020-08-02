
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
set smarttab
set bg=dark
set tw=80

" setting colorscheme
colorscheme mono_tl

" disabling permanent search highlight
set nohlsearch

" binding spell checking
map <leader>us :setlocal spell! spelllang=en<CR>
map <leader>se :setlocal spell! spelllang=sv<CR>

" save file
nnoremap <silent> <C-S> :w<CR>
inoremap <silent> <C-S> <Esc>:w<CR>

" automatically delete trailing whitespaces on filesave
autocmd BufWritePre * %s/\s\+$//e

" setting folding method
set foldmethod=manual

" setting paste
set clipboard=unnamedplus

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
call plug#end()

" loading small functions
source ~/.config/nvim/after/functions.vim

" loading snippets
source ~/.config/nvim/after/snippets.vim

" Loading Coc settings
source ~/.config/nvim/after/coc.vim
