-- @@@  @@@  @@@  @@@  @@@  @@@@@@@@@@
-- @@@@ @@@  @@@  @@@  @@@  @@@@@@@@@@@
-- @@!@!@@@  @@!  @@@  @@!  @@! @@! @@!
-- !@!!@!@!  !@!  @!@  !@!  !@! !@! !@!
-- @!@ !!@!  @!@  !@!  !!@  @!! !!@ @!@
-- !@!  !!!  !@!  !!!  !!!  !@!   ! !@!
-- !!:  !!!  :!:  !!:  !!:  !!:     !!:
-- :!:  !:!   ::!!:!   :!:  :!:     :!:
-- ::    ::    ::::    ::   :::     ::
-- ::    :      :      :     :      :

-- starting plugin manager
vim.cmd [[packadd packer.nvim]]

local packer = require('packer').startup(function()
    use {'wbthomason/packer.nvim'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'easymotion/vim-easymotion'}
    use {'sbdchd/neoformat'}
    use {'sirver/ultisnips'}
    use {'mattn/emmet-vim'}
    use {'erietz/vim-terminator'}
    use {'glassinatorn/figlet-banner'}
    use {'glassinatorn/light-toggle'}
    use {'christianchiarulli/nvcode-color-schemes.vim'}
    use {'puremourning/vimspector'}
    use {'williamboman/nvim-lsp-installer'}
    use {'RishabhRD/popfix'}
    use {'RishabhRD/nvim-lsputils'}
    use {'szw/vim-maximizer'}
    use {'lervag/vimtex'}
    use {'ggandor/lightspeed.nvim'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'nvim-lua/plenary.nvim'}		-- function wrappers for git plugin
    use {'lewis6991/gitsigns.nvim'}		-- git integration
    use {'jbyuki/instant.nvim'}		-- pair programing
    use {'akinsho/flutter-tools.nvim'}
end)



-- loading settings
require('settings')                     -- general settings
require('maps')                         -- keybindings
require('lsp_config')                   -- config for lsp
require('treesitter_config')            -- treesitter config
require('compe_config')
