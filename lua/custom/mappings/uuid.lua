local map = vim.keymap.set

map('n', '<leader>uu', function()
  local uuid = string.lower(vim.fn.trim(vim.fn.system('uuidgen')))
  vim.api.nvim_put({ uuid }, 'c', true, true)
end, { desc = 'Insert UUID' })
