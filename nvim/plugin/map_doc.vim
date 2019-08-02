"	8""""8
"	8    8 eeeee eeee e   e eeeeeee eeee eeeee eeeee eeeee eeeee e  eeeee eeeee
"	8e   8 8  88 8  8 8   8 8  8  8 8    8   8   8   8   8   8   8  8  88 8   8
"	88   8 8   8 8e   8e  8 8e 8  8 8eee 8e  8   8e  8eee8   8e  8e 8   8 8e  8
"	88   8 8   8 88   88  8 88 8  8 88   88  8   88  88  8   88  88 8   8 88  8
"	88eee8 8eee8 88e8 88ee8 88 8  8 88ee 88  8   88  88  8   88  88 8eee8 88  8

" loading updated helfiles
autocmd BufWritePost help :helptags /usr/share/nvim/runtime/doc/

" beginning new helpfile
autocmd FileType help inoremap ,helpdef
	\ doc_.txt <Tab>Nvim
	\<CR>
	\<CR>VIM REFERENCE MANUAL <Tab> by <++><CR>
	\<CR>This document is for <++><CR>
	\<CR>The documentation links to the following:
	\<CR>1. <++><CR>
	\<CR>=============================================================================
	\<CR>1. <++><CR>
	\<CR>vim:tw=80:tabstop=4:ft=help:norl:
	\<Esc>3G>>..8G>>.ggf.i


autocmd FileType help inoremap ,==
	\ =============================================================================<CR>

autocmd FileType help inoremap ,tex
	\ LaTeX
