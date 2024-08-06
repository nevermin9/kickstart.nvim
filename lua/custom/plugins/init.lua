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
            -- accept = '<C-e>',
            accept = '<TAB>',
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

  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  {
    'xiantang/darcula-dark.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    init = function()
      -- vim.cmd 'colorscheme darcula-dark'
    end,
  },
  {
    -- 'askfiy/visual_studio_code',
    'Mofiqul/vscode.nvim',
    priority = 100,
    config = function()
      -- vim.cmd 'colorscheme vscode'
      -- vim.cmd [[colorscheme visual_studio_code]]
    end,
  },

  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },

  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      home = vim.fn.expand '~/Documents/Notes',
    },
  },

  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      create_autocmd = false,
    },
  },

  {
    'digitaltoad/vim-pug',
    lazy = true,
    ft = 'pug',
  },

  {
    'kvrohit/rasmus.nvim',
    config = function()
      vim.g.rasmus_transparent = true
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'leath-dub/snipe.nvim',
    config = function()
      local snipe = require 'snipe'
      snipe.setup {
        ui = {
          position = 'cursor',
        },
      }
      vim.keymap.set('n', '<leader><leader>', snipe.create_buffer_menu_toggler())
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      -- local mason_registry = require 'mason-registry'
      -- local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path()
      --   .. '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'

      print(ts_plugin_path)
      require('typescript-tools').setup {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        settings = {

          tsserver_plugins = {
            '@vue/typescript-plugin',
            -- {
            --   name = '@vue/typescript-plugin',
            --   location = ts_plugin_path,
            --   -- If .vue file cannot be recognized in either js or ts file try to add `typescript` and `javascript` in languages table.
            --   languages = { 'vue' },
            -- },
          },
        },
      }
    end,
  },
}
