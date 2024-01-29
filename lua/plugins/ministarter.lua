return {
  "echasnovski/mini.starter",
  event = "VimEnter",
  lazy = false,
  enabled = true,
  version = false,
  config = function()
    local status, starter = pcall(require, "mini.starter")
    if not status then
      return
    end
    starter.setup({
      content_hooks = {
        starter.gen_hook.adding_bullet("░ "),
        starter.gen_hook.aligning("center", "center"),
      },
      evaluate_single = true,
      silent = true,
      autoopen = true,
      -- footer = os.date("%A, %B %d, %Y %I:%M %p"),
      footer = "",

      -- header = table.concat({
      --   [[  /\ \▔\___  ___/\   /()_ __ ___  ]],
      --   [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
      --   [[/ /\  /  __/ (_) \ V /| | | | | | |]],
      --   [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
      --   [[───────────────────────────────────]],
      -- }, "\n"),

      header = "",

      query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
      items = {
        {
          name = "Explore",
          action = "lua require('mini.files').open(vim.loop.cwd(), true)",
          section = " ",
        },
        {
          name = "Recent files",
          action = "Telescope oldfiles",
          section = " ",
        },
        {
          name = "Config files",
          action = "lua require('lazyvim.util').telescope.config_files()()",
          section = " ",
        },
        { name = "Session restore", action = [[lua require("persistence").load()]], section = " " },
        { name = "Lazy", action = "Lazy", section = " " },
        { name = "Quit", action = "qa", section = " " },
      },
    })

    vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
  augroup END
]])
  end,
}
