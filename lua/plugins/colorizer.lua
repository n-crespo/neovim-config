return {
  "catgoose/nvim-colorizer.lua",
  -- event = "BufReadPre",
  ft = { "css", "html", "javascript", "typescript" },
  opts = {
    filetypes = {
      "*",
      noice = { always_update = true },
      blink_menu = { always_update = true },
      blink_docs = { always_update = true },
      cmp_menu = { always_update = true },
      cmp_docs = { always_update = true },
    },
    user_default_options = {
      names_opts = { -- options for mutating/filtering names.
        lowercase = false, -- name:lower(), highlight `blue` and `red`
        camelcase = false, -- name, highlight `Blue` and `Red`
        uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
        strip_digits = true, -- ignore names with digits,
        -- highlight `blue` and `red`, but not `blue3` and `red4`
      },
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      RGB = false, -- #RGB hex codes
      RGBA = false,
    },
  },
  config = function(_, opts)
    require("colorizer").setup(opts)
    vim.api.nvim_create_user_command("REcolor", "lua require('colorizer').reload_all_buffers()", { nargs = 0 })
  end,
  keys = {
    {
      "<leader>sc",
      function()
        require("colorizer").attach_to_buffer(0)
        vim.notify("Colorizer toggled", vim.log.levels.INFO)
      end,
      desc = "Start/Toggle Colorizer",
    },
  },
}
