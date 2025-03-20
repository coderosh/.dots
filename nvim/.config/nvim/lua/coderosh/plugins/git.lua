return {
	{
		"rbong/vim-flog",
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
		{
			"lewis6991/gitsigns.nvim",
			event = "BufReadPost",
			opts = {
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 500,
				},
			},
		},
		{
			"tpope/vim-fugitive",
			event = "BufReadPost",
		},
	},
}
