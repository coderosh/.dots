local function tokyonight(variant)
  return {
    plugin = "folke/tokyonight.nvim",
    config = function()
      local tk = require("tokyonight")

      tk.setup({
        style = variant,
        enable = true,
      })
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
end

local function rosepine(variant)
  return {
    plugin = "rose-pine/neovim",
    name = "rose-pine",
    config = function()
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
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
  }
end

local function catppuccin(variant)
  return {
    plugin = "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      local cp = require("catppuccin")

      cp.setup({
        flavour = variant, -- latte, frappe, macchiato, mocha
      })
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  }
end

local function everforest()
  return {
    plugin = "neanias/everforest-nvim",
    name = "everforest",
    config = function()
      local ev = require("everforest")
      ev.setup({})
    end,

    set_colorscheme = function()
      vim.cmd([[colorscheme everforest]])
    end,
  }
end

local function nightowl()
  return {
    plugin = "oxfist/night-owl.nvim",
    name = "night-owl",
    config = function() end,
    set_colorscheme = function()
      require("night-owl").setup({
        italics = false,
      })
      vim.cmd.colorscheme("night-owl")
    end,
  }
end

local colorschemes = {
  tokyonight_night = tokyonight("night"),
  rosepine_main = rosepine("main"),
  catppuccin_mocha = catppuccin("mocha"),
  everforest = everforest(),
  nightowl = nightowl(),
  nord = {
    plugin = "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_italic = false
      vim.g.nord_bold = false
    end,
    set_colorscheme = function()
      vim.cmd([[colorscheme nord]])
    end,
  },
}

-- INFO: ccolorscheme sets this variable
local colorscheme = colorschemes.tokyonight_night

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
