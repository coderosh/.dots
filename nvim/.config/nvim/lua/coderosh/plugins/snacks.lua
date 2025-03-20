return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 10000,
	opts = {
		dashboard = { enabled = true },
		picker = {
			enabled = true,
			matcher = {
				frecency = true,
			},
		},
		bigfile = { enabled = true },
		statuscolumn = { enabled = false },
		input = { enabled = true },
		indent = {
			enabled = true,
			animate = { enabled = false },
			indent = { only_scope = true },
			chunk = { enabled = true },
		},
		image = { enabled = true },
	},
	keys = {
		{
			"<leader>fp",
			function()
				Snacks.picker.files()
			end,
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.files({ hidden = true })
			end,
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.grep()
			end,
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.smart()
			end,
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.colorschemes()
			end,
		},

		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
		},
	},
}
