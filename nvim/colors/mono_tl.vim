" File              : mono_tl.vim
" Author            : Axel GB (All credits goes to Matthieu Petiteau / smallwat3r)
" https://github.com/smallwat3r/vim-mono_sw
"
" mono_tl vim colorscheme.
" A very simple and efficient grayscale scheme with a little touch of cyan.

hi clear

if exists("syntax on")
  syntax reset
endif

let g:colors_name = "mono_tl"
set background=dark

"
" Colors
"
hi Normal           ctermfg=245  ctermbg=NONE   cterm=NONE
hi Constant         ctermfg=250  ctermbg=NONE   cterm=NONE

hi Character        ctermfg=250  ctermbg=234    cterm=NONE
hi Comment          ctermfg=240  ctermbg=NONE   cterm=italic
hi String           ctermfg=51   ctermbg=NONE   cterm=italic

hi Number           ctermfg=51   ctermbg=NONE   cterm=NONE
hi Float            ctermfg=51   ctermbg=NONE   cterm=NONE
hi Boolean          ctermfg=250  ctermbg=NONE   cterm=italic
hi Identifier       ctermfg=51   ctermbg=NONE   cterm=NONE

hi Include          ctermfg=245  ctermbg=NONE   cterm=NONE
hi Function         ctermfg=51   ctermbg=NONE   cterm=NONE
hi Statement        ctermfg=51   ctermbg=NONE   cterm=NONE
hi Conditional      ctermfg=51   ctermbg=NONE   cterm=NONE
hi Operator         ctermfg=51   ctermbg=NONE   cterm=NONE
hi Repeat           ctermfg=51   ctermbg=NONE   cterm=NONE

hi NonText          ctermfg=234  ctermbg=NONE   cterm=NONE
hi Type             ctermfg=253  ctermbg=NONE   cterm=NONE
hi linenr           ctermfg=240  ctermbg=234    cterm=NONE
hi Visual           ctermfg=233  ctermbg=243    cterm=NONE

hi Special          ctermfg=51   ctermbg=NONE   cterm=NONE
hi SpecialChar      ctermfg=51   ctermbg=NONE   cterm=NONE
hi SpecialKey       ctermfg=51   ctermbg=NONE   cterm=NONE

hi MatchParen       ctermfg=250  ctermbg=245    cterm=NONE
hi ColorColumn      ctermfg=NONE ctermbg=236    cterm=NONE

hi Cursor           ctermfg=240  ctermbg=NONE   cterm=NONE
hi CursorLine       ctermfg=240  ctermbg=234    cterm=NONE
hi CursorLineNR     ctermfg=250  ctermbg=NONE   cterm=NONE
hi Folded           ctermfg=51   ctermbg=NONE   cterm=NONE
hi FoldedColumn     ctermfg=250  ctermbg=NONE   cterm=NONE

hi VertSplit        ctermfg=233  ctermbg=234    cterm=NONE
hi SignColumn       ctermfg=233  ctermbg=234    cterm=NONE

hi IncSearch        ctermfg=51   ctermbg=243    cterm=NONE
hi Search           ctermfg=226  ctermbg=NONE   cterm=NONE

hi TODO             ctermfg=19   ctermbg=NONE   cterm=italic
hi Error            ctermfg=51   ctermbg=NONE   cterm=NONE
hi ErrorMsg         ctermfg=51   ctermbg=NONE   cterm=underline

hi PreProc          ctermfg=245  ctermbg=NONE   cterm=NONE
hi Title            ctermfg=51   ctermbg=NONE   cterm=bold
hi WildMenu         ctermfg=51   ctermbg=NONE   cterm=NONE
hi Pmenu            ctermfg=51   ctermbg=233    cterm=NONE
hi Underlined       ctermfg=51   ctermbg=NONE   cterm=underline
hi Directory        ctermfg=51   ctermbg=NONE   cterm=bold

hi htmlTagName      ctermfg=255  ctermbg=NONE   cterm=NONE
hi pythonEscape     ctermfg=51   ctermbg=NONE   cterm=bold
hi SpellBad         ctermfg=3    ctermbg=NONE   cterm=bold cterm=underline
hi SpellCap         ctermfg=4    ctermbg=NONE   cterm=bold cterm=underline
hi SpellRare        ctermfg=NONE ctermbg=NONE   cterm=NONE
hi SpellLocal       ctermfg=4    ctermbg=NONE   cterm=bold cterm=underline
hi StatusLine       ctermfg=NONE  ctermbg=NONE  cterm=NONE
