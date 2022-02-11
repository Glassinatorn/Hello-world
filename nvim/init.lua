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
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'quangnguyen30192/cmp-nvim-ultisnips'}
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
    use {'neovim/nvim-lspconfig'}
    use {'RishabhRD/nvim-lsputils'}
    use {'RishabhRD/popfix'}
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
require('cmp_config')
