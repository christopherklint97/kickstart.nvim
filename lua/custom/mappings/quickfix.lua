vim.keymap.set('n', '<leader>q', function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end, { desc = 'Toggle quickfix list' })

vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix entry' })
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous quickfix entry' })

vim.keymap.set('n', '<leader>sR', ':cfdo %s///gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>', { desc = '[S]earch [R]eplace in quickfix' })
