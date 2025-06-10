vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.wo.relativenumber = true
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

--Saw this on https://github.com/NvChad/NvChad/discussions/2607#discussioncomment-8185006 to fix line wrap
vim.opt.wrap = true
vim.opt.linebreak = true
local lazy_config = require "configs.lazy"

--- this brings a up a pop-up window for function signature help. Should not break any lsp default feature
require("cmp").setup {
  sources = {
    {
      name = "nvim_lsp_signature_help",
    },
  },
}

--- End of my stuff
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
