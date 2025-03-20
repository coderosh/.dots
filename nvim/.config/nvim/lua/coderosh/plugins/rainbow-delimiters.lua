return {
  "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  branch = "master",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "FileType",
  enabled = true,
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      priority = {
        [""] = 110,
        lua = 210,
      },
      highlight = {
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    })
  end,
}
