return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        change_to_vcs_root = true
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require("telescope").setup({
        defaults = {
          winblend = 70
        }
      })
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    lazy = false,
    config = function ()
      require("mason-nvim-dap").setup({
        ensure_installed = { "php" },
        handlers = {
          php = function (config)
            local dap = require('dap')

            dap.adapters.php = {
              type = 'executable',
              command = 'node',
              args = { '/home/lukas/.config/nvim/php-debug/extension/out/phpDebug.js' }
            }

            dap.configurations.php = {
              {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003,
                log = true,
                pathMappings = {
                  ["/var/www/html/"] = "${workspaceFolder}"
                }
              }
            }

            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })
      require("dapui").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "hyprlang",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "nix",
        "passwd",
        "php",
        "phpdoc",
        "regex",
        "ron",
        "scss",
        "sql",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
    },
  },
}
