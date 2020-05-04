autocmd BufWritePost *.dot :! dot -Tpng %:r.dot -o %:r.png
autocmd FileType dot inoremap ,class
    \ number[label = "{<++> \| + <++> \n+ <++> \| + <++>()...}"]
    \ <CR>number -> <++> [arrowtail=odiamond]
    \ <Esc>k0

autocmd FileType dot inoremap ,it
    \ -> <++> [arrowhead = normal];<Esc>I

autocmd FileType dot inoremap ,la
    \ label = "",<Space><Esc>ba

autocmd FileType dot inoremap ,la
    \ label = "",<Space><Esc>ba

autocmd FileType dot inoremap ,sh
    \ shape=box, width=0.75, height=0.5, <Esc>
