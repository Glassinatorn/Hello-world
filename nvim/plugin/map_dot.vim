autocmd BufWritePost *.dot :! dot -Tpng %:r.dot -o %:r.png

autocmd FileType dot nnoremap <leader>fd
    \ :w<CR> :! sfdp -Tpng %:r.dot -o %:r.png<CR>

autocmd FileType dot inoremap ,class
    \ [label = "{<++> \| + <++> \n+ <++> \| + <++>()...}"]
    \ <CR><++> -> <++> [arrowtail=odiamond]
    \ <Esc>kI

autocmd FileType dot inoremap ,it
    \ <Esc>o-> <++> [ arrowhead=normal ]<Esc>I

autocmd FileType dot nnoremap ,it
    \ o-> <++> [ arrowhead=normal ]<Esc>I

autocmd FileType dot inoremap ,la
    \ label=""<Esc>ha

autocmd FileType dot inoremap ,pic
    \ image=""<Esc>ha

autocmd FileType dot inoremap ,sh
    \ shape=box width=0.75 height=0.5 <Esc>

autocmd FileType dot inoremap ,po
    \ pos=",<++>!" <Esc>F,i

autocmd FileType dot inoremap ,sub
    \ subgraph {
    \ <CR><Tab>label="<++>"
    \ <CR>style=filled
    \ <CR>color="<++>"
    \ <CR>fillcolor="<++>"
    \ <CR><BS>}<Esc>5kea<Space>
