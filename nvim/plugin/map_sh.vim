autocmd FileType sh inoremap ,#
    \ #! /bin/sh<cr><cr>

autocmd FileType sh inoremap ,'
    \ '\'''\''<Esc>3hi

autocmd FileType sh inoremap ,f
    \ for [ ]; then
    \ <CR><++>
    \ <CR>done<Esc>2kwa<Space>

autocmd FileType sh inoremap ,i
    \ if [ ]; then
    \ <CR><++>
    \ <CR>fi<Esc>2kwa

autocmd FileType sh inoremap ,p
    \ printf ""<Esc>i

autocmd FileType sh inoremap ,r
    \ #
    \ <CR>DEFAULT='Y'
    \ <CR>read -e -p "<++> [Y/n]:"
    \ <CR>CHOICE="${CHOICE:-${DEFAULT}}"
    \ <Esc>4ka<Space>

autocmd FileType sh inoremap ,ir
    \ #
    \ <CR>DEFAULT='<++>'
    \ <CR>read -p "<++> [Y/n]:" CHOICE
    \ <CR>CHOICE="${CHOICE:-${DEFAULT}}"
    \ <CR><CR>if [ $CHOICE = 'y'] \|\| [ $CHOICE = 'Y' ]; then
    \ <CR><++>
    \ <CR>fi<Esc>7ka

autocmd FileType sh inoremap ,cr
    \ #
    \ <CR>DEFAULT='<++>'
    \ <CR>read -p "<++> [Y/n]:" CHOICE
    \ <CR>CHOICE="${CHOICE:-${DEFAULT}}"
    \ <CR><CR>case $CHOICE in
    \ <CR><++>)
    \ <CR>;;
    \ <CR>*)
    \ <CR>esac<Esc>


autocmd FileType sh inoremap ,aw
    \ awk '{ print $ }'<Esc>F$a

autocmd FileType sh inoremap ,ai
    \ awk '{ \
    \ <CR>if ($1 == "" \|\| $1 == "<++>") \
    \ <CR><Tab>print $<++> \
    \ <CR>}'<Esc>2kf"a

autocmd FileType sh inoremap ,ap
    \ awk '\''{ print $ }'\''<Esc>F$a

autocmd FileType sh inoremap ,c
    \ case $ in
    \ <CR><++>)
    \ <CR>;;
    \ <CR>*)
    \ <CR>esac<Esc>4kwa
