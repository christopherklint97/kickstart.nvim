local map = vim.keymap.set

map('n', '<leader>gs', '<Cmd>Telescope git_status<CR>', { desc = '[G]it [S]tatus' })

vim.api.nvim_create_user_command('Browse', function(opts)
  vim.fn.system { 'open', opts.fargs[1] }
end, { nargs = 1 })
