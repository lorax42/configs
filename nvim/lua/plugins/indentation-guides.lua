return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type ibl.config
    opts = {
        --indent = { char = '│' },
        indent = { char = '┆' },
        scope = {
            show_start = false,
            show_end = false
        }
    },
}
