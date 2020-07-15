"	8   8 ""8"" 8""8""8 8
"	8   8   8   8  8  8 8
"	8eee8   8e  8e 8  8 8e
"	88  8   88  88 8  8 88
"	88  8   88  88 8  8 88
"	88  8   88  88 8  8 88eee

autocmd FileType html inoremap ,b
    \ <b></b><Esc>2ba

autocmd FileType html inoremap ,a
    \ <a href=""></a><Esc>F"i

autocmd FileType html inoremap ,bu
    \ <button class="" on_click="<++>"><++></button><Esc>0f"a

autocmd FileType html inoremap ,sc
    \ <script></script><Esc>2ba

autocmd FileType html inoremap ,input
    \ <input type="" value="<++>"><Esc>bF"i

autocmd FileType html inoremap ,form
    \ <form action="" method="<++>">
    \ <CR></form><Esc>kf"a

autocmd FileType html inoremap ,ul
    \ <ul>
    \ <CR><li></li>
    \ <CR></ul>
    \ <Esc>kf/hi

autocmd FileType html inoremap ,li
    \ <li></li><Esc>2ba


""""""""""""""""""""""
"  mermaid specific  "
""""""""""""""""""""""
autocmd FileType html inoremap ,mermaid
    \ <script src="https://cdn.jsdelivr.net/npm/mermaid@8.4.0/dist/mermaid.min.js">
    \ <CR>mermaid.initialize({startOnLoad:true});
    \ <CR></script>
    \ <Esc>3kJj>>..jA<BS>

autocmd FileType html inoremap ,gant
    \ gantt
    \ <CR><Tab>title
    \ <CR>dateFormat YYYY-MM-DD
    \ <CR><CR>section <++>
    \ <CR><++>      :a1, <YYYY-MM-DD>, <++>d
    \ <CR><++>      :after a1, <++>d
    \ <Esc><<5k

autocmd FileType html inoremap ,flow
    \ <div class="mermaid">
    \ <CR>graph TD
    \ <CR>--> <++>
    \ <CR></div><Esc>kI

autocmd FileType html inoremap ,it
    \ <CR>--> <++><Esc>I


"""""""""""""""""""""
"  django specific  "
"""""""""""""""""""""
autocmd FileType html inoremap ,{
    \ {{ }}<Esc>2hi<Space>

autocmd FileType html inoremap ,%
    \ {% %}<Esc>2hi<Space>
