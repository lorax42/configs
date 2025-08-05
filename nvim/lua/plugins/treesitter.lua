return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "css",
                    "html",
                    "javascript",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "php",
                    "python",
                    "rust",
                    "vim",
                    "vimdoc",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context'
    },
}
