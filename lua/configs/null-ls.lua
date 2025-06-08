local null_ls = require "null-ls"

local opts = {
  sources = {
    --clang
    null_ls.builtins.formatting.clang_format,
    --gopls
    null_ls.builtins.formatting.gofumpt,
    -- null_ls.builtins.formatting.goimports_revisor,
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    local function format()
      vim.lsp.buf.format()
    end
    vim.api.nvim_buf_create_user_command(bufnr, "Format", format, { desc = "Format current buffer with clang-format" })
  end,
}

return opts
