local wezterm = require("wezterm")
local constants = require("constants")

return {
  {
    brief = "Toggle Terminal Transparency",
    icon = "md_circle_opacity",
    action = wezterm.action_callback(function(window)
      local overrides = window:get_config_overrides()
        or {
          window_background_opacity = constants.window_opacity,
          macos_window_background_blur = constants.window_blur,
        }
      if not overrides.window_background_opacity or overrides.window_background_opacity == 1 then
        overrides.window_background_opacity = constants.window_opacity
        overrides.macos_window_background_blur = constants.window_blur
      else
        overrides.window_background_opacity = 1
        overrides.macos_window_background_blur = 0
      end

      window:set_config_overrides(overrides)
    end),
  },
}
