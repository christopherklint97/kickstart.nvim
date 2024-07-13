return {
  'robitx/gp.nvim',
  config = function()
    local config = {
      open_api_key = { 'cat', '~/openapikey.txt' },
      agents = {
        {
          name = 'ChatGPT3-5',
          disable = true,
        },
        {
          name = 'PromptEngineerAgent',
          chat = true,
          command = true,
          model = { model = 'gpt-4o' },
          system_prompt = 'I want you to become my Prompt engineer. Your goal is to help me craft the best possible prompt for my needs.\nThe prompt will be used by you, ChatGPT. You will follow the following process:\n1. Your first response will be to ask me what the prompt should be about. I will provide my answer, but we will need to improve it through continual iterations by going through the next steps.\n2. Based on my input, you will generate 2 sections, a) Revised prompt (provide your rewritten prompt, it should be clear, concise, and easily understood by you), b) Questions (ask any relevant questions pertaining to what additional information is needed from me to improve the prompt).\n3. We will continue this iterative process with me providing additional information to you and you updating the prompt in the Revised prompt section until I say we are done.',
        },
      },
    }

    -- or setup with your own config (see Install > Configuration in Readme)
    require('gp').setup(config)

    -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
  end,
}
