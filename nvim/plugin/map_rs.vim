autocmd FileType rust inoremap ,pri
    \ println!("");<Esc>F"i

autocmd FileType rust inoremap ,mat
    \ match  {
    \ <CR><++> => <++>,
    \ <CR>}<Esc>2kwhi

autocmd FileType rust inoremap ,str
    \ String::from("")<Esc>hi

autocmd FileType rust inoremap ,try
    \ match {
    \ <CR>Ok(<++>) => <++>,
    \ <CR>Err(error) => {
    \ <CR>panic!("ERROR: {:?}", error)
    \ <CR>},
    \ <CR>};<Esc>5k$Fha<Space>

autocmd FileType rust inoremap ,vec
    \ let = vec![<++>];<Esc>Fta<Space>

autocmd FileType rust inoremap ,test
    \ #[test]<Esc>
