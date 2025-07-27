local wezterm = require("wezterm")
local commands = require("config.commands")
local bindings = require("config.keybinds")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- General Settings
config.default_prog = { "zsh", "-l" } -- Default start zsh shell
config.window_close_confirmation = "NeverPrompt" -- Remove confirmation dialog when existing
config.audible_bell = "Disabled" -- Disable sounds when at the end of document

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Expanded" })
config.font_size = 13
config.line_height = 1.2

-- Colors
config.color_scheme = "Catppuccin Mocha"

-- Appearance
-- config.window_decorations = "RESIZE" -- Hide title bar
config.enable_tab_bar = false -- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 12,
  right = 4,
  top = 8,
  bottom = 2,
}
config.initial_cols = 120
config.initial_rows = 40

-- Cursor
config.default_cursor_style = "SteadyBar"
config.cursor_blink_rate = 0
config.hide_mouse_cursor_when_typing = false

-- Scrollbar
config.enable_scroll_bar = false

-- Miscellaneous Settings
config.max_fps = 120
config.prefer_egl = true

-- Keys & Mouse Bindings
config.keys = bindings.keys
config.mouse_bindings = bindings.mouse_bindings

-- Custom commands
wezterm.on("augment-command-palette", function()
  return commands
end)

return config
