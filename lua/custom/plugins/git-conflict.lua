return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    require('git-conflict').setup {}

    -- Tone down the bright green incoming highlight to fit Dracula theme
    vim.api.nvim_set_hl(0, 'GitConflictIncoming', { bg = '#1a3a2a' })
    vim.api.nvim_set_hl(0, 'GitConflictIncomingLabel', { bg = '#264d36' })
    vim.api.nvim_set_hl(0, 'GitConflictCurrent', { bg = '#2a2a3a' })
    vim.api.nvim_set_hl(0, 'GitConflictCurrentLabel', { bg = '#363650' })
  end,
}
