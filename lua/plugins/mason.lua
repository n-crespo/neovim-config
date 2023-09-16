return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "black",
    },
  },
}
-- require'lspconfig'.pyright.setup{}
