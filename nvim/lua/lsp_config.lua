require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- choosing lsp servers 
lspconfig.bashls.setup{capabilities = capabilities} -- shell
lspconfig.pyright.setup{capabilties = capabilities} -- python
lspconfig.lua_ls.setup{capabilities = capabilities} -- lua
lspconfig.clangd.setup{capabilities = capabilities} -- c & c++
lspconfig.dartls.setup{capabilities = capabilities} -- dart
lspconfig.eslint.setup{capabilities = capabilities} -- js
lspconfig.vimls.setup{capabilities = capabilities} -- vim
lspconfig.rust_analyzer.setup{capabilities = capabilities} -- rust
lspconfig.dockerls.setup{capabilities = capabilities} -- docker

-- configuring how language servers are supposed to display diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false
    })


-- tying lsp actions to lsputils
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
