local map = vim.keymap.set

map('n', '<leader>gs', '<Cmd>Telescope git_status<CR>', { desc = '[G]it [S]tatus' })

vim.api.nvim_create_user_command('Browse', function(opts)
  vim.fn.system { 'open', opts.fargs[1] }
end, { nargs = 1 })

map('n', '<leader>go', function()
  local remote = vim.fn.system('git remote get-url origin'):gsub('%s+$', '')
  if vim.v.shell_error ~= 0 then
    vim.notify('No git remote found', vim.log.levels.ERROR)
    return
  end

  -- Convert SSH or .git URLs to https base
  local base = remote:gsub('git@github%.com:', 'https://github.com/'):gsub('%.git$', '')

  -- Use current branch if it has a remote tracking branch, otherwise master
  local branch = vim.fn.system('git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null'):gsub('%s+$', '')
  if vim.v.shell_error ~= 0 or branch == '' then
    branch = 'master'
  else
    branch = branch:gsub('^origin/', '')
  end

  local file = vim.fn.expand '%:.'
  local line = vim.fn.line '.'
  local url = string.format('%s/blob/%s/%s#L%d', base, branch, file, line)
  vim.fn.system { 'open', url }
  vim.notify('Opened in GitHub: ' .. branch)
end, { desc = '[G]it [O]pen in GitHub' })
