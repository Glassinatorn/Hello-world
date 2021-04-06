
"     @@@@@@   @@@  @@@  @@@  @@@@@@@   @@@@@@@   @@@@@@@@  @@@@@@@   @@@@@@
"    @@@@@@@   @@@@ @@@  @@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@  @@@@@@@
"    !@@       @@!@!@@@  @@!  @@!  @@@  @@!  @@@  @@!         @@!    !@@
"    !@!       !@!!@!@!  !@!  !@!  @!@  !@!  @!@  !@!         !@!    !@!
"    !!@@!!    @!@ !!@!  !!@  @!@@!@!   @!@@!@!   @!!!:!      @!!    !!@@!!
"     !!@!!!   !@!  !!!  !!!  !!@!!!    !!@!!!    !!!!!:      !!!     !!@!!!
"         !:!  !!:  !!!  !!:  !!:       !!:       !!:         !!:         !:!
"        !:!   :!:  !:!  :!:  :!:       :!:       :!:         :!:        !:!
"    :::: ::    ::   ::   ::   ::        ::        :: ::::     ::    :::: ::
"    :: : :    ::    :   :     :         :        : :: ::      :     :: : :

" global snippets
autocmd FileType * inoremap ,<space>n
    \ <++>

autocmd FileType * inoremap ,im
    \ autocmd FileType inoremap ,<++>
    \ <Esc>2bi

autocmd FileType * inoremap ,nm
    \ autocmd FileType nnoremap ,<++>
    \ <Esc>2bi

autocmd FileType * inoremap ,ma
    \ autocmd FileType map < leader>
    \ <Esc>bh<Del><Esc>2hi<Space>

autocmd FileType * inoremap  ,\
    \ <Tab>\ <CR ><Esc>hxA

autocmd FileType * inoremap ""
    \ ""<Esc>i

autocmd FileType * inoremap {}
    \ {
    \ <CR>}<Esc>O

autocmd FileType * inoremap ()
    \ ()<Esc>i

autocmd FileType * inoremap []
    \ []<Esc>i

autocmd FileType * inoremap <>
    \ <><Esc>i

" shortcut to jump to next step in snippets
noremap <Space>n <Esc>/<++><Enter>"_c4l

" manually sourcing snippets
nnoremap <leader>tex :set filetype=tex<CR>
nnoremap <leader>xml :set filetype=xml<CR>
nnoremap <leader>css :set filetype=css<CR>
nnoremap <leader>Js  :set filetype=javascript<CR>
nnoremap <leader>c   :set filetype=c<CR>
nnoremap <leader>py  :set filetype=python<CR>
