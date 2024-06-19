-- fuzzy file finder and a whole lot more
-- use <leader><leader> to find within a directory (respects git)
-- previewer omits files that are too large or un-preview-able, catimg for
-- images
return {
  "telescope.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      preview = {
        filesize_limit = 0.5, -- MB
      },
      mappings = {
        i = {
          ["<ESC>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-d>"] = require("telescope.actions").delete_buffer,
          ["<C-u>"] = false,
          ["<C-h>"] = function() -- for windows
            vim.cmd([[normal! bcw ]])
          end,
          ["<C-l>"] = require("telescope.actions").select_horizontal,
          ["<C-x>"] = false,
          ["<C-Space>"] = require("telescope.actions").select_tab,
        },
      },
    },
  },
  keys = {
    {
      "<leader><space>",
      function()
        if vim.fn.has("unix") == 1 then
          require("telescope").extensions.smart_open.smart_open()
        else
          local builtin = require("telescope.builtin")
          local utils = require("telescope.utils")
          builtin.find_files({ cwd = utils.buffer_dir() })
        end
      end,
      desc = "Smart Open/Find Files",
    },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>fo",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Find Old Files",
    },
    {
      "<leader>;",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
      silent = true,
    },
    {
      "<leader>R",
      function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        pickers
          .new(opts, {
            prompt_title = "Plugins",
            finder = finders.new_table({
              results = require("config.utils").pluginNames(),
            }),
            sorter = conf.generic_sorter(opts),

            attach_mappings = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("Lazy reload " .. selection[1])
              end)
              return true
            end,
          })
          :find()
      end,
      desc = "Reload Plugin",
    },
    -- for some reason this keymap doesn't override the default behavior of
    -- <C-f> properly
    -- {
    --   "<C-f>",
    --   function()
    --     require("telescope.builtin").current_buffer_fuzzy_find(
    --       require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
    --     )
    --   end,
    --   desc = "Find Word",
    -- },
    { "<leader>sb", false },
    { "<leader>sg", false },
    { "<leader>sa", false },
    { "<leader>sc", false },
    { "<leader>sm", false },
    { '<leader>s"', false },
    { "<leader>sq", false },
    { "<leader>sG", false },
    { "<leader>fb", false },
    { "<leader>sl", false },
    { "<leader>fg", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>sC", false },
  },
}
