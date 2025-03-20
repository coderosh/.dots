return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			section_separators = "",
			component_separators = "",
			disabled_filetypes = { "snacks_dashboard" },
		},
		extensions = { "neo-tree", "lazy" },
	},
}
