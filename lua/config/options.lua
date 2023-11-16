-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- NOTE: This is a limitation of using neovim in WSL, and makes yanking and
-- pasting a bit slow. Using "unnamedplus" makes it instant, but then increases
-- startup SUBSTANTIALLY (almost 900ms) (see :StartupTime --> clipboard.vim), so
-- this is my current best solution. Also I had to remove my powershell profile
-- configuration (🥲) so it wouldn't take ten years to paste.

vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
    ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
  },
  cache_enabled = 1,
}

local opt = vim.opt
opt.autowrite = true -- Enable auto writes
opt.conceallevel = 3 -- Hide * markup for bold and italics
-- opt.clipboard = "unnamedplus" -- lowkey does nothing bc i alreay defined the clipboard above (i think)

opt.cursorline = true
opt.relativenumber = true
-- opt.winbar = "%=%m %f"

-- print("hello")
vim.g.netrw_browsex_viewer = "sudo firefox" -- edit commands for gx and :open
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.wrap = false

opt.incsearch = true
opt.autochdir = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.numberwidth = 1
opt.relativenumber = true
opt.textwidth = 80
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.foldmethod = "indent"
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_toc_autofit = 1
