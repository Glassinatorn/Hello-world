local cmd = vim.cmd	-- commands
local bo = vim.bo	-- buffer
local o = vim.o		-- general
local g = vim.general

-- syntax and text settings
cmd [[ filetype plugin indent on ]]
cmd [[ syntax on ]]
o.hlsearch = false			-- multiple highlight for search
o.updatetime = 300			-- ms between swap is written
o.clipboard = "unnamedplus"
cmd [[ let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' ) ]]


-- tabbing settings
bo.tabstop = 4
bo.expandtab = true
bo.shiftwidth = 4
bo.autoindent = true
bo.smartindent = true
bo.cindent = true

-- colorscheme settings
o.termguicolors = true			-- enables 24-bit colors
o.background = "dark"			-- set background to dark
nvcode_termcolors = 256			-- colorspace for nvcode
cmd [[ colorscheme nord ]]		-- setting colorscheme

-- folding settings
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
-- cmd [[ autocmd BufReadPost,FileReadPost * normal zR ]]
cmd [[ autocmd BufWinLeave *.lua,*.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim,*.json silent! mkview ]]	    -- load folds
cmd [[ autocmd BufWinEnter *.lua,*.py,*.c,*.sh,*.rs,*.js,*.html,*.css,*.vim,*.json silent! loadview ]]	    -- save folds

-- loading skeletons
cmd [[ autocmd BufNewFile *.c  0r /usr/share/nvim/runtime/skeletons/skeleton.c ]]
cmd [[ autocmd BufNewFile *.h  0r /usr/share/nvim/runtime/skeletons/skeleton.h ]]
cmd [[ autocmd BufNewFile *.cpp  0r /usr/share/nvim/runtime/skeletons/skeleton.cpp ]]
cmd [[ autocmd BufNewFile *.html  0r /usr/share/nvim/runtime/skeletons/skeleton.html ]]
cmd [[ autocmd BufNewFile *.dot  0r /usr/share/nvim/runtime/skeletons/skeleton.dot ]]
cmd [[ autocmd BufNewFile doc_*  0r /usr/share/nvim/runtime/skeletons/documentation.txt ]]

-- ultisnips
--vim.api.nvim_set_var("UltiSnipsExpandTrigger", "<tab>")
vim.api.nvim_set_var("UltiSnipsJumpForwardTrigger", "<tab>")

-- color highlighter
require'colorizer'.setup()

-- git integration
require('gitsigns').setup()

-- setting global for plugin
vim.api.nvim_set_var("Toggle_color_1", "nord")
vim.api.nvim_set_var("Toggle_color_2", "yui")
