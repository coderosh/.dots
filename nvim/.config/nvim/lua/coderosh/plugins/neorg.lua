return {
  "nvim-neorg/neorg",
  event = "VeryLazy",
  version = "*",
  config = function()
    local neorg = require("neorg")

    neorg.setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/.neorg",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
}
