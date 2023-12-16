return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>ut", [[:UndotreeToggle <cr><c-w>h]], { silent = true, desc = "Undo [T]ree" })
  end,
}
