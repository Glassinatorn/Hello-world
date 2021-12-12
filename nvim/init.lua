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
vim.cmd 'packadd paq-nvim'              -- load the package manager
local paq = require('paq')		-- a convenient alias
paq {'savq/paq-nvim'}			-- paq-nvim manages itself


-- the rest of the plugins
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
--paq {'hrsh7th/nvim-compe'}
paq {'easymotion/vim-easymotion'}
paq {'sbdchd/neoformat'}
paq {'sirver/ultisnips'}
paq {'mattn/emmet-vim'}
paq {'erietz/vim-terminator'}
paq {'glassinatorn/figlet-banner'}
paq {'glassinatorn/light-toggle'}
paq {'christianchiarulli/nvcode-color-schemes.vim'}
paq {'puremourning/vimspector'}
paq {'kabouzeid/nvim-lspinstall'}
paq {'RishabhRD/popfix'}
paq {'RishabhRD/nvim-lsputils'}
paq {'szw/vim-maximizer'}
paq {'lervag/vimtex'}
paq {'ggandor/lightspeed.nvim'}
paq {'norcalli/nvim-colorizer.lua'}
paq {'nvim-lua/plenary.nvim'}		-- function wrappers for git plugin
paq {'lewis6991/gitsigns.nvim'}		-- git integration
paq {'jbyuki/instant.nvim'}		-- pair programing
paq {'ms-jpq/coq_nvim'}			-- completion plugin
paq {'ms-jpq/coq.artifacts'}		-- snippets for coq
paq {'nvim-lua/plenary.nvim'}
paq {'akinsho/flutter-tools.nvim'}

require("flutter-tools").setup{} -- use defaults

-- loading settings
require('settings')                     -- general settings
require('maps')                         -- keybindings
-- require('lsp_config')                   -- config for lsp
require('treesitter_config')            -- treesitter config
require('coq_settings')
-- require('compe_config')
