-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'sudo-tee/opencode.nvim',
    config = function()
      require('opencode').setup {}
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          anti_conceal = { enabled = false },
          file_types = { 'markdown', 'opencode_output' },
        },
        ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
      },
      -- Optional, for file mentions and commands completion, pick only one
      'saghen/blink.cmp',
      -- 'hrsh7th/nvim-cmp',

      -- Optional, for file mentions picker, pick only one
      'folke/snacks.nvim',
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim_mini/mini.nvim',
    },
  },
  {
    'supermaven-inc/supermaven-nvim',
    event = 'VeryLazy', -- Load after Neovim starts
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<Tab>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        log_level = 'info',
        disable_inline_completion = false,
        disable_keymaps = false,
        condition = function()
          return false
        end,
      }
      -- Link suggestion highlight to Comment for theme-derived color
      vim.api.nvim_set_hl(0, 'SupermavenSuggestion', { link = 'Comment' })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priotity = 1001,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
