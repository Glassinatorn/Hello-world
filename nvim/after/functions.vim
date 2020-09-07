"  @@@@@@@@  @@@  @@@  @@@  @@@   @@@@@@@  @@@@@@@  @@@   @@@@@@   @@@  @@@    @@@@@@
"  @@@@@@@@  @@@  @@@  @@@@ @@@  @@@@@@@@  @@@@@@@  @@@  @@@@@@@@  @@@@ @@@   @@@@@@@
"  @@!       @@!  @@@  @@!@!@@@  !@@         @@!    @@!  @@!  @@@  @@!@!@@@   !@@
"  !@!       !@!  @!@  !@!!@!@!  !@!         !@!    !@!  !@!  @!@  !@!!@!@!   !@!
"  @!!!:!    @!@  !@!  @!@ !!@!  !@!         @!!    !!@  @!@  !@!  @!@ !!@!   !!@@!!
"  !!!!!:    !@!  !!!  !@!  !!!  !!!         !!!    !!!  !@!  !!!  !@!  !!!    !!@!!!
"  !!:       !!:  !!!  !!:  !!!  :!!         !!:    !!:  !!:  !!!  !!:  !!!        !:!
"  :!:       :!:  !:!  :!:  !:!  :!:         :!:    :!:  :!:  !:!  :!:  !:!       !:!
"   ::       ::::: ::   ::   ::   ::: :::     ::     ::  ::::: ::   ::   ::   :::: ::
"   :         : :  :   ::    :    :: :: :     :     :     : :  :   ::    :    :: : :

" function to paste in banners
function! s:fig(...)
    let tmp=system("figlet -f /home/glass/freetime/figlet/poison.flf", a:1)
    put=tmp
    for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        if &filetype == "vim"
            norm! k>>0i"
        elseif &filetype == "tex"
            norm! k>>0i%
        elseif &filetype == "sh"
            norm! k>>0i#
        endif
    endfor
    if &filetype == "sh"
        norm! ggO#! /bin/sh
    else
        norm! ggdd
    endif
endfunction
command! -nargs=1 Fig call s:fig(<f-args>)

" function for switching between soft and hardtabs
function! s:tabbing(...)
    if g:currentTabbing == "soft"
        echo g:currentTabbing
        set shiftwidth&
        set softtabstop&
        set noexpandtab
        let g:currentTabbing="hard"
    else
        set shiftwidth=2
        set softtabstop=2
        set expandtab
        let g:currentTabbing="soft"
    endif
endfunction
command! -nargs=0 Tabbing call s:tabbing()
autocmd FileType * nnoremap <leader><Tab>
    \ :Tabbing<cr>

" function for switching dark and light colorscheme
function! s:colorswitch(...)
    if g:color == "dark"
        let g:color="light"
        set termguicolors
        colorscheme ayu
    else
        set notermguicolors
        colorscheme mono_tl
        let g:color="dark"
    endif
endfunction
command! -nargs=0 Colorswitch call s:colorswitch()
autocmd FileType * nnoremap <leader>sw
    \ :Colorswitch<cr>

" 'fix' linting errors with easymotion
function! EasyMotionCoc() abort
  if EasyMotion#is_active()
    let g:easymotion#is_active = 1
    CocDisable
  else
    if g:easymotion#is_active == 1
      let g:easymotion#is_active = 0
      CocEnable
    endif
  endif
endfunction
autocmd TextChanged,CursorMoved * call EasyMotionCoc()
