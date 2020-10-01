autocmd FileType sh inoremap ,#
    \ #! /bin/sh<cr><cr>

autocmd FileType sh inoremap ,'
    \ '\'''\''<Esc>3hi

autocmd FileType sh inoremap ,f
    \ for [ ]; then
    \ <CR><++>
    \ <CR>done<Esc>2kwa<Space>

autocmd FileType sh inoremap ,i<++>
    \ if [ ]; then
    \ <CR><++>
    \ <CR>fi<Esc>2kwa<Space>

autocmd FileType sh inoremap ,p
    \ printf ""<Esc>i

autocmd FileType sh inoremap ,r
    \ read -e -p "" -i "Y" CHOICE<Esc>0f"a

autocmd FileType sh inoremap ,aw
    \ awk '{ print $ }'<Esc>F$a

autocmd FileType sh inoremap ,ai
    \ awk '{ \
    \ if ($1 == "" || $1 == "<++>") \
    \ <Tab>print $<++> \
    \ }'

autocmd FileType sh inoremap ,ap
    \ awk '\''{ print $ }'\''<Esc>F$a

autocmd FileType sh inoremap ,c
    \ case $ in
    \ <CR><++>)
    \ <CR>;;
    \ <CR>*)
    \ <CR>esac<Esc>4kwa
