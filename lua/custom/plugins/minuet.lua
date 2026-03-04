return {
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('minuet').setup {
        provider = 'openai_compatible',
        throttle = 1500,
        debounce = 600,
        virtualtext = {
          auto_trigger_ft = { '*' },
          auto_trigger_ignore_ft = { 'TelescopePrompt', 'TelescopeResults', 'octo', 'octo_panel' },
          keymap = {
            accept = '<Tab>',
            accept_line = '<C-e>', -- Cmd+Right via WezTerm
            prev = '<A-[>',
            next = '<A-]>',
            dismiss = '<A-e>',
          },
        },
        provider_options = {
          openai_compatible = {
            name = 'Openrouter',
            api_key = 'OPENROUTER_API_KEY',
            end_point = 'https://openrouter.ai/api/v1/chat/completions',
            model = 'google/gemini-2.5-flash-lite',
            stream = true,
            optional = {
              max_tokens = 256,
              top_p = 0.9,
              provider = {
                sort = 'throughput',
                zdr = true,
              },
            },
          },
        },
      }
    end,
  },
}
