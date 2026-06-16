return {
  -- Add the Nord theme plugin
  {
    "shaunsingh/nord.nvim",
    lazy = false, -- Load it immediately during startup
    priority = 1000, -- Load it before other plugins
    config = function()
      -- Optional: Configure Nord features here before loading
      -- vim.g.nord_contrast = true
      -- vim.g.nord_borders = true

      -- Load the colorscheme
      vim.cmd([[colorscheme nord]])
    end,
  },
}
