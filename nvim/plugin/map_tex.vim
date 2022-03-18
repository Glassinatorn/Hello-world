"	""8""
"	  8   eeee e    e
"	  8e  8    8    8
"	  88  8eee eeeeee
"	  88  88   88   8
"	  88  88ee 88   8


autocmd FileType tex inoremap ,i
    \ <CR>\item

autocmd FileType tex nnoremap ,i
    \ o\item

autocmd FileType tex inoremap ,bf
    \ \textbf{}<Esc>i

autocmd FileType tex inoremap ,<Tab>
    \ \noindent<Space>

autocmd FileType tex inoremap ,<CR>
    \ \setlength{\parskip}{9pt}

autocmd FileType tex inoremap ,ci
    \ \cite{}<Esc>i

autocmd FileType tex inoremap ""
    \ ``''<Esc>hi

autocmd FileType tex inoremap ,r
    \ \ref{}<Esc>i
