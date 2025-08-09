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
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'nvim-treesitter/nvim-treesitter',
    'windwp/nvim-autopairs',
    'rafamadriz/friendly-snippets',
    'sbdchd/neoformat',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'mattn/emmet-vim',
    'erietz/vim-terminator',
    'glassinatorn/figlet-banner',
    'glassinatorn/light-toggle',
    'christianchiarulli/nvcode-color-schemes.vim',
    'puremourning/vimspector',
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
    'RishabhRD/nvim-lsputils',
    'RishabhRD/popfix',
    'szw/vim-maximizer',
    'lervag/vimtex',
    'ggandor/lightspeed.nvim',
    'norcalli/nvim-colorizer.lua',
    'nvim-lua/plenary.nvim',                            -- function wrappers for git plugin
    'lewis6991/gitsigns.nvim',                          -- git integration
    'jbyuki/instant.nvim',                              -- pair programing
    'akinsho/flutter-tools.nvim',
    'dstein64/vim-startuptime',
    'roxma/vim-tmux-clipboard',                         -- clipboard integration with tmux
    'daeyun/vim-matlab',
    'nvim-telescope/telescope.nvim',
    'MunifTanjim/nui.nvim',
    'chomosuke/typst-preview.nvim',
})


-- loading settings
require('settings')                     -- general settings
require('maps')                         -- keybindings
require('lsp_config')                   -- config for lsp
require('treesitter_config')            -- treesitter config
require("flutter-tools").setup{} -- use defaults
