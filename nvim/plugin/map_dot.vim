autocmd BufWritePost *.tex :! pdflatex %:p && rm %:r.log %:r.aux
autocmd FileType dot inoremap ,class
    \ number[label = "{<++> \| + <++> \n+ <++> \| + <++>()...}"]
    \ <CR>number -> <++> [arrowtail=odiamond]
    \ <Esc>k0
