-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- centers c-d and c-u
local Util = require("lazyvim.util")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- centers search function
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.api.nvim_get_color_map()

-- allow changing and deleting without overriding current paste registers
-- in otherwords automatically delete or change to the void register
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

vim.api.nvim_create_user_command("FloatingTerm", function()
  Util.terminal.open()
end, {})

-- run python
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python4 <C-\><C-n>"#pi<CR> ]],
  { silent = true, desc = "Run [P]ython File" }
)

-- run java
vim.keymap.set(
  "n",
  "<leader>rj",
  [[:set autochdir<CR>:w<CR>:FloatingTerm<CR>javac <C-\><C-n>"#pi && java <C-\><C-n>"#pi<BS><BS><BS><BS><BS><CR> ]],
  { silent = true, desc = "Run [J]ava File" }
)

-- run cpp
vim.keymap.set(
  "n",
  "<leader>rc",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> g++ -o <C-\><C-n>"#pi<BS><BS><BS><BS> <C-\><C-n>"#pi && ./<C-\><C-n>"#pi<BS><BS><BS><BS><CR> ]],
  { desc = "Run [C]++ File", silent = true }
)

-- telescope find plugin files
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { silent = true, desc = "Find [P]lugin File" })

-- This conflicts with vim's <C-a> key map that increments selected numbers, but
-- I think it is a worth trade-off because <C-a> to select the whole file is so common
-- in every other application I use. (C-x decrements numbers)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select [A]ll" })

-- adds <Control + backspace> and <Control + delete> to insert mode
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de")
vim.keymap.set("i", "<A-a>", "<C-o>A", { silent = true })

-- replace all instances of word (without LSP)
vim.keymap.set(
  "n",
  "<leader>ci",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace [I]nstances" }
)

-- remove all other windows, same as :on or :only
vim.keymap.set("n", "<leader>wo", [[:only <CR>]], { silent = true, desc = "Window [O]nly" })

-- R markdown code block
vim.keymap.set("n", "<leader>Rb", [[i```{r}<cr>```<esc>O]], { desc = "R Code Block", silent = true })
-- R knit html
vim.keymap.set("n", "<leader>Rkh", [[:w <cr>:RMarkdown html<CR>]], { silent = true, desc = "R Knit html" })
-- R knit pdf
vim.keymap.set(
  "n",
  "<leader>Rkp",
  [[:w <cr>:RMarkdown pdf latex_engine="xelatex"<CR>]],
  { silent = true, desc = "R Knit pdf" }
)
-- R heading
vim.keymap.set(
  "n",
  "<leader>Rh",
  [[i---<CR>title: ""<CR>author: ""<CR>date: "`r Sys.Date()`"<CR>output: html_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>]],
  { desc = "R Header" }
)
-- undo tree (muntree)
vim.keymap.set("n", "<leader>ut", [[:UndotreeToggle <cr><c-w>h]], { silent = true, desc = "Undo [T]ree" })

-- view alpha (homescreen) buffer
vim.keymap.set("n", "<leader>A", [[:Alpha<CR>]], { silent = true })

-- markdown preview
vim.keymap.set("n", "<leader>mp", [[:MarkdownPreview<CR>]], { silent = true, desc = "Markdown [P]review" })

-- remove weid symbol (^ M) on paste
vim.api.nvim_set_keymap("n", "p", "p<CMD>%s/\\r//<CR>", { desc = "Better paste", silent = true })

-- support for ranger plugin
vim.keymap.set("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { silent = true, desc = "[E]xplore" })

-- support for markdown table mode
vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Markdown [T]able Mode" })
-- window rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window [R]otate" })
-- markdown table of contents
vim.keymap.set("n", "<leader>tc", "<CMD>Toc<CR><CMD>set nornu<CR>", { silent = true, desc = "Table of [C]ontents" })

-- get one dark pro colors
vim.keymap.set(
  "n",
  "<leader>ug",
  "<CMD>OnedarkproColors<CR>VGy<CMD>bd<CR>pvip:norm 0i-- <CR>",
  { silent = true, noremap = false, desc = "[G]et Theme Colors" }
)
-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z", { silent = true, desc = "better J" })

-- better z<CR> (top line)
vim.keymap.set("n", "z<CR>", "zt", { desc = "Top this line" })

-- center view port on doube escape
vim.keymap.set("n", "<ESC><ESC>", "zz", { silent = true, desc = "Center" })

-- insert mode comment line
vim.keymap.set("i", "<c-c>", "<Esc>Vgcgi", { silent = true, desc = "Comment line", noremap = false })
