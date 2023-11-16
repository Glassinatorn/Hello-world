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
    use {'windwp/nvim-autopairs'}
    use {'rafamadriz/friendly-snippets'}
    use {'sbdchd/neoformat'}
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
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
    use {'dstein64/vim-startuptime'}
    use {'vijaymarupudi/nvim-fzf'}
    use {'vijaymarupudi/nvim-fzf-commands'}
    use {'roxma/vim-tmux-clipboard'}		-- clipboard integration with tmux
    use {'daeyun/vim-matlab'}
    use {'github/copilot.vim'}
    use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
    use {'eandrju/cellular-automaton.nvim'} -- make the code melt
    use({
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
	})
end)





-- loading settings
require('settings')                     -- general settings
require('maps')                         -- keybindings
require('lsp_config')                   -- config for lsp
require('treesitter_config')            -- treesitter config
require('cmp_config')
require("flutter-tools").setup{} -- use defaults
