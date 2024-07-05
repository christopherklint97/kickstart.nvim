local map = vim.keymap.set

map('n', '<leader>tn', '<Cmd>TestNearest<CR>', { desc = '[T]est [N]earest' })
map('n', '<leader>tf', '<Cmd>TestFile<CR>', { desc = '[T]est [F]ile' })
