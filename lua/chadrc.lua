-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

--@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "flexoki",
  theme_toggle = {
    "flexoki",
    "flexoki",
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}
M.plugins = "plugins.plugins"
-- import the mappings we defined for our debugger
-- into nvchad and assign them to the codelldb
-- M.mappings = require "plugins.mappings"
return M
