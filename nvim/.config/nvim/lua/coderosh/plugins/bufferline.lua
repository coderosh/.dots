return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			close_command = function(n)
				Snacks.bufdelete(n)
			end,
			right_mouse_command = function() end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Tree",
					highlight = "Directory",
					text_align = "center",
				},
			},
		},
	},
}
