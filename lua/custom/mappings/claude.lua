local map = vim.keymap.set

map('v', '<leader>cc', function()
  local start_line = vim.fn.line 'v'
  local end_line = vim.fn.line '.'
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local path = vim.fn.expand '%:.'
  local ref = path .. ':' .. start_line .. '-' .. end_line
  vim.fn.setreg('+', ref)
  vim.notify('Copied: ' .. ref)
end, { desc = 'Copy file path and lines for Claude Code' })
