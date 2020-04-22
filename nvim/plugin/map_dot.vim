autocmd BufWritePost *.dot :! dot -Tpng %:r.dot -o %:r.png
autocmd FileType dot inoremap ,class
    \ number[label = "{<++> \| + <++> \n+ <++> \| + <++>()...}"]
    \ <CR>number -> <++> [arrowtail=odiamond]
    \ <Esc>k0
