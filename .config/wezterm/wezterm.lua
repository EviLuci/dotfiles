-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

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
        mods = 'CTRL',
        timeout_milliseconds = 2000
    }
}

-- Keybindings
-- Disable default key assignment
config.keys = {
    {
        key = 'c',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'v',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'm',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'n',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '-',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '=',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '0',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 't',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'w',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '1',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '2',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '3',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '4',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '5',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '6',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '7',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '8',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '9',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = '[',
        mods = 'SUPER|SHIFT',
        action = act.DisableDefaultAssignment
    },
    {
        key = ']',
        mods = 'SUPER|SHIFT',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'r',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'h',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'k',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    },
    {
        key = 'f',
        mods = 'SUPER',
        action = act.DisableDefaultAssignment
    }

}

-- Personal key assignment
config.keys = {
    -- Navigation
    {
        key = "h",
        mods = "CTRL",
        action = act({
            ActivatePaneDirection = "Left"
        })
    },
    {
        key = "l",
        mods = "CTRL",
        action = act({
            ActivatePaneDirection = "Right"
        })
    },
    {
        key = 'j',
        mods = 'CTRL',
        action = act.ActivatePaneDirection 'Down'
    },
    {
        key = 'k',
        mods = 'CTRL',
        action = act.ActivatePaneDirection 'Up'
    },

    {
        key = "h",
        mods = "ALT",
        action = act({
            ActivateTabRelative = -1
        })
    },
    {
        key = "l",
        mods = "ALT",
        action = act({
            ActivateTabRelative = 1
        })
    },
    {
        key = "h",
        mods = "ALT|SHIFT",
        action = act({
            MoveTabRelative = -1
        })
    },
    {
        key = "l",
        mods = "ALT|SHIFT",
        action = act({
            MoveTabRelative = 1
        })
    },

    {
        key = "b",
        mods = "ALT",
        action = act({
            ScrollByPage = -1
        })
    },
    {
        key = "f",
        mods = "ALT",
        action = act({
            ScrollByPage = 1
        })
    },

    {
        key = "1",
        mods = "ALT",
        action = act({
            ActivateTab = 0
        })
    },
    {
        key = "2",
        mods = "ALT",
        action = act({
            ActivateTab = 1
        })
    },
    {
        key = "3",
        mods = "ALT",
        action = act({
            ActivateTab = 2
        })
    },
    {
        key = "4",
        mods = "ALT",
        action = act({
            ActivateTab = 3
        })
    },
    {
        key = "5",
        mods = "ALT",
        action = act({
            ActivateTab = 4
        })
    },
    {
        key = "6",
        mods = "ALT",
        action = act({
            ActivateTab = 5
        })
    },
    {
        key = "7",
        mods = "ALT",
        action = act({
            ActivateTab = 6
        })
    },
    {
        key = "8",
        mods = "ALT",
        action = act({
            ActivateTab = 7
        })
    },
    {
        key = "9",
        mods = "ALT",
        action = act({
            ActivateTab = 8
        })
    },
    {
        key = "0",
        mods = "ALT",
        action = act({
            ActivateTab = 9
        })
    },

    -- Manipulate window
    {
        key = 'q',
        mods = 'ALT',
        action = act.CloseCurrentTab {
            confirm = true
        }
    },
    {
        key = 'x',
        mods = 'ALT',
        action = act.CloseCurrentPane {
            confirm = true
        }
    },

    {
        key = "t",
        mods = "ALT",
        action = act({
            SpawnTab = "DefaultDomain"
        })
    },
    {
        key = "n",
        mods = "ALT",
        action = act.PromptInputLine({
            description = "Enter new name for tab",
            -- selene: allow(unused_variable)
            ---@diagnostic disable-next-line: unused-local
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then window:active_tab():set_title(line) end
            end)
        })
    },

    {
        key = 'v',
        mods = 'ALT',
        action = act.SplitVertical {
            domain = 'CurrentPaneDomain'
        }
    },
    {
        key = 's',
        mods = 'ALT',
        action = act.SplitHorizontal {
            domain = 'CurrentPaneDomain'
        }
    },

    {
        key = "h",
        mods = "ALT|CTRL",
        action = act({
            AdjustPaneSize = {
                "Left",
                1
            }
        })
    },
    {
        key = "l",
        mods = "ALT|CTRL",
        action = act({
            AdjustPaneSize = {
                "Right",
                1
            }
        })
    },
    {
        key = "k",
        mods = "ALT|CTRL",
        action = act({
            AdjustPaneSize = {
                "Up",
                1
            }
        })
    },
    {
        key = "j",
        mods = "ALT|CTRL",
        action = act({
            AdjustPaneSize = {
                "Down",
                1
            }
        })
    },

    -- Actions
    {
        key = 'Enter',
        mods = 'ALT',
        action = "QuickSelect"
    },
    {
        key = "*",
        mods = "NONE",
        action = act.Search("CurrentSelectionOrEmptyString")
    },
    {
        key = 'y',
        mods = 'CTRL|SHIFT',
        action = act.CharSelect {
            copy_on_select = true,
            copy_to = 'ClipboardAndPrimarySelection'
        }
    },
    {
        key = 'y',
        mods = 'CTRL',
        action = act.CopyTo 'PrimarySelection'
    },
    {
        key = 'p',
        mods = 'CTRL',
        action = act.PasteFrom 'PrimarySelection'
    },

    -- Misc
    {
        key = "p",
        mods = "ALT",
        action = wezterm.action.ShowLauncher
    },
    {
        key = " ",
        mods = "ALT",
        action = wezterm.action.ShowTabNavigator
    },
    {
        key = "d",
        mods = "ALT|SHIFT",
        action = wezterm.action.ShowDebugOverlay
    }
}

-- Key tables
config.key_tables = {
    resize_pane = {
        {
            key = 'LeftArrow',
            action = act.AdjustPaneSize {
                'Left',
                1
            }
        },
        {
            key = 'h',
            action = act.AdjustPaneSize {
                'Left',
                1
            }
        },

        {
            key = 'RightArrow',
            action = act.AdjustPaneSize {
                'Right',
                1
            }
        },
        {
            key = 'l',
            action = act.AdjustPaneSize {
                'Right',
                1
            }
        },

        {
            key = 'UpArrow',
            action = act.AdjustPaneSize {
                'Up',
                1
            }
        },
        {
            key = 'k',
            action = act.AdjustPaneSize {
                'Up',
                1
            }
        },

        {
            key = 'DownArrow',
            action = act.AdjustPaneSize {
                'Down',
                1
            }
        },
        {
            key = 'j',
            action = act.AdjustPaneSize {
                'Down',
                1
            }
        },

        -- Cancel the mode by pressing escape
        {
            key = 'Escape',
            action = 'PopKeyTable'
        }
    }
}

-- mode Activation
config.keys = {
    {
        key = 'r',
        mods = 'ALT',
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
            timeout_milliseconds = 3000,
            replace_current = false
        }
    },
    {
        key = 'Enter',
        mods = 'ALT',
        action = act.ActivateCopyMode
    }

}

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
    local name = window:active_key_table()
    if name then name = 'TABLE: ' .. name end
    window:set_right_status(name or '')
end)

-- and finally, return the configuration to wezterm
return config

