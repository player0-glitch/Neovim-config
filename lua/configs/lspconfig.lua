-- load defaults i.e lua
local base = require "nvchad.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities
-- local util require "lspconfig/util"
local lspconfig = require "lspconfig"

--for Go
local util = require "lspconfig/util"
--loading defaults nvchad configurations
base.defaults()
--loading custom  for clangd configurations
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvier = false
    on_attach(client, bufnr)
    -- code
  end,
  settings = {
    clangd = {
      Includes = { "C:/msys64/mingw64/include" }, --gotta set up for linux
      StorePrecompiledHeaders = true,
    },
  },
  capabilities = capabilities,
}
--loading custom for gopls
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvier = false
    on_attach(client, bufnr)
  end,
  --new stuff
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedParam = true,
      },
    },
  },
}
--
--loading custom for rust-analyzer
lspconfig.rust_analyzer.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvier = false
    on_attach(client, bufnr)
    --code
  end,
  capabilities = capabilities,
  filetypes = { "rust" },
  -- define the root directory of our .TOML file
  --  root_dir=util.root_pattern("Cargo.toml"),
  settings = {
    ["rust_analyzer"] = {
      Cargo = {
        allFeatures = true,
      },
    },
  },
}

--config python language server

lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      pythonPath = "/usr/bin/python3"
    },
    pyright = {}
  }
}
