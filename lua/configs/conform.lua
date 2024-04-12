local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    php = {"pretty-php"},
    javascript = {"prettier"},
  },
}

require("conform").setup(options)
