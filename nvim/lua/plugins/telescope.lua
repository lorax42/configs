return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
            require('telescope').setup({
                defaults = {
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    }
                }
            })

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fz", builtin.builtin, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fi", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>flr", builtin.lsp_references, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
