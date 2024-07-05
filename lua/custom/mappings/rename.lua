local map = vim.keymap.set

map('n', '<leader>rh', '<Cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[R]ename [H]ighlight' })
