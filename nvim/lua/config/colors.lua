function trans()
    vim.api.nvim_set_hl(0, 'Normal', {bg = 'none'})
    vim.api.nvim_set_hl(0, 'NormalFloat', {bg = 'none'})
end

function notrans()
    vim.cmd.colorscheme("catppuccin-mocha")
end

