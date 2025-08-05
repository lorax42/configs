return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        },
        config = function()
            require("luasnip").setup({
                history = true
            })
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from snippets folder
        end
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Set up nvim-cmp.
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = {
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                formatting = {
                    -- Set order from left to right
                    -- kind: single letter indicating the type of completion
                    -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
                    -- menu: extra text for the popup menu, displayed after "word" or "abbr"
                    fields = { 'abbr', 'menu' },

                    -- customize the appearance of the completion menu
                    format = function(entry, vim_item)
                        -- require("nvim-highlight-colors").format
                        vim_item.menu = ({
                            -- nvim_lsp = '[Lsp]',
                            nvim_lsp = '󰿘',
                            -- luasnip = '[Luasnip]',
                            luasnip = '',
                            -- buffer = '[File]',
                            buffer = '',
                            -- path = '[Path]',
                            path = '',
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'luasnip' },  -- For luasnip user
                    { name = 'nvim_lsp' }, -- For nvim-lsp
                    { name = 'buffer' },   -- For buffer word completion
                    { name = 'path' },     -- For path completion
                })
            })
        end,
    },
}
