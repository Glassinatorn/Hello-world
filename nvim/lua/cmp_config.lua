vim.o.completeopt = "menuone,noselect"
local cmp = require('cmp')
 
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'vsnip' },
    { name = 'friendly-snippets' },
    { name = 'nvim_lsp' },
  },
})
