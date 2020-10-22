autocmd FileType python inoremap ,p
    \ print()<Esc>i

autocmd FileType python inoremap ,f
    \ for  in <++>:<Esc>Frla

autocmd FileType python inoremap ,r
    \ range()<Esc>i

autocmd FileType python inoremap ,i
    \ if :<Esc>i

autocmd FileType python inoremap ,s
    \ switch () {
    \ <CR>case <>: <++>;
    \ <CR>break:
    \ <CR>}

autocmd FileType python inoremap ,d
    \ def ():
    \ <CR>"""
    \ <CR><++>
    \ <CR>"""
    \ <Esc>3kF(i

autocmd FileType python inoremap ,D
    \ def (<++>):
    \ <CR>"""
    \ <CR><CR>Parameters
    \ <CR>----------
    \ <CR><++> : <++>
    \ <CR><CR>Returns
    \ <CR>-------
    \ <CR><Tab><++>
    \ <CR><BS>"""<Esc>10kF(i
