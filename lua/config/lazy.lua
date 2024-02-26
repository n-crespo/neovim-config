local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   -- bootstrap lazy.nvim
   -- stylua: ignore
  vim.fn.system({ "git", "clone", "filter=blob:none", "https://github.com/folke/lazy.nvim.git", "branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins
    -- will load during startup. If you know what you're doing, you can set this
    -- to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin
    -- that support versioning have outdated releases, which may break your
    -- Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*",  try installing the latest stable version for plugins that support semver
  },
  -- add borders and make :Lazy window smaller
  ui = {
    border = "rounded",
    size = {
      width = 0.8,
      height = 0.8,
    },
  },
  -- don't show message on config change/reload
  change_detection = {
    notify = false,
  },
  -- install = { colorscheme = { "onedark_dark" } },
  checker = { enabled = true }, --   automatically check for plugin updates
  performance = {
    -- disable some rtp plugins
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
