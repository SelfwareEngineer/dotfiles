local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Uncomment to test if issues are wayland-related
--config.enable_wayland = false

return config
