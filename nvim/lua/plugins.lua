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
    -- popup notifications
    {
        'rcarriga/nvim-notify',
        config = function ()
            vim.notify = require("notify")
        end
    },

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

    -- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

    {
        "neovim/nvim-lspconfig",

        dependencies = {
            'nvimdev/lspsaga.nvim',

            config = function()
                require('lspsaga').setup({})
            end,

            dependencies = {
                'nvim-tree/nvim-web-devicons',     -- optional
            }
        }
    },

    -- collection of snippets
    {
        'honza/vim-snippets'
    },

	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
            require("luasnip").setup()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
	},

    -- better syntax highlighting
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

    -- linter
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

    -- file tree
    {
        'preservim/nerdtree'
    },

    -- file management in textfile
    {
        'c0r73x/vimdir.vim'
    },

    -- git helper
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

    -- kerboscript support
    {
        'm4xshen/autoclose.nvim'
    },

    -- vala support
    {
        'arrufat/vala.vim'
    },

    -- latex support
    {
        'lervag/vimtex'
    },

    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('ripgrep')
            require('telescope').setup()
        end
    },

    -- formatter
    --{
    --    'mhartington/formatter.nvim',
    --},

    -- highlight instances of word under cursor
    {
        'RRethy/vim-illuminate'
    },

    -- better tab management
    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            --"stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = true
    },

    -- Easy Commenting
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
            padding = false,
        },

        --config = function()
        --    require('Comment').setup()
        --end
    },

    -- indentation guide
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            --indent = { char = '│' },
            indent = { char = '┆' },
        },
    },

    --  floating terminal window
    {
        'voldikss/vim-floaterm',
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup()
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require("lualine").setup()
        end,
        options = { theme = 'nightfly' }
    },
})

