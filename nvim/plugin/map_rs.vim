autocmd FileType rust inoremap ,pri
    \ println!("");<Esc>F"i

autocmd FileType rust inoremap ,mat
    \ match  {
    \ <CR><++> => <++>,
    \ <CR>}<Esc>2kwhi

autocmd FileType rust inoremap ,str
    \ String::from("");<Esc>2hi

autocmd FileType rust inoremap ,try
    \ match {
    \ <CR>Ok(<++>) => <++>,
    \ <CR>Err(error) => {
    \ <CR>println!("ERROR: {:?}", error)
    \ <CR>},
    \ <CR>};
