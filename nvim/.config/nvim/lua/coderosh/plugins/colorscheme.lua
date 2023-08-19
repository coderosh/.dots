local function tokyonight(variant)
  local tk = require("tokyonight")

  tk.setup({
    style = variant,
    enable = true,
  })
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
end

local function catppuccin(variant)
  local cp = require("catppuccin")

  cp.setup({
    flavour = variant, -- latte, frappe, macchiato, mocha
  })
end

local colorschemes = {
  tokyonight_night = {
    plugin = "folke/tokyonight.nvim",
    config = function()
      tokyonight("night")
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  rosepine_main = {
    plugin = "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      rosepine("main")
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
  catppuccin_mocha = {
    plugin = "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      catppuccin("mocha")
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  nightowl = {
    plugin = "oxfist/night-owl.nvim",
    config = function() end,
    set_colorscheme = function()
      vim.cmd([[colorscheme night-owl]])
    end,
  },
}

-- INFO: ccolorscheme sets this variable
local colorscheme = colorschemes.rosepine_main

-- so that lazy won't list unused colorscheme in uninstall list
local M = {}
for _, value in pairs(colorschemes) do
  local plugin = {
    value.plugin,
  }

  if value == colorscheme then
    plugin.lazy = false
    plugin.config = function()
      value.config()
      value.set_colorscheme()
    end
  else
    plugin.event = "VeryLazy"
    plugin.config = function()
      value.config()
    end
  end

  if value.name then
    plugin.name = value.name
  end

  table.insert(M, plugin)
end

return M
