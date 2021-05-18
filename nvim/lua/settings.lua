local cmd = vim.cmd	-- commands
local bo = vim.bo	-- buffer
local o = vim.o		-- general

-- syntax and text settings
cmd [[ filetype plugin indent on ]]
cmd [[ syntax on ]]
bo.softtabstop = 4			-- sets tabs to 4 spaces
bo.shiftwidth = 4
o.smarttab = true			-- smart tabbing
o.hlsearch = false			-- multiple highlight for search
o.updatetime = 300			-- ms between swap is written
cmd [[ set clipboard+=unnamedplus ]]	-- enables clipboard
cmd [[ let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' ) ]]

-- colorscheme settings
o.termguicolors = true			-- enables 24-bit colors
o.background = "dark"			-- set background to dark
nvcode_termcolors = 256			-- colorspace for nvcode
cmd [[ colorscheme nord ]]		-- setting colorscheme

-- folding settings
o.foldmethod = "manual"
cmd [[ autocmd BufWinLeave *.lua,*.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim silent! mkview ]]	    -- load folds
cmd [[ autocmd BufWinEnter *.lua,*.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim silent! loadview ]]	    -- save folds

-- loading skeletons
cmd [[ autocmd BufNewFile *.tex  0r /usr/share/nvim/runtime/skeletons/skeleton.tex ]]
cmd [[ autocmd BufNewFile *.c  0r /usr/share/nvim/runtime/skeletons/skeleton.c ]]
cmd [[ autocmd BufNewFile *.h  0r /usr/share/nvim/runtime/skeletons/skeleton.h ]]
cmd [[ autocmd BufNewFile *.cpp  0r /usr/share/nvim/runtime/skeletons/skeleton.cpp ]]
cmd [[ autocmd BufNewFile *.html  0r /usr/share/nvim/runtime/skeletons/skeleton.html ]]
cmd [[ autocmd BufNewFile *.dot  0r /usr/share/nvim/runtime/skeletons/skeleton.dot ]]
cmd [[ autocmd BufNewFile doc_*  0r /usr/share/nvim/runtime/skeletons/documentation.txt ]]

-- ultisnips
cmd [[ let g:UltiSnipsExpandTrigger='<tab>' ]]
cmd [[ let g:UltiSnipsJumpForwardTrigger='<cr>' ]]
