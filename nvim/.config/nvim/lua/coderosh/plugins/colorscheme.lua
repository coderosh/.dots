local function tokyonight(variant)
  local tk = require("tokyonight")
  tk.setup({
    style = variant,
    enable = true,
  })

  tk.load()
end

local function rosepine(variant)
  local rp = require("rose-pine")

  rp.setup({
    variant = variant,
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
end

local function catppuccin(variant)
  local cp = require("catppuccin")

  cp.setup({
    flavour = variant, -- latte, frappe, macchiato, mocha
  })

  vim.cmd([[colorscheme catppuccin]])
end

local colorschemes = {
  tokyonight_night = {
    "folke/tokyonight.nvim",
    config = function()
      tokyonight("night")
    end,
  },
  rosepine_main = {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      rosepine("main")
    end,
  },
  catppuccin_mocha = {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      catppuccin("mocha")
    end,
  },
}

-- INFO: ccolorscheme sets this variable
local colorscheme = colorschemes.rosepine_main

colorscheme.lazy = false

-- so that lazy won't list unused colorscheme in uninstall list
local M = {}
for _, value in pairs(colorschemes) do
  table.insert(M, value)
end

return M
