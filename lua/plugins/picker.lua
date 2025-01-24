-- vim.api.nvim_create_autocmd({ "BufEnter", "Filetype" }, {
--   pattern = "snacks_picker_preview",
--   callback = function()
--     vim.keymap.set("n", "<Tab>", Snacks.picker.actions.focus_input, { buffer = true })
--   end,
-- })
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      cycle = true,
      layout = function()
        return vim.o.columns >= 120 and "telescope" or "vertical"
      end,
      -- layout = "telescope",
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
        },
      },
      win = {
        -- input window
        input = {
          keys = {
            -- custom
            ["<S-Tab>"] = { "", mode = { "i", "n" } },
            ["<C-a>"] = { "", mode = { "i", "n" } },
            ["<C-p>"] = { "history_back", mode = { "i", "n" } },
            ["<C-n>"] = { "history_forward", mode = { "i", "n" } },
            ["<c-s-/>"] = { "toggle_help", mode = { "i", "n" } },
            ["<a-o>"] = { "toggle_maximize", mode = { "i", "n" } },
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<Tab>"] = { "cycle_win", mode = { "i", "n" } },
            ["<c-space>"] = { "edit_tab", mode = { "i", "n" } },
            ["<c-l>"] = { "edit_split", mode = { "i", "n" } },

            -- scrolling
            ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },

            -- what does this do??
            ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
            ["<a-y>"] = { "toggle_follow", mode = { "i", "n" } },

            -- remap to something else?
            ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
            ["<a-u>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
          },
          b = {
            minipairs_disable = true,
          },
        },
        list = {
          keys = {
            ["<Tab>"] = { "focus_input", mode = { "i", "n" } },
            ["<S-Tab>"] = { "", mode = { "i", "n" } },
          },
        },
        -- preview window
        preview = {
          keys = {
            ["<Tab>"] = { "focus_input" },
            ["<Esc>"] = "close",
            ["i"] = "focus_input",
          },
          -- wo = { number = false, cursorline = false, statuscolumn = "" },
        },
      },
    },
  },
  dependencies = {
    "folke/todo-comments.nvim",
    keys = {
      {
        "<leader>st",
        function()
          ---@diagnostic disable-next-line: undefined-field
          Snacks.picker.todo_comments({ cwd = vim.fn.expand("%:h") })
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          ---@diagnostic disable-next-line: undefined-field
          Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" }, cwd = vim.fn.expand("%:h") })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
  keys = {
    ----------- PICKER KEYMAPS -------------
    { "<leader>gc", nil },
    { "<leader>sg", nil },
    { "<leader>fb", nil },
    { "<leader>fr", nil },
    { "<leader>ff", nil },
    { "<leader>sc", nil },
    { "<leader>sq", nil }, -- quickfix list
    { "<leader>sC", nil },
    { "<leader>sG", nil },
    { "<leader>sl", nil },
    { '<leader>s"', nil },
    { "<leader>qp", nil },
    { "<leader>sB", nil },
    -- { "<leader>fF", nil },
    { "<leader>fg", nil },
    { "<leader>fR", nil },
    { "<leader>sw", nil },
    { "<leader>sW", nil },
    { "<leader>sM", nil },
    { "<leader>sm", nil },
    { "<leader>sb", nil },
    -- -- bug: this does some weird things
    -- {
    --   "<leader>U",
    --   function()
    --     Snacks.picker.undo()
    --   end,
    --   desc = "Commands",
    -- },
    {
      "z=",
      function()
        Snacks.picker.spelling({
          layout = {
            preview = false,
            layout = {
              backdrop = true,
              row = 1,
              width = 0.4,
              min_width = 80,
              height = 0.4,
              border = "none",
              box = "vertical",
              { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              { win = "list", border = "rounded" },
              { win = "preview", title = "{preview}", border = "rounded" },
            },
          },
        })
      end,
      desc = "Show Spelling Suggestions",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Recent (smart)",
    },
    {
      "<leader>fw",
      function()
        -- local preset = "ivy"
        return (
          vim.fn.expand("%:h") ~= ""
          ---@diagnostic disable-next-line: missing-fields
          and Snacks.picker.grep({
            cwd = vim.fn.expand("%:h"),
            -- layout = {
            --   preset = preset,
            -- },
          })
        )
          ---@diagnostic disable-next-line: missing-fields
          or Snacks.picker.grep({
            -- if alternate buffer exists, use its directory
            cwd = vim.fn.bufexists(vim.fn.bufnr("#")) == 1
                and vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr("#")), ":h")
              -- or use cwd
              or vim.fn.getcwd(),
            -- layout = {
            --   preview = "main",
            --   preset = preset,
            -- },
          })
      end,
      desc = "Grep (cwd)",
    },
    {
      "<leader>ff",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = vim.fn.expand("%:h"), hidden = true, ignored = true })
      end,
      desc = "Find Files (Buffer Dir)",
    },
    {
      "<leader>fh",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = LazyVim.root.get({ normalize = true, hidden = true, ignored = true }) })
      end,
      desc = "Files Here (Root)",
    },
    {
      "<leader>fp",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>;",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>j",
      function()
        Snacks.picker.zoxide()
      end,
      desc = "Jump to Project",
    },
  },
}
