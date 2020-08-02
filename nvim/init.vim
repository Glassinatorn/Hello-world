
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

" function to paste in banners
function! s:fig(...)
    let tmp=system("figlet -f /home/glass/freetime/figlet/poison.flf", a:1)
    put=tmp
    for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
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
command! -nargs=1 Fig call s:fig(<f-args>)

" function for switching between soft and hardtabs
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
autocmd FileType * inoremap ,im
    \ autocmd FileType inoremap ,<++>
    \ <Esc>2bi
autocmd FileType * inoremap ,nm
    \ autocmd FileType nnoremap ,<++>
    \ <Esc>2bi
autocmd FileType * inoremap ,ma
    \ autocmd FileType map < leader>
    \ <Esc>bh<Del><Esc>2hi<Space>
autocmd FileType * inoremap  ,\
    \ <Tab>\ <CR ><Esc>hxA
autocmd FileType * inoremap ,"
    \ ""<Esc>i
autocmd FileType * inoremap ,{
    \ {
    \ <CR>}<Esc>O
autocmd FileType * inoremap ,(
    \ ()<Esc>i
autocmd FileType * inoremap ,[
    \ []<Esc>i

" shortcut to jump to next step in snippets
noremap <Space><Space> <Esc>/<++><Enter>"_c4l

" skeletons
autocmd BufNewFile *.tex  0r /usr/share/nvim/runtime/skeletons/skeleton.tex
autocmd BufNewFile *.c	  0r /usr/share/nvim/runtime/skeletons/skeleton.c
autocmd BufNewFile *.h	  0r /usr/share/nvim/runtime/skeletons/skeleton.h
autocmd BufNewFile *.cpp  0r /usr/share/nvim/runtime/skeletons/skeleton.cpp
autocmd BufNewFile *.dot  0r /usr/share/nvim/runtime/skeletons/skeleton.dot
autocmd BufNewFile *.html 0r /usr/share/nvim/runtime/skeletons/skeleton.html
autocmd BufNewFile doc_*  0r /usr/share/nvim/runtime/skeletons/documentation.txt

" manual sourcing snippets
nnoremap <leader>tex :set filetype=tex<CR>
nnoremap <leader>xml :set filetype=xml<CR>
nnoremap <leader>css :set filetype=css<CR>
nnoremap <leader>js  :set filetype=javascript<CR>
nnoremap <leader>c   :set filetype=c<CR>
nnoremap <leader>py  :set filetype=python<CR>

" plugins
call plug#begin('~/.config/nvim/vendor')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/vim-tmux-clipboard'
Plug 'liuchengxu/graphviz.vim'
Plug 'junegunn/goyo.vim'
call plug#end()


"
" Coc settings
" (gathered from https://github.com/neoclide/coc.nvim)

" Use k to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


