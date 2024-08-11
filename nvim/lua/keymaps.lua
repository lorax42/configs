-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.keymap.set()`

-- fix common typos
vim.keymap.set('n', ':W', ':w', opts)
vim.keymap.set('n', ':Q', ':q', opts)
vim.keymap.set('n', ':Wq', ':wq', opts)
vim.keymap.set('n', ':WQ', ':wq', opts)

-- move selection Up/Down
vim.keymap.set('n', '<A-j>', 'ddp==', opts)
vim.keymap.set('n', '<A-DOWN>', 'ddp==', opts)
vim.keymap.set('n', '<A-k>', 'ddkP==', opts)
vim.keymap.set('n', '<A-UP>', 'ddkP==', opts)

vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)

vim.keymap.set('i', '<A-j>', '<ESC>ddp==gi', opts)
vim.keymap.set('i', '<A-DOWN>', '<ESC>ddp==gi', opts)
vim.keymap.set('i', '<A-k>', '<ESC>ddkP==gi', opts)
vim.keymap.set('i', '<A-UP>', '<ESC>ddkP==gi', opts)
-- vim.keymap.set('n', '<ALT+j>', ':m+<CR>', opts)
-- vim.keymap.set('n', '<ALT+k>', ':m-2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
