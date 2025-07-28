local wezterm = require("wezterm")

return {
  keys = {
    {
      key = "q",
      mods = "CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = "'",
      mods = "CTRL",
      action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
    },
    {
      key = "c",
      mods = "CMD",
      action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
    },
    -- {
    --   key = "t",
    --   mods = "CMD",
    --   action = wezterm.action.DisableDefaultAssignment,
    -- },
  },
  mouse_bindings = {
    -- Ctrl + Click to open link
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
}
