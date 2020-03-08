autocmd FileType rust inoremap ,print
    \ println!()<Esc>i

autocmd FileType rust inoremap ,match
    \ match  {
    \ <CR><++> => <++>,
    \ <CR>}<Esc>2kwhi

