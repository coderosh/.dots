return {
  "nvim-lua/plenary.nvim",
  dependencies = {
    "nvim-pack/nvim-spectre",
  },
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre",
    })
  end,
}
