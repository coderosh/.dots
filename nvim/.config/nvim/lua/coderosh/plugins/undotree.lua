local M = {
  "mbbill/undotree",
  event = "VeryLazy",
}

function M.config()
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return M
