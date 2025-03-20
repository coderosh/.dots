return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = function(_, opts)
		opts.event_handlers = opts.event_handlers or {}
		opts.close_if_last_window = true
		opts.window = {
			width = 30,
		}

		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end

		local events = require("neo-tree.events")

		vim.list_extend(opts.event_handlers, {
			{ event = events.FILE_MOVED, handler = on_move },
			{ event = events.FILE_RENAMED, handler = on_move },
		})
	end,

	keys = {
		{ "<leader>ef", ":Neotree toggle reveal<CR>" },
		{ "<leader>eb", ":Neotree toggle buffers float<CR>" },
		{ "<leader>eg", ":Neotree git_status float<CR>" },
	},
}
