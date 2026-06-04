-- Sync Neovim's theme to the macOS system appearance.
-- Polls the OS; on change it flips background + colorscheme:
--   dark  -> dracula
--   light -> catppuccin latte
-- Toggling Dark/Light in System Settings switches the editor automatically.
return {
  'f-person/auto-dark-mode.nvim',
  priority = 1000,
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'dracula'

      vim.cmd.hi 'Comment gui=none'
      vim.cmd.hi 'DiffAdd guifg=NONE guibg=#2a4a2a'
      vim.cmd.hi 'DiffChange guifg=NONE guibg=#3a3a2a'
      vim.cmd.hi 'DiffText guifg=NONE guibg=#4a4a2a'
    end,
    set_light_mode = function()
      vim.o.background = 'light'
      vim.cmd.colorscheme 'catppuccin-latte'

      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
