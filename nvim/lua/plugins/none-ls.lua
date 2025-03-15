return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
                -- lua
				null_ls.builtins.formatting.stylua,

                -- html, css, ts ...
                null_ls.builtins.formatting.prettier,

                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,  -- format imports
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
