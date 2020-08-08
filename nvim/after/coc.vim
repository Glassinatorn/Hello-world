
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

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Create markmap from the whole file
nmap <Leader>m <Plug>(coc-markmap-create)
" Create markmap from the selected lines
vmap <Leader>m <Plug>(coc-markmap-create-v)

