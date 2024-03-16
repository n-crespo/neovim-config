-- AMAZING plugin that stops nested nvim instances from being created
-- in :term or betterterm, (C-q), using `nvim {file}` will open the file in
-- the primary instance of neovim. Works nicely with autojump and fzf
return {
  "willothy/flatten.nvim",
  lazy = false, -- Ensure that it runs first to minimize delay when opening file from terminal
  opts = {
    window = {
      open = "tab",
    },
  },
}
