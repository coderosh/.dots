return {
  "mbbill/undotree",
  event = "VeryLazy",
  keys = {
    {"<leader>u", function() vim.cmd.UndotreeToggle() end}
  }
}
