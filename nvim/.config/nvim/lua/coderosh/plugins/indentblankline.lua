local highlight = {
  "RainbowDelimiterYellow",
  "RainbowDelimiterBlue",
  "RainbowDelimiterOrange",
  "RainbowDelimiterGreen",
  "RainbowDelimiterViolet",
  "RainbowDelimiterCyan",
}

local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  main = "ibl",
  config = function()
    local ibl = require("ibl")
    local hooks = require("ibl.hooks")

    ibl.setup({
      indent = {
        char = "│",
        smart_indent_cap = true,
      },
      scope = {
        char = "│",
        highlight = highlight,
      },
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}

return M
