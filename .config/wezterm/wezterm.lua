-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- require("keys").setup(config)

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

    enable_wayland = true,
    webgpu_power_preference = "HighPerformance",

    alternate_buffer_wheel_scroll_speed = 1,
    window_decorations = "NONE",
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

config.hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    --
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
        regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
        format = "$0"
    },

    -- linkify email addresses
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
        regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
        format = "mailto:$0"
    },

    -- file:// URI
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
        regex = [[\bfile://\S*\b]],
        format = "$0"
    },

    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- E.g. http://127.0.0.1:8000 for a local development server,
    -- or http://192.168.1.1 for the web interface of many routers.
    {
        regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
        format = "$0"
    },

    -- Make username/project paths clickable. This implies paths like the following are for GitHub.
    -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
    -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
    {
        regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
        format = "https://www.github.com/$1/$3"
    }
}

-- Keybindings
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
        key = "PageUp",
        mods = "ALT",
        action = act({
            ScrollByPage = -1
        })
    },
    {
        key = "PageDown",
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
        key = '|',
        mods = 'ALT',
        action = act.SplitVertical {
            domain = 'CurrentPaneDomain'
        }
    },
    {
        key = '-',
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
        key = "=",
        mods = "CTRL",
        action = "ResetFontSize"
    },
    {
        key = "+",
        mods = "CTRL|SHIFT",
        action = "IncreaseFontSize"
    },
    {
        key = "-",
        mods = "CTRL",
        action = "DecreaseFontSize"
    },
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
    -- Defines the keys that are active in our resize-pane mode.
    -- Since we're likely to want to make multiple adjustments,
    -- we made the activation one_shot=false. We therefore need
    -- to define a key assignment for getting out of this mode.
    -- 'resize_pane' here corresponds to the name="resize_pane" in
    -- the key assignments above.
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

    },

    -- Defines the keys that are active in our activate-pane mode.
    -- 'activate_pane' here corresponds to the name="activate_pane" in
    -- the key assignments above.
    activate_pane = {
        {
            key = 'LeftArrow',
            action = act.ActivatePaneDirection 'Left'
        },
        {
            key = 'h',
            action = act.ActivatePaneDirection 'Left'
        },

        {
            key = 'RightArrow',
            action = act.ActivatePaneDirection 'Right'
        },
        {
            key = 'l',
            action = act.ActivatePaneDirection 'Right'
        },

        {
            key = 'UpArrow',
            action = act.ActivatePaneDirection 'Up'
        },
        {
            key = 'k',
            action = act.ActivatePaneDirection 'Up'
        },

        {
            key = 'DownArrow',
            action = act.ActivatePaneDirection 'Down'
        },
        {
            key = 'j',
            action = act.ActivatePaneDirection 'Down'
        }
    },
    copy_mode = {
        {
            key = "Escape",
            mods = "NONE",
            action = act.Multiple({
                act.ClearSelection,
                act.CopyMode("ClearPattern"),
                act.CopyMode("Close")
            })
        },
        {
            key = "q",
            mods = "NONE",
            action = act.CopyMode("Close")
        },
        -- move cursor
        {
            key = "h",
            mods = "NONE",
            action = act.CopyMode("MoveLeft")
        },
        {
            key = "LeftArrow",
            mods = "NONE",
            action = act.CopyMode("MoveLeft")
        },
        {
            key = "j",
            mods = "NONE",
            action = act.CopyMode("MoveDown")
        },
        {
            key = "DownArrow",
            mods = "NONE",
            action = act.CopyMode("MoveDown")
        },
        {
            key = "k",
            mods = "NONE",
            action = act.CopyMode("MoveUp")
        },
        {
            key = "UpArrow",
            mods = "NONE",
            action = act.CopyMode("MoveUp")
        },
        {
            key = "l",
            mods = "NONE",
            action = act.CopyMode("MoveRight")
        },
        {
            key = "RightArrow",
            mods = "NONE",
            action = act.CopyMode("MoveRight")
        },
        -- move word
        {
            key = "w",
            mods = "NONE",
            action = act.CopyMode("MoveForwardWord")
        },
        {
            key = "b",
            mods = "NONE",
            action = act.CopyMode("MoveBackwardWord")
        },
        {
            key = "e",
            mods = "NONE",
            action = act({
                Multiple = {
                    act.CopyMode("MoveRight"),
                    act.CopyMode("MoveForwardWord"),
                    act.CopyMode("MoveLeft")
                }
            })
        },
        -- move start/end
        {
            key = "0",
            mods = "NONE",
            action = act.CopyMode("MoveToStartOfLine")
        },
        {
            key = "$",
            mods = "NONE",
            action = act.CopyMode("MoveToEndOfLineContent")
        },
        {
            key = "a",
            mods = "SHIFT",
            action = act.CopyMode("MoveToEndOfLineContent")
        },
        {
            key = "^",
            mods = "NONE",
            action = act.CopyMode("MoveToStartOfLineContent")
        },
        {
            key = "i",
            mods = "SHIFT",
            action = act.CopyMode("MoveToStartOfLineContent")
        },
        -- select
        {
            key = " ",
            mods = "NONE",
            action = act.CopyMode({
                SetSelectionMode = "Cell"
            })
        },
        {
            key = "v",
            mods = "NONE",
            action = act.CopyMode({
                SetSelectionMode = "Cell"
            })
        },
        {
            key = "v",
            mods = "SHIFT",
            action = act({
                Multiple = {
                    act.CopyMode("MoveToStartOfLineContent"),
                    act.CopyMode({
                        SetSelectionMode = "Cell"
                    }),
                    act.CopyMode("MoveToEndOfLineContent")
                }
            })
        },
        -- copy
        {
            key = "y",
            mods = "NONE",
            action = act({
                Multiple = {
                    act({
                        CopyTo = "ClipboardAndPrimarySelection"
                    }),
                    act.CopyMode("Close")
                }
            })
        },
        {
            key = "y",
            mods = "SHIFT",
            action = act({
                Multiple = {
                    act.CopyMode({
                        SetSelectionMode = "Cell"
                    }),
                    act.CopyMode("MoveToEndOfLineContent"),
                    act({
                        CopyTo = "ClipboardAndPrimarySelection"
                    }),
                    act.CopyMode("Close")
                }
            })
        },
        -- scroll
        {
            key = "G",
            mods = "SHIFT",
            action = act.CopyMode("MoveToScrollbackBottom")
        },
        {
            key = "g",
            mods = "NONE",
            action = act.CopyMode("MoveToScrollbackTop")
        },
        {
            key = "h",
            mods = "SHIFT",
            action = act.CopyMode("MoveToViewportTop")
        },
        {
            key = "m",
            mods = "SHIFT",
            action = act.CopyMode("MoveToViewportMiddle")
        },
        {
            key = "d",
            mods = "SHIFT",
            action = act.CopyMode("MoveToViewportBottom")
        },
        {
            key = "o",
            mods = "NONE",
            action = act.CopyMode("MoveToSelectionOtherEnd")
        },
        {
            key = "O",
            mods = "NONE",
            action = act.CopyMode("MoveToSelectionOtherEndHoriz")
        },
        {
            key = "O",
            mods = "SHIFT",
            action = act.CopyMode("MoveToSelectionOtherEndHoriz")
        },
        {
            key = "PageUp",
            mods = "NONE",
            action = act.CopyMode("PageUp")
        },
        {
            key = "PageDown",
            mods = "NONE",
            action = act.CopyMode("PageDown")
        },
        {
            key = "b",
            mods = "CTRL",
            action = act.CopyMode("PageUp")
        },
        {
            key = "f",
            mods = "CTRL",
            action = act.CopyMode("PageDown")
        },
        {
            key = "Enter",
            mods = "NONE",
            action = act.CopyMode("ClearSelectionMode")
        },
        -- search
        {
            key = "/",
            mods = "NONE",
            action = act.Search("CurrentSelectionOrEmptyString")
        },
        {
            key = "n",
            mods = "NONE",
            action = act.Multiple({
                act.CopyMode("NextMatch"),
                act.CopyMode("ClearSelectionMode")
            })
        },
        {
            key = "N",
            mods = "SHIFT",
            action = act.Multiple({
                act.CopyMode("PriorMatch"),
                act.CopyMode("ClearSelectionMode")
            })
        }
    },
    search_mode = {
        {
            key = "Escape",
            mods = "NONE",
            action = act.CopyMode("Close")
        },
        {
            key = "Enter",
            mods = "NONE",
            action = act.Multiple({
                act.CopyMode("ClearSelectionMode"),
                act.ActivateCopyMode
            })
        },
        {
            key = "p",
            mods = "CTRL",
            action = act.CopyMode("PriorMatch")
        },
        {
            key = "n",
            mods = "CTRL",
            action = act.CopyMode("NextMatch")
        },
        {
            key = "r",
            mods = "CTRL",
            action = act.CopyMode("CycleMatchType")
        },
        {
            key = "/",
            mods = "NONE",
            action = act.CopyMode("ClearPattern")
        },
        {
            key = "u",
            mods = "CTRL",
            action = act.CopyMode("ClearPattern")
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
        action = act.ActivateKeyTable {
            name = 'copy_mode'
        }
    },
    {
        key = 's',
        mods = 'ALT',
        action = act.ActivateKeyTable {
            name = 'search_mode'
        }
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
    }

}

-- and finally, return the configuration to wezterm
return config

