autocmd FileType javascript inoremap ,log
    \ console.log();<Esc>ba

autocmd FileType javascript inoremap ,for
    \ for (let i = 0; i <; i++) {
    \ <CR>}<Esc>kf<a<Space>

autocmd FileType javascript inoremap ,if
    \ if () {
    \ <CR>}<Esc>kf(a
