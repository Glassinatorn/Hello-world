vim.o.completeopt = "menuone,noselect"

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  },
})
