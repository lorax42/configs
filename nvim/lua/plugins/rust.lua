return {
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,   -- This plugin is already lazy
        config = function()
            local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function() vim.lsp.buf.format() end,
                group = format_sync_grp,
            })
        end
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },
}
