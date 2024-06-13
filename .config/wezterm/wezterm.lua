-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

require("links").setup(config)
require("keys").setup(config)

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- This table will hold the configuration.
local config = {
    -- Spawn a fish shell in login mode
    default_prog = {
        '/usr/bin/fish',
        '-l'
    },

    check_for_updates = false,
    automatically_reload_config = true,
    use_dead_keys = false,
    warn_about_missing_glyphs = false,
    adjust_window_size_when_changing_font_size = false,

    front_end = "WebGpu",
    enable_wayland = false,
    webgpu_power_preference = "HighPerformance",

    alternate_buffer_wheel_scroll_speed = 1,
    window_decorations = "RESIZE",
    window_background_opacity = 0.8,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,

    color_scheme = 'Tokyo Night',
    font = wezterm.font('Firacode Nerd Font'),
    font_size = 10,
    line_height = 1,

    leader = {
        key = 'Space',
        mods = 'CTRL|SHIFT',
        timeout_milliseconds = 2000
    }
}

-- and finally, return the configuration to wezterm
return config

