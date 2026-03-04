return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<Cmd>DiffviewOpen<CR>', desc = '[G]it [D]iffview' },
      { '<leader>gf', '<Cmd>DiffviewFileHistory %<CR>', desc = '[G]it [F]ile history' },
      { '<leader>gF', '<Cmd>DiffviewFileHistory<CR>', desc = '[G]it all [F]ile history' },
    },
    config = function()
      require('diffview').setup {}
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'DiffviewFiles', 'DiffviewFileHistory' },
        callback = function(event)
          vim.keymap.set('n', 'q', '<Cmd>DiffviewClose<CR>', { buffer = event.buf, desc = 'Close diffview' })
        end,
      })
    end,
  },
}
