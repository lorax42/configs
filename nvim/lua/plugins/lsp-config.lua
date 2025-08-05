return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    'pylsp',                   -- Python
                    'lua_ls',                  -- Lua
                    -- 'rust_analyzer',            -- Rust [don't install in parallel with rustaceanvim]
                    'clangd',                  -- C/C++
                    'arduino_language_server', -- Arduino (.ino)
                    'bashls',                  -- Bash
                    'marksman',                -- Markdown
                    'vimls',                   -- Vim/Vimscript
                    -- 'hyprls',                   -- Hyprland Configs
                    'html',                    -- HTML
                    'cssls',                   -- CSS
                    'css_variables',
                    'cssmodules_ls',
                    -- 'tailwindcss',              -- TailwindCSS
                    'jsonls',   -- JSON
                    'texlab',   -- LaTeX
                    'phpactor', -- PHP
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                virtual_text = false,
                update_in_insert = true,
                severity_sort = true,
                underline = false,
            })

            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.o.updatetime = 250
            vim.api.nvim_create_autocmd({ "CursorHold" --[[ , "CursorHoldI" ]] }, {
                group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
                callback = function()
                    vim.diagnostic.open_float(nil, { focus = false })
                end
            })

            vim.api.nvim_create_autocmd({ "CursorHold" --[[ , "CursorHoldI" ]] }, {
                group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
                callback = function()
                    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
                end
            })

            vim.api.nvim_create_autocmd("CursorHold", {
                buffer = bufnr,
                callback = function()
                    local opts = {
                        focusable = false,
                        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                        border = 'rounded',
                        source = 'always',
                        prefix = ' ',
                        scope = 'cursor',
                    }
                    vim.diagnostic.open_float(nil, opts)
                end
            })

            -- setup lsps
            local lspconfig = require("lspconfig")

            -- Customized on_attach function
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                -- vim.keymap.set("n", "<space>f", function()
                --     vim.lsp.buf.format({ async = true })
                -- end, bufopts)
                vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
            end

            lspconfig.lua_ls.setup({ on_attach = on_attach })
            lspconfig.cssls.setup({ on_attach = on_attach })
            lspconfig.pylsp.setup({ on_attach = on_attach })
            lspconfig.lua_ls.setup({ on_attach = on_attach })
            lspconfig.clangd.setup({ on_attach = on_attach })
            lspconfig.arduino_language_server.setup({ on_attach = on_attach })
            lspconfig.bashls.setup({ on_attach = on_attach })
            lspconfig.marksman.setup({ on_attach = on_attach })
            lspconfig.vimls.setup({ on_attach = on_attach })
            lspconfig.html.setup({ on_attach = on_attach })
            lspconfig.cssls.setup({ on_attach = on_attach })
            lspconfig.css_variables.setup({ on_attach = on_attach })
            lspconfig.cssmodules_ls.setup({ on_attach = on_attach })
            lspconfig.jsonls.setup({ on_attach = on_attach })
            lspconfig.texlab.setup({ on_attach = on_attach })
            lspconfig.phpactor.setup({ on_attach = on_attach })
        end,
    },
    {
        'nvimdev/lspsaga.nvim',

        config = function()
            require('lspsaga').setup({
                ui = {
                    code_action = ""
                }
            })
        end,

        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },
    {
        "rshkarin/mason-nvim-lint",
        config = function()
            require('mason-nvim-lint').setup({
                ensure_installed = {
                    -- 'bacon', -- bacon linter for rust is not available in nvim-lint, so it's specified to be directly installed from the mason's registry
                    -- 'vale',             -- Markdown, LaTeX
                    -- 'markdownlint',
                    -- 'cpplint',   -- C/C++
                    -- 'phpstan',   -- PHP
                    -- 'proselint', -- Text
                    -- 'pylint',    -- Python
                },
            })
        end,
    },
    {
        'mfussenegger/nvim-lint',
        config = function()
            require('lint').linters_by_ft = {
                c = { 'cpplint', },
                cpp = { 'cpplint', },
                latex = { 'vale', },
                markdown = { 'markdownlint', },
                php = { 'phpstan', },
                python = { 'pylint', },
                text = { 'proselint', },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    -- try_lint without arguments runs the linters defined in `linters_by_ft`
                    -- for the current filetype
                    require("lint").try_lint()

                    -- You can call `try_lint` with a linter name or a list of names to always
                    -- run specific linters, independent of the `linters_by_ft` configuration
                    --require("lint").try_lint("cspell")
                end,
            })
        end
    },
}
