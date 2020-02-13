"  88   8
"  88   8 e  eeeeeee eeeee  eeee
"  88  e8 8  8  8  8 8   8  8  8
"  "8  8  8e 8e 8  8 8eee8e 8e
"   8  8  88 88 8  8 88   8 88
"   8ee8  88 88 8  8 88   8 88e8
"
"
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" setting general line formatting
set expandtab
set shiftwidth=4
set softtabstop=4
let g:currentTabbing="soft"
set smarttab
set bg=dark
set tw=80

" setting colors and fixing spell highlight for gruvbox
let g:gruvbox_guisp_fallback = "bg"
" colorscheme desert
" colorscheme nord
colorscheme mono_tl
" colorscheme mono_sw
" colorscheme gruvbox

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

function! s:figlet(...)
    put=system("figlet -f /home/glass/Freetime/Figlet/computer.flf",  a:1)
    for i in [1, 2, 3, 4, 5, 6]
        if &filetype == "vim"
            norm! k>>0i"
        elseif &filetype == "tex"
            norm! k>>0i%
        elseif &filetype == "sh"
            norm! k>>0i#
        endif
    endfor
    if &filetype == "sh"
        norm! ggO#! /bin/sh
    else
        norm! ggdd
    endif
endfunction
command! -nargs=1 Figlet call s:figlet(<f-args>)

function! s:tabbing(...)
    if g:currentTabbing == "soft"
        echo g:currentTabbing
        set shiftwidth&
        set softtabstop&
        set noexpandtab
        let g:currentTabbing="hard"
    else
        set shiftwidth=2
        set softtabstop=2
        set expandtab
        let g:currentTabbing="soft"
    endif
endfunction
command! -nargs=0 Tabbing call s:tabbing()


" global snippets
autocmd FileType * inoremap ,imap
    \ autocmd FileType inoremap ,<++>
    \ <Esc>2bi
autocmd FileType * inoremap ,nmap
    \ autocmd FileType nnoremap ,<++>
    \ <Esc>2bi
autocmd FileType * inoremap ,map
    \ autocmd FileType map < leader>
    \ <Esc>bh<Del><Esc>2hi<Space>
autocmd FileType * inoremap  ,\
    \ <Tab>\ <CR ><Esc>hxA

" shortcut to jump to next step in snippets
noremap <Space><Space> <Esc>/<++><Enter>"_c4l

" skeletons
autocmd BufNewFile *.tex 0r /usr/share/nvim/runtime/skeletons/skeleton.tex
autocmd BufNewFile *.c	 0r /usr/share/nvim/runtime/skeletons/skeleton.c
autocmd BufNewFile *.h	 0r /usr/share/nvim/runtime/skeletons/skeleton.h
autocmd BufNewFile *.cpp 0r /usr/share/nvim/runtime/skeletons/skeleton.cpp
autocmd BufNewFile doc_* 0r /usr/share/nvim/runtime/skeletons/documentation.txt

" manual sourcing snippets
nnoremap <leader>tex :set filetype=tex<CR>
nnoremap <leader>xml :set filetype=xml<CR>
nnoremap <leader>css :set filetype=css<CR>
nnoremap <leader>js  :set filetype=javascript<CR>
nnoremap <leader>c   :set filetype=c<CR>
nnoremap <leader>py  :set filetype=python<CR>

" plugins
call plug#begin('~/.config/nvim/vendor')
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-prettier', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-texlab', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-java', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-tsserver', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-json', {'do': { -> coc#util#install()}}
Plug 'junegunn/goyo.vim'
call plug#end()
