return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local oil = require 'oil'
      local telescope = require 'telescope.builtin'

      oil.setup {
        columns = { 'icon' },
        buf_options = {
          bufhidden = 'hide',
        },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<space>-', oil.toggle_float, { desc = 'Open floating parent directory' })
      vim.keymap.set('n', '<leader>sD', function()
        telescope.live_grep { cwd = oil.get_current_dir() }
      end, { desc = '[S]earch all files in parent [D]irectory' })
    end,
  },
}
