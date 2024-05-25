return {
  "toppair/peek.nvim",
  ft = "markdown",
  build = "deno task --quiet build:fast",
  config = function()
    if vim.fn.has("mac") then
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = false,
        syntax = true,
        theme = "dark",
        update_on_change = true,
      })
    else
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = false,
        syntax = true,
        theme = "dark",
        update_on_change = true,
        app = { "/mnt/c/Program Files/Mercury/mercury.exe", "--new-window" }, -- 'webview', 'browser', string or a table of strings explained below
      })
    end
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
  keys = {
    { "<leader>op", "<cmd>PeekOpen<cr>", desc = "Open Peek Preview", buffer = true },
  },
}
