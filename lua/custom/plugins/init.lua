-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- FILE EXPLORER --
  {
    'kelly-lin/ranger.nvim',
    config = function()
      require('ranger-nvim').setup {
        replace_netrw = true,
        ui = {
          border = 'rounded',
        },
      }
      vim.api.nvim_set_keymap('n', '<leader>n', '', {
        noremap = true,
        callback = function()
          require('ranger-nvim').open(true)
        end,
        desc = 'Open Ranger',
      })
    end,
  },

  -- AUTOPAIR --
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      enable_check_bracket_line = false,
    }, -- this is equalent to setup({}) function
  },

  -- GITHUB COPILOT --
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-e>',
          },
        },
      }
    end,
  },

  -- HOP JUMP --
  {
    'smoka7/hop.nvim',
    version = '*',
    --opts = {},
    keys = {
      {

        ',',

        function()
          require('hop').hint_words()
        end,

        mode = { 'n', 'x', 'o' },
      },

      -- {
      --   "s",
      --   function()
      --     require("hop").hint_char2()
      --   end,
      --   mode = { "n", "x", "o" },
      -- },

      {

        'f',
        function()
          require('hop').hint_char1 {
            direction = require('hop.hint').HintDirection.AFTER_CURSOR,
            current_line_only = true,
          }
        end,
        mode = { 'n', 'x', 'o' },
      },

      {

        'F',
        function()
          require('hop').hint_char1 {

            direction = require('hop.hint').HintDirection.BEFORE_CURSOR,

            current_line_only = true,
          }
        end,
        mode = { 'n', 'x', 'o' },
      },
    },

    opts = {
      multi_windows = true,
      keys = 'htnsueoaidgcrlypmbkjvx',
      uppercase_labels = true,

      -- reverse_distribution = true,
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      -- { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
