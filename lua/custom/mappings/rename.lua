local map = vim.keymap.set

map('n', '<leader>rh', '<Cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[R]ename [H]ighlight' })
map('n', '<leader>cr', '<Cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[C]ode [R]ename' })
