local g = vim.g
local map = vim.api.nvim_set_keymap

-- setting mapleader
g.mapleader = ' '

-- lsp actions
map('n', '<leader>h', ':lua vim.lsp.diagnostic.goto_prev()<CR>',    { noremap = true })
map('n', '<leader>l', ':lua vim.lsp.diagnostic.goto_next()<CR>',    { noremap = true })
map('n', '<leader>a', ':lua vim.lsp.buf.code_action()<CR>',	    { noremap = true })
map('n', '<leader>d', ':lua vim.lsp.buf.definition()<CR>',	    { noremap = true })
map('n', '<leader>D', ':lua vim.lsp.buf.declaration()<CR>',	    { noremap = true })
map('n', '<leader>r', ':lua vim.lsp.buf.references()<CR>',	    { noremap = true })
map('n', '<leader>i', ':lua vim.lsp.buf.implementation()<CR>',	    { noremap = true })
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>',		    { noremap = true })
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>',			    { noremap = true })

-- nice to haves
map('i', 'kj', '<Esc>',			    { noremap = true })	    -- escape insert
map('i', 'jk', '<Esc>',	    		    { noremap = true })	    -- escape insert
map('n', 'zz', 'z=',	    		    { noremap = true })	    -- fix spelling
map('n', 'z<space>', 'za',  		    { noremap = true })	    -- toggle fold
map('i', '<C-s>', '<Esc>:w<CR>a',	    { noremap = true })	    -- save with control-s
map('n', '<C-s>', ':w<CR>',		    { noremap = true })	    -- save with control-s
map('n', '<leader>fo', ':Neoformat<CR>',    { noremap = true })	    -- formatting

-- spelling bindings
map('n', '<leader>us', ':setlocal spell! spelllang=en<CR>', { noremap = true }) -- check english spelling
map('n', '<leader>se', ':setlocal spell! spelllang=se<CR>', { noremap = true }) -- check swedish spelling

-- easymotion
map('n', '<space>j', '<Plug>(easymotion-j)', { noremap = true }) -- go down
map('n', '<space>k', '<Plug>(easymotion-k)', { noremap = true }) -- go up

-- vimspector 
map('n', '<leader>db', ':call vimspector#Launch()<CR>', { noremap = true })
map('n', '<leader>drm', ':call vimspector#Reset()<CR>', { noremap = true })
map('n', '<leader>dbr', ':call vimspector#ToggleBreakpoint()<CR>', { noremap = true })
map('n', '<leader>dl', ':call vimspector#Continue()<CR>', { noremap = true })
