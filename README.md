
# My Neovim Config


## Description

My neovim config based on [LazyVim](https://www.lazyvim.org), with added
plugins, LSPs, and keymaps.

If you don't understand how this works, you probably
shouldn't use this configuration. First check out lazyvim, NvChad, or
kickstart.nvim, and understand how plugins, keymaps, LSPs, and the rest of the
config works.

## Interesting Things

My favorite things about this configuration are (in no particular order):

- the <25 ms startup time (more like 60ms in regular Windows)
  - see the last 2 auto commands in [here](./lua/config/autocmds.lua) (fixing vim's slow clipboard in WSL)
  - see the `vim-startuptime` plugin
- the spider plugin (better `w`, `e`, and `b`)
- the origami plugin (better folding)
- the mini.files plugin (less intrusive version of oil.nvim)
- the mini.ai plugin (text objects)
- the mini.indent scope and indent.blankline plugin (with an instant animation)
- the **functional** LSPs and formatters set up for Java, C++, Markdown, R-Markdown, and Shell
- persistent code sessions (LazyVim default plugin called persistence)
- my transparent one dark pro theme
- the code_runner plugin
  - the better term plugin
- the highlight undo plugin

> [!Note]
> Many of the plugins I use are not visible in `lua/plugins/` because I use the
> lazyvim configuration which already comes with lots of plugins. You can see
> these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I also have
> disabled some plugins that come with LazyVim in the `overrides.lua` file.

To use this configuration (I don't recommend this, make your own)(it probably
won't fully work for you anyway)(you're better off starting your own config and
stealing the chunks that you actually need), just clone the repo into your
`~/.config/nvim` folder. If you don't know how to do that, you shouldn't be
using this in the first place. 

If you're using Windows, stop. Use WSL and be happy.
