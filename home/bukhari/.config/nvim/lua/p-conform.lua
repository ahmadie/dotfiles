require('conform').setup({
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    python = { "isort", "black" },
    lua = { "stylua" }
  }
})
