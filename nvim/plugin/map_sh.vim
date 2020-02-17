autocmd FileType sh inoremap ,#
    \ #! /bin/sh

autocmd FileType sh inoremap ,for
    \ for [ ]
    \ <CR>then
    \ <CR><++>
    \ <CR>done<Esc>3kwa<Space>

autocmd FileType sh inoremap ,if
    \ if [ ]
    \ <CR>then
    \ <CR><++>
    \ <CR>done<Esc>3kwa<Space>

autocmd FileType sh inoremap ,case
    \ case $ in
    \ <CR><++>)
    \ <CR>;;
    \ <CR>*)
    \ <CR>esac<Esc>4kwa
