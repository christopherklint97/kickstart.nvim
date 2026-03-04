return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'LazyGit',
    keys = {
      { '<leader>gg', '<Cmd>LazyGit<CR>', desc = 'Lazy[G]it' },
    },
  },
}
