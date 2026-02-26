return {
  'cameron-wags/rainbow_csv.nvim',
  ft = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe', 'rfc_csv', 'rfc_semicolon' },
  cmd = { 'RainbowDelim', 'RainbowDelimSimple', 'RainbowDelimQuoted', 'RainbowMultiDelim' },
  init = function()
    -- Use distinct Dracula-friendly colors for CSV columns
    vim.g.rcsv_colorpairs = {
      { 'red', '#ff5555' },
      { 'green', '#50fa7b' },
      { 'cyan', '#8be9fd' },
      { 'magenta', '#ff79c6' },
      { 'yellow', '#f1fa8c' },
      { 'darkcyan', '#bd93f9' },
      { 'white', '#f8f8f2' },
      { 'darkgreen', '#ffb86c' },
      { 'darkmagenta', '#6272a4' },
      { 'darkred', '#69ff94' },
    }
  end,
  config = function()
    require('rainbow_csv').setup()
    -- Disable Treesitter highlighting for CSV filetypes so rainbow_csv can work
    local csv_fts = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe', 'rfc_csv', 'rfc_semicolon' }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = csv_fts,
      callback = function(args)
        vim.treesitter.stop(args.buf)
      end,
    })
  end,
}
