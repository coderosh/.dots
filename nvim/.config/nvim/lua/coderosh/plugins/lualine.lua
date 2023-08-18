local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
}

function M.config()
  require("lualine").setup({
    options = {
      section_separators = "",
      component_separators = "",
    },
  })
end

return M
