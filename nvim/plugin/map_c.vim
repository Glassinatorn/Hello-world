"	8""""8
"	8    "
"	8e
"	88
"	88   e
"	88eee8

autocmd FileType c inoremap ,in
    \ #include <><Esc>i

autocmd FileType c inoremap ,f
    \ for(int i = 0; i < ; i++) {
    \ <CR>}<Esc>k2f;i

autocmd FileType c inoremap ,if
    \ if () {
    \ <CR>}<Esc>kf(a

autocmd FileType c inoremap ,sc
    \ switch() {
    \ <CR>case <++> :
    \ <CR>break;
    \ <CR><BS>default :
    \ <CR><++>;
    \ <CR>}<Esc>5kf)i

autocmd FileType c inoremap ,ca
    \ case :
    \ <CR>break;<Esc>k>>ea<Space>

autocmd FileType c inoremap ,st
    \ struct {
    \ <CR>};<Esc>kea<Space>

autocmd FileType c inoremap ,p
    \ printf("%", <++>);<Esc>F%a

autocmd FileType c inoremap //
    \ /*  */<Esc>2hi
