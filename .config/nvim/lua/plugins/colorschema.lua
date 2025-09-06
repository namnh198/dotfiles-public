return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function(_, opts)
      opts.flavor = "mocha"
      opts.transparent_background = true
      opts.no_italic = true
      opts.float = {
        transparent = true,
        solid = false,
      }
      -- Issue: https://github.com/LazyVim/LazyVim/issues/6355
      local module = require("catppuccin.groups.integrations.bufferline")
      if module then
        module.get = module.get_theme
      end
      return opts
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
