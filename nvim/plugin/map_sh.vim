autocmd FileType sh inoremap ,#
    \ #! /bin/sh<cr><cr>

autocmd FileType sh inoremap ,'
    \ '\'''\''<Esc>3hi

autocmd FileType sh inoremap ,f
    \ for ; do
    \ <CR><++>
    \ <CR>done<Esc>2kf;i

autocmd FileType sh inoremap ,i
    \ if [ ]; then
    \ <CR><++>
    \ <CR>fi<Esc>2kwa

autocmd FileType sh inoremap ,p
    \ printf "\n"<Esc>2hi

autocmd FileType sh inoremap ,s
    \ sed s//<++>/g<Esc>ba

autocmd FileType sh inoremap ,r<space>
    \ read -p "" <++><Esc>F"i

autocmd FileType sh inoremap ,aw
    \ awk '{ print $ }'<Esc>F$a

autocmd FileType sh inoremap ,ap
    \ awk '\''{ print $ }'\''<Esc>F$a
