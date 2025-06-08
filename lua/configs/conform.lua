local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    h = { "clang-format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  ---Default options
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
    lsp_fallback = true,
  },
}

return options
