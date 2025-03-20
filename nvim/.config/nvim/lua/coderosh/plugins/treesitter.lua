return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "windwp/nvim-ts-autotag", opts = {} },
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = "BufReadPost",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"javascript",
				"typescript",
				"rust",
				"go",
				"html",
				"css",
				"python",
				"bash",
				"markdown",
				"markdown_inline",
			},
			ignore_install = {},
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["ac"] = "@class.outer",
						["ic"] = "@class.inner",

						["al"] = "@loop.outer",
						["il"] = "@loop.inner",

						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",

						["au"] = "@call.outer",
						["iu"] = "@call.inner",
					},
				},
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]l"] = "@loop.outer",
						["]a"] = "@parameter.inner",
						["]u"] = "@call.inner",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]L"] = "@loop.outer",
						["]A"] = "@parameter.inner",
						["]U"] = "@call.inner",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[l"] = "@loop.outer",
						["[a"] = "@parameter.inner",
						["[u"] = "@call.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[L"] = "@loop.outer",
						["[A"] = "@parameter.inner",
						["[U"] = "@call.inner",
					},
				},
			},
		})
	end,
}
