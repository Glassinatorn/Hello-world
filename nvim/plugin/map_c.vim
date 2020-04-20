"	8""""8
"	8    "
"	8e
"	88
"	88   e
"	88eee8

autocmd FileType c inoremap ,inc
    \ #include <.h><Esc>F.i

autocmd FileType c inoremap ,main
    \ int main (int argc, char **argv) {
    \ <CR>return 0;
    \ <CR>}<Esc>kO

autocmd FileType c inoremap ,for
    \ for(int i = 0; i < ; i++) {
    \ <CR>}<Esc>O

autocmd FileType c inoremap ,if
    \ if () {
    \ <CR>}<Esc>kf(a

autocmd FileType c inoremap ,switch
    \ switch() {
    \ <CR>case <++> :
    \ <CR>break;
    \ <CR><BS>default :
    \ <CR><++>;
    \ <CR>}<Esc>5kf)i

autocmd FileType c inoremap ,case
    \ case :
    \ <CR>break;<Esc>k>>ea<Space>

autocmd FileType c inoremap ,struct
    \ struct {
    \ <CR>};<Esc>kea<Space>

autocmd FileType c inoremap ,print
    \ printf("%", <++>);<Esc>F%a
