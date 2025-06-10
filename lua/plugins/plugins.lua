local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "VeryLazy" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins"
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "gopls",
        "codelldb",
      },
    },
  },
  -- {
  --   "hrsh7th/cmp-nvim-lsp",
  --   opts={
  --
  --   }
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  --   --C++ debugger using mason nvim dap
  --   {
  --     --debugger UI
  --     "rcarriga/nvim-dap-ui",
  --     event = "VeryLazy",
  --     dependencies = "mfussenegger/nvim-dap",
  --     config = function()
  --       local dap = require "dap"
  --       local dapui = require "dapui"
  --       dapui.setup()
  --       dap.listeners.after.event_initialized["dapui_config"] = function()
  --         dapui.open()
  --       end
  --       dap.listeners.before.event_terminated["dapui_config"] = function()
  --         dapui.close()
  --       end
  --       dap.listeners.before.event_exited["dapui_config"] = function()
  --         dapui.close()
  --       end
  --     end,
  --   },
  --   {
  --     "mfussenegger/nvim-dap",
  --     config = function()
  --       require("core.utils").load_mapppings "dap"
  --     end,
  --   },
  --   {
  --     "jay-badu/mason-nvim-dap.nvim",
  --     dependencies = {
  --       "williamboman/mason.nvim",
  --       "mfussenegger/nvim-dap",
  --     },
  --     opts = {
  --       handlers = {}, --will use the default handlersv
  --     },
  --   },
}
return plugins
