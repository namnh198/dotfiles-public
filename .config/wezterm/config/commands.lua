local wezterm = require("wezterm")

return {
  {
    brief = "Toggle Terminal Transparency",
    icon = "md_circle_opacity",
    action = wezterm.action_callback(function(window)
      local overrides = window:get_config_overrides() or {}
      if not overrides.window_background_opacity or overrides.window_background_opacity == 1 then
        overrides.window_background_opacity = 0.7
        overrides.macos_window_background_blur = 80
      else
        overrides.window_background_opacity = 1
        overrides.macos_window_background_blur = 0
      end

      window:set_config_overrides(overrides)
    end),
  },
}
