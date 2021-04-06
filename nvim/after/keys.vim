
"     @@@@@@@   @@@@@@    @@@@@@@             @@@  @@@  @@@  @@@  @@@  @@@@@@@@@@
"    @@@@@@@@  @@@@@@@@  @@@@@@@@             @@@@ @@@  @@@  @@@  @@@  @@@@@@@@@@@
"    !@@       @@!  @@@  !@@                  @@!@!@@@  @@!  @@@  @@!  @@! @@! @@!
"    !@!       !@!  @!@  !@!                  !@!!@!@!  !@!  @!@  !@!  !@! !@! !@!
"    !@!       @!@  !@!  !@!       @!@!@!@!@  @!@ !!@!  @!@  !@!  !!@  @!! !!@ @!@
"    !!!       !@!  !!!  !!!       !!!@!@!!!  !@!  !!!  !@!  !!!  !!!  !@!   ! !@!
"    :!!       !!:  !!!  :!!                  !!:  !!!  :!:  !!:  !!:  !!:     !!:
"    :!:       :!:  !:!  :!:                  :!:  !:!   ::!!:!   :!:  :!:     :!:
"     ::: :::  ::::: ::   ::: :::              ::   ::    ::::     ::  :::     ::
"     :: :: :   : :  :    :: :: :             ::    :      :      :     :      :

" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <c-n> coc#refresh()
inoremap <silent><expr> <c-p> coc#refresh()

" go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" find references
nmap <silent> gr <Plug>(coc-references)

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list available commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when language server gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)<cr>
nmap <leader>ca  <Plug>(coc-codeaction-selected)<cr>

" go through diagnostics in the code
nmap <silent> <leader>h <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>l <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" toggle diagnostics when easymotion is used
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" easymotion word forward and backwards
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>b <Plug>(easymotion-b)

" Create markmap from file or selected text
nmap <Leader>m <Plug>(coc-markmap-create)
vmap <Leader>m <Plug>(coc-markmap-create-v)

" Install coc packages
nmap <Leader>ci :CocInstall<space>
