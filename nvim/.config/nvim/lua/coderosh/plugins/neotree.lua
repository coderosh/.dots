local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
}

function M.config()
  require("neo-tree").setup({
    close_if_last_window = true,
    -- window = { width = 30 },
  })

  vim.keymap.set("n", "<leader>ef", ":Neotree toggle reveal<CR>")
  vim.keymap.set("n", "<leader>eb", ":Neotree buffers float<CR>")
  vim.keymap.set("n", "<leader>eg", ":Neotree git_status float<CR>")
end

return M
