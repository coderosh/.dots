local M = {
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- config = function()
    --   local tokyonight = require("tokyonight")
    --   require("tokyonight").setup({
    --     style = "night",
    --     enable = true,
    --   })
    --   tokyonight.load()
    -- end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      vim.opt.laststatus = 2 -- Or 3 for global statusline
      vim.opt.statusline = " %f %m %= %l:%c ♥ "
      require("rose-pine").setup({
        variant = "main",
        disable_italics = true,
        highlight_groups = {
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "base" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        },
      })

      vim.cmd([[colorscheme rose-pine]])
    end,
  },
}

return M
