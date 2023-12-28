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
--vim.cmd [[packadd packer.nvim]]
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
    'wbthomason/packer.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'windwp/nvim-autopairs',
    'rafamadriz/friendly-snippets',
    'sbdchd/neoformat',
    'hrsh7th/cmp-vsnip',
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
    'github/copilot.vim',
    'nvim-telescope/telescope.nvim',
    'eandrju/cellular-automaton.nvim',                  -- make the code melt
    {
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
      -- optional configuration
         keymaps = {
             submit = "<C-e>",
           },
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    }
})


-- loading settings
require('settings')                     -- general settings
require('maps')                         -- keybindings
require('lsp_config')                   -- config for lsp
require('treesitter_config')            -- treesitter config
require('cmp_config')
require("flutter-tools").setup{} -- use defaults
