local wezterm = require 'wezterm'

local config = {}

config.color_scheme = "nord"
config.font_size = 14.0

-- Set initial transparency
config.window_background_opacity = 1.0

-- Key binding to toggle transparency (CMD+SHIFT+T for Mac)
config.keys = {
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      if overrides.window_background_opacity then
        -- If transparency is set, remove it (make opaque)
        overrides.window_background_opacity = nil
      else
        -- If opaque, make it transparent
        overrides.window_background_opacity = 0.80
      end
      window:set_config_overrides(overrides)
    end),
  },
}

return config
