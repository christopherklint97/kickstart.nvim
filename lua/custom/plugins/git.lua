return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gclog', 'Gvdiffsplit', 'Gread', 'Gwrite', 'GBrowse' },
    keys = {
      { '<leader>hl', ':Gclog<CR>', mode = 'v', desc = 'git [l]og for selection' },
    },
  },
  {
    'tpope/vim-rhubarb',
  },
}
