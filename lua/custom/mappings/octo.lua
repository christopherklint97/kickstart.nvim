local map = vim.keymap.set

-- PR
map('n', '<leader>ov', '<Cmd>Octo pr<CR>', { desc = '[O]cto PR [V]iew current' })
map('n', '<leader>ol', '<Cmd>Octo pr list<CR>', { desc = '[O]cto PR [L]ist' })
map('n', '<leader>oo', '<Cmd>Octo pr browser<CR>', { desc = '[O]cto PR [O]pen in browser' })
map('n', '<leader>od', '<Cmd>Octo pr diff<CR>', { desc = '[O]cto PR [D]iff' })
map('n', '<leader>oc', '<Cmd>Octo pr checkout<CR>', { desc = '[O]cto PR [C]heckout' })
map('n', '<leader>om', '<Cmd>Octo pr merge squash<CR>', { desc = '[O]cto PR [M]erge (squash)' })
map('n', '<leader>oy', '<Cmd>Octo pr url<CR>', { desc = '[O]cto PR cop[Y] URL' })
map('n', '<leader>ok', '<Cmd>Octo pr checks<CR>', { desc = '[O]cto PR chec[K]s' })

-- Search
local function octo_search(query)
  local repo = vim.fn.system('gh repo view --json nameWithOwner -q .nameWithOwner'):gsub('%s+$', '')
  vim.cmd('Octo search repo:' .. repo .. ' ' .. query)
end

map('n', '<leader>osa', function()
  octo_search 'author:@me is:pr is:open'
end, { desc = '[O]cto [S]earch [A]uthor (my PRs)' })
map('n', '<leader>osr', function()
  octo_search 'review-requested:@me is:pr is:open'
end, { desc = '[O]cto [S]earch [R]eview requested' })

-- Review
map('n', '<leader>ors', '<Cmd>Octo review start<CR>', { desc = '[O]cto [R]eview [S]tart' })
map('n', '<leader>orf', '<Cmd>Octo review submit<CR>', { desc = '[O]cto [R]eview [F]inish (submit)' })
map('n', '<leader>ord', '<Cmd>Octo review discard<CR>', { desc = '[O]cto [R]eview [D]iscard' })
map('n', '<leader>orr', '<Cmd>Octo review resume<CR>', { desc = '[O]cto [R]eview [R]esume' })
map('n', '<leader>orcl', '<Cmd>Octo review comments<CR>', { desc = '[O]cto [R]eview [C]omments [L]ist' })

-- Comments
map('n', '<leader>oca', '<Cmd>Octo comment add<CR>', { desc = '[O]cto [C]omment [A]dd' })
map('n', '<leader>ocd', '<Cmd>Octo comment delete<CR>', { desc = '[O]cto [C]omment [D]elete' })

-- Actions / Workflow runs (via gh CLI)
map('n', '<leader>oal', '<Cmd>terminal gh run list<CR>', { desc = '[O]cto [A]ctions [L]ist runs' })
map('n', '<leader>oaw', '<Cmd>terminal gh run watch<CR>', { desc = '[O]cto [A]ctions [W]atch latest run' })
map('n', '<leader>oar', '<Cmd>!gh run rerun --failed<CR>', { desc = '[O]cto [A]ctions [R]erun failed' })

-- Issues
map('n', '<leader>oil', '<Cmd>Octo issue list<CR>', { desc = '[O]cto [I]ssue [L]ist' })
map('n', '<leader>oic', '<Cmd>Octo issue create<CR>', { desc = '[O]cto [I]ssue [C]reate' })
map('n', '<leader>oib', '<Cmd>Octo issue browser<CR>', { desc = '[O]cto [I]ssue [B]rowser' })
