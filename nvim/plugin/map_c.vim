"	8""""8
"	8    "
"	8e
"	88
"	88   e
"	88eee8


autocmd FileType c inoremap ,main
	\ int main (int argv, char **argc) {
	\ <CR>return 0;
	\ <CR>}<Esc>kO

autocmd FileType c inoremap ,for
	\ <CR>for(int i = 0; i < ; i++) {
	\ <CR>}<Esc>k

