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

    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

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

    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('telescope').setup()
        end
    },

    --[[{'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },

        init = function()
            vim.g.barbar_auto_setup = false
        end,

        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },

        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    }, --]]

    {
        'RRethy/vim-illuminate'
    },

    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            -- "stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = true
    },

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function ()
            require("ibl").setup()
        end,
    },
})

