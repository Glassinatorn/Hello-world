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

" automatically delete trailing whitespaces on filesave
autocmd BufWritePre * %s/\s\+$//e

" setting folding method
set foldmethod=manual

" setting paste
set clipboard=unnamedplus

function! s:reload()
    source /usr/share/nvim/runtime/plugin/map_c.vim
    source /usr/share/nvim/runtime/plugin/map_doc.vim
    source /usr/share/nvim/runtime/plugin/map_html.vim
    source /usr/share/nvim/runtime/plugin/map_tex.vim
    source /usr/share/nvim/runtime/plugin/map_xml.vim
    source /home/glass/.config/nvim/init.vim
endfunction
command! -nargs=0 Reload call s:reload()

function! s:figlet(...)
    put=system('figlet -f /home/glass/Freetime/Figlet/computer.flf',  a:1)
    for i in [1, 2, 3, 4, 5, 6]
        if &filetype == 'vim'
            norm! k>>0i"
        elseif &filetype == 'tex'
            norm! k>>0i%
        elseif &filetype == 'sh'
            norm! k>>0i#
        endif
    endfor
    if &filetype == 'sh'
        norm! ggO#! /bin/sh
    else
        norm! ggdd
    endif
endfunction
command! -nargs=1 Figlet call s:figlet(<f-args>)


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
autocmd BufNewFile	*.tex		0r	/usr/share/nvim/runtime/skeletons/skeleton.tex
autocmd BufNewFile	*.c		0r	/usr/share/nvim/runtime/skeletons/skeleton.c
autocmd BufNewFile	*.h		0r	/usr/share/nvim/runtime/skeletons/skeleton.h
autocmd BufNewFile	*.cpp		0r	/usr/share/nvim/runtime/skeletons/skeleton.cpp
autocmd BufNewFile	doc_*		0r	/usr/share/nvim/runtime/skeletons/documentation.txt


" plugins
call plug#begin()
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" auto-closing preview
let g:ycm_autoclose_preview_window_after_completion = "1"

nnoremap <F5> :call VimWriteRoom()<CR>