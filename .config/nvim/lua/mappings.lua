require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('x', '<leader>p', [["_dP]])
map('n', 'Y', 'y$', { desc = 'Yank to end of line' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<left>', '')
map('n', '<right>', '')
map('n', '<up>', '')
map('n', '<down>', '')
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Move View down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Move View up' })
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
map('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })
map('i', 'jk', '<Esc>', { silent = true, desc = 'exit insert mode' })
map('t', 'jk', '<C-\\><C-n>', { silent = true, desc = 'exit terminal' })
map('c', 'jk', '<Esc>', { silent = true, desc = 'exit command-line' })
map('n', 'H', '^', { silent = true, desc = 'start of line' })
map('n', 'L', '$', { silent = true, desc = 'end of line' })
map('v', 'H', '^', { silent = true, desc = 'start of line' })
map('v', 'L', '$', { silent = true, desc = 'end of line' })

