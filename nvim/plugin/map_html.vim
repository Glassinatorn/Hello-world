"	8   8 ""8"" 8""8""8 8
"	8   8   8   8  8  8 8
"	8eee8   8e  8e 8  8 8e
"	88  8   88  88 8  8 88
"	88  8   88  88 8  8 88
"	88  8   88  88 8  8 88eee

autocmd FileType html inoremap ,b
    \ <b></b><Esc>2ba

autocmd FileType html inoremap ,button
    \ <button class="" on_click="<++>"><++></button><Esc>0f"a

autocmd FileType html inoremap ,script
    \ <script></script><Esc>2ba
autocmd FileType html inoremap ,gant
    \ gantt
    \ <CR><Tab>title
    \ <CR>dateFormat YYYY-MM-DD
    \ <CR><CR>section <++>
    \ <CR><++>      :a1, <YYYY-MM-DD>, <++>d
    \ <CR><++>      :after a1, <++>d
    \ <Esc><<5kA
