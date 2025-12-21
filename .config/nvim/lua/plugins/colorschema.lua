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
