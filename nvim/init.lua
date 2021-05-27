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
local paq = require('paq-nvim').paq     -- a convenient alias
paq {'savq/paq-nvim', opt = true}       -- paq-nvim manages itself


-- the rest of the plugins
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'hrsh7th/nvim-compe'}
paq {'easymotion/vim-easymotion'}
paq {'sbdchd/neoformat'}
paq {'sirver/ultisnips'}
paq {'mattn/emmet-vim'}
paq {'erietz/vim-terminator'}
paq {'glassinatorn/figlet-banner'}
paq {'christianchiarulli/nvcode-color-schemes.vim'}
paq {'puremourning/vimspector'}
paq {'kabouzeid/nvim-lspinstall'}
paq {'RishabhRD/popfix'}
paq {'RishabhRD/nvim-lsputils'}


-- loading settings
require('settings')                     -- general settings
require('maps')                         -- keybindings
require('lsp_config')                   -- config for lsp
require('treesitter_config')            -- treesitter config
require('compe_config')                 -- completion with compe
