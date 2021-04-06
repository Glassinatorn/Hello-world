
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


" binding keys
let mapleader = "\<Space>"
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap z<space> za
nnoremap zz z=
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

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
syntax on

" setting colorscheme
set bg=dark
let g:nvcode_termcolors=256
let ayucolor="light"

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

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
  autocmd BufWinLeave *.lua,*.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim silent! mkview
  autocmd BufWinEnter *.lua,*.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim silent! loadview
augroup END

" setting paste
set clipboard=unnamedplus

" settings for easymotion and case-insensitive feature
let g:EasyMotion_smartcase = 1
let g:easymotion#is_active = 0
map <Space>k <Plug>(easymotion-k)
map <Space>j <Plug>(easymotion-j)

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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" end of lsp
" treesitter
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
" end of treesitter
Plug 'roxma/vim-tmux-clipboard'
Plug 'liuchengxu/graphviz.vim'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'easymotion/vim-easymotion'
Plug 'sbdchd/neoformat'
Plug 'liuchengxu/vim-which-key'
Plug 'sirver/ultisnips'
Plug 'erietz/vim-terminator'
Plug 'mattn/emmet-vim'
call plug#end()

" loading small functions
source ~/.config/nvim/after/functions.vim

" loading snippets
let g:UltiSnipsJumpForwardTrigger='<tab>'

" " Loading keybindings
" source ~/.config/nvim/after/keys.vim

" For when it is easier to use lua in nvim
" Loading lua configs
luafile ~/.config/nvim/lua/lua_config.lua
luafile ~/.config/nvim/lua/maps.lua
" luafile ~/.config/nvim/lua/treesitter_config.lua

" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

colorscheme mono_tl " Or whatever colorscheme you make

luafile ~/.config/nvim/lua/compe_config.lua
