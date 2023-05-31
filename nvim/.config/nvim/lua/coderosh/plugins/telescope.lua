local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  event = "VeryLazy",
}

function M.config()
  require("telescope").setup({})

  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
  vim.keymap.set("n", "<leader>fo", function()
    builtin.find_files({ hidden = true })
  end, {})
  vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
  vim.keymap.set("n", "<leader>fr", builtin.live_grep, {})
  vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
end

return M
