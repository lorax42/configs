local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},

	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},

    {
        'honza/vim-snippets'
    },

	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
	},

    -- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "rust",
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "html",
                    "css",
                    "php",
                    "javascript",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    -- ALE
    {
        'dense-analysis/ale',
        config = function()
            -- Configuration goes here.
            local g = vim.g

            g.ale_ruby_rubocop_auto_correct_all = 1

            g.ale_linters = {
                ruby = {'rubocop', 'ruby'},
                lua = {'lua_language_server'}
            }
        end
    },

    -- NerdTree
    {
        'preservim/nerdtree'
    },

    -- VimDir
    {
        'c0r73x/vimdir.vim'
    },

    -- VimFugitive
    {
        'tpope/vim-fugitive'
    },

    -- autoclose
    {
        'm4xshen/autoclose.nvim'
    },

    -- {
    --     'windwp/nvim-autopairs',
    --     event = "InsertEnter",
    --     config = true
    --     -- use opts = {} for passing setup options
    --     -- this is equalent to setup({}) function
    -- },

    -- kerbovim
    {
        'm4xshen/autoclose.nvim'
    },

    -- vala support
    {
        'arrufat/vala.vim'
    },

    -- vimtex
    {
        'lervag/vimtex'
    },

})

