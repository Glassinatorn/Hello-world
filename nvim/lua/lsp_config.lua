-- Import lspconfig for easier configs
local nvim_lsp = require('lspconfig')

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "clangd", "tsserver", "vimls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{}
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = false,
        update_in_insert = false
    })

