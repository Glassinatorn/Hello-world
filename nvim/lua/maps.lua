local g = vim.g
local map = vim.api.nvim_set_keymap

-- setting mapleader
g.mapleader = ' '


-- cmp bindings
-- local cmp = require("cmp")
-- cmp.setup({
--    mapping = cmp.mapping.preset.insert({
--
--	["<S-k>"] = cmp.mapping.select_prev_item(),
--	["<S-j>"] = cmp.mapping.select_next_item(),
--	["<CR>"] = cmp.mapping.confirm {
--	    behavior = cmp.ConfirmBehavior.Replace,
--	    select = true,
 --     },
  --  })
--})

-- vsnip
vim.cmd[[ imap <expr> jk   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : 'jk' ]]	    			-- jumping to and expanding snippet

-- lsp actions
map('n', '<leader>h',       	':lua vim.diagnostic.goto_prev()<CR>',				    { noremap = true })	-- go to previous diagnostic
map('n', '<leader>l',       	':lua vim.diagnostic.goto_next()<CR>',			    	{ noremap = true })	-- go to next diagnostic
map('n', '<leader>a',       	':lua vim.lsp.buf.code_action()<CR>',			    	{ noremap = true })	-- code action
map('n', '<leader>d',       	':lua vim.lsp.buf.definition()<CR>',			    	{ noremap = true })	-- go to definition
map('n', '<leader>D',       	':lua vim.lsp.buf.declaration()<CR>',			    	{ noremap = true })	-- go to declaration
map('n', '<leader>r',       	':lua vim.lsp.buf.references()<CR>',			    	{ noremap = true })	-- show references
map('n', '<leader>i',       	':lua vim.lsp.buf.implementation()<CR>',		    	{ noremap = true })	-- go to implementation
map('n', '<leader>rn',      	':lua vim.lsp.buf.rename()<CR>',			            { noremap = true })	-- dynamically rename variables
map('n', 'K',               	':lua vim.lsp.buf.hover()<CR>',				            { noremap = true })	-- show documentation

-- nice to haves
map('i', 'kj',              	'<Esc>',							                    { noremap = true })	-- escape
map('i', '()',              	'()<Esc>i',						                        { noremap = true })	-- insert ()
map('i', '[]',              	'[]<Esc>i',						                        { noremap = true })	-- insert []
map('i', '{}',              	'{}<Esc>i',						                        { noremap = true })	-- insert {}
map('i', '<>',              	'<><Esc>i',						                        { noremap = true })	-- insert <>
map('i', '""',              	'""<Esc>i',						                        { noremap = true })	-- insert ""
map('i', '\'\'',            	'\'\'<Esc>i',					                        { noremap = true })	-- insert ""
map('n', 'z<space>',        	'za',							                        { noremap = true })	-- toggle fold
map('i', '<C-s>',           	'<Esc>:w<CR>',					                        { noremap = true })	-- save with control-s
map('n', '<C-s>',           	':w<CR>',						                        { noremap = true })	-- save with control-s
map('n', '<leader>fo',      	':Neoformat<CR>',				                        { noremap = true })	-- formatting
map('n', '<leader>ma',      	':MaximizerToggle<CR>',		                        	{ noremap = true })	-- maximized buffer
map('n', '<leader>re',	    	':w<CR> :so ~/.config/nvim/init.lua<CR>',		    	{ noremap = true })	-- source config
map('n', '<leader>ff',	    	':lua require("telescope.builtin").find_files()<cr>',		    	{ noremap = true })	-- open file
map('n', '<leader>fr',	    	':FlutterRun<CR>',					                    { noremap = true })	-- run flutter instance
map('n', '<leader>\\\\',	    ':VimtexCompile<CR>',					                { noremap = true })	-- compile latex document

-- ChatGPT
map('n', '<leader>ch',          ':ChatGPT<CR>',					                        { noremap = true })	-- access ChatGPT
map('n', '<leader>co',          ':ChatGPTCompleteCode<CR>',					            { noremap = true })	-- ask ChatGPT to complete code
map('v', '<leader>ge', 		    '<Esc>:ChatGPTEditWithInstructions<CR>', 			    { noremap = true })	-- ask ChatGPT to modify the selected code
map('v', '<leader>gr', 		    ':ChatGPTRun ', 						                { noremap = true })	-- ask ChatGPT to run a command on selected code

-- spelling
map('n', '<leader>us',      	':setlocal spell! spelllang=en<CR>',			    	{ noremap = true })	-- check english spelling
map('n', '<leader>se',      	':setlocal spell! spelllang=se<CR>',			    	{ noremap = true })	-- check swedish spelling
map('n', 'zz',              	'z=',							                        { noremap = true })	-- fix spelling
map('n', 'zh',              	'[s',							                        { noremap = true })	-- go to previous misspelled
map('n', 'zl',              	']s',							                        { noremap = true })	-- go to next misspelled

-- vimspector
map('n', '<leader>dl',      	':call vimspector#Continue()<CR>',			            { noremap = true })	-- next step in debugging
map('n', '<leader>ds',      	':call vimspector#Reset()<CR>',				            { noremap = true })	-- reset debugger
map('n', '<leader>b',       	':call vimspector#ToggleBreakpoint()<CR>',		    	{ noremap = true })	-- toggle breakpoint
map('n', '<leader>dr',      	':call vimspector#Restart()<CR>',			            { noremap = true })	-- restart the debugger
map('n', '<leader>e',       	':call vimspector#ShowEvalBalloon(0)<CR>',		    	{ noremap = true })	-- evaluate expression under cursor
map('x', '<leader>e',       	':call vimspector#ShowEvalBalloon(1)<CR>',		    	{ noremap = true })	-- evaluate expression under cursor

-- Telescope
map('n', '<leader>ff', 		    ':lua require("telescope.builtin").fd()<CR>',		    { noremap = true })
map('n', '<leader>fg', 		    ':lua require("telescope.builtin").live_grep()<CR>',	{ noremap = true })
map('n', '<leader>fb', 		    ':lua require("telescope.builtin").buffers()<CR>',	    { noremap = true })
map('n', '<leader>fh',		    ':lua require("telescope.builtin").help_tags()<CR>',	{ noremap = true })

-- own functions
map('n', '<leader>sw',      	':lua require("light-toggle").toggle()<CR>',			{ noremap = true })	-- evaluate expression under cursor
