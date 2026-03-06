return {
  {
    'christopherklint97/octo.nvim',
    branch = 'fix/reviewer-add-empty-args',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Octo',
    config = function()
      require('octo').setup {
        suppress_missing_scope = {
          projects_v2 = true,
        },
        poll = {
          enabled = true,
          notify_on_refresh = false,
          notify_on_change = false,
        },
        mappings = {
          review_diff = {
            add_review_comment = { lhs = '<leader>orca', desc = 'add review comment' },
            add_review_suggestion = { lhs = '<leader>orcs', desc = 'add review suggestion' },
          },
          review_thread = {
            add_comment = { lhs = '<leader>orca', desc = 'add comment' },
            add_reply = { lhs = '<leader>orcr', desc = 'add reply' },
            delete_comment = { lhs = '<leader>orcd', desc = 'delete comment' },
            add_suggestion = { lhs = '<leader>orcs', desc = 'add suggestion' },
          },
          pull_request = {
            add_comment = { lhs = '<leader>oca', desc = 'add comment' },
            add_reply = { lhs = '<leader>ocr', desc = 'add reply' },
            delete_comment = { lhs = '<leader>ocd', desc = 'delete comment' },
          },
          issue = {
            add_comment = { lhs = '<leader>oca', desc = 'add comment' },
            add_reply = { lhs = '<leader>ocr', desc = 'add reply' },
            delete_comment = { lhs = '<leader>ocd', desc = 'delete comment' },
          },
        },
      }
    end,
  },
}
