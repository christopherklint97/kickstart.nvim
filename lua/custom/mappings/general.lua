local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })

map('n', '<leader>sD', function()
  vim.ui.input({ prompt = 'Directory: ', default = '', completion = 'dir' }, function(dir)
    if dir and dir ~= '' then
      require('telescope.builtin').live_grep { search_dirs = { dir } }
    end
  end)
end, { desc = '[S]earch [D]irectory (grep)' })

map('n', '<leader>sF', function()
  vim.ui.input({ prompt = 'Directory: ', default = '', completion = 'dir' }, function(dir)
    if dir and dir ~= '' then
      require('telescope.builtin').find_files { cwd = dir, hidden = true }
    end
  end)
end, { desc = '[S]earch [F]iles in directory' })

map('n', '<leader>cp', function()
  local path = vim.fn.expand '%:.'
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, { desc = 'Copy file path (relative)' })
