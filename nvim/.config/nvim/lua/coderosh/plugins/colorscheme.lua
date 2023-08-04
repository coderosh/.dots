local colorschemes = {
  tokyonight_night = {
    "folke/tokyonight.nvim",
    config = function()
      local tokyonight = require("tokyonight")
      require("tokyonight").setup({
        style = "night",
        enable = true,
      })

      tokyonight.load()
    end,
  },
  rosepine_main = {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      local rosepine = require("rose-pine")

      rosepine.setup({
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

-- INFO: ccolorscheme sets this variable
local colorscheme = colorschemes.tokyonight_night

colorscheme.lazy = false

-- so that lazy won't list unused colorscheme in uninstall list
local M = {}
for _, value in pairs(colorschemes) do
  table.insert(M, value)
end

return M
