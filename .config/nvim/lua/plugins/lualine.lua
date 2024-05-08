return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = " "
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,
    opts = function()
        local lualine = require('lualine')
        -- PERF: we don't need this lualine require madness 🤷
        local lualine_require = require("lualine_require")
        lualine_require.require = require

        local icons = require("lazyvim.config").icons

        vim.o.laststatus = vim.g.lualine_laststatus

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
            bg = '#202328',
            fg = '#bbc2cf',
            yellow = '#ECBE7B',
            cyan = '#008080',
            darkblue = '#081633',
            green = '#98be65',
            orange = '#FF8800',
            violet = '#a9a1e1',
            magenta = '#c678dd',
            blue = '#51afef',
            red = '#ec5f67'
        }

        local conditions = {
            buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
            hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end
        }

        -- Config
        return {
            options = {
                -- Disable sections and component separators
                component_separators = '',
                section_separators = '',
                globalstatus = true,
                theme = "auto"
            },
            sections = {
                -- Left section component
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        function() return '▊' end,
                        color = {
                            fg = colors.blue
                        }, -- Sets highlighting of component
                        padding = {
                            left = 0,
                            right = 1
                        } -- We don't need space before this
                    },
                    "mode",
                    {
                        -- mode component
                        function() return '' end,
                        color = function()
                            -- auto change color according to neovims mode
                            local mode_color = {
                                n = colors.red,
                                i = colors.green,
                                v = colors.blue,
                                [''] = colors.blue,
                                V = colors.blue,
                                c = colors.magenta,
                                no = colors.red,
                                s = colors.orange,
                                S = colors.orange,
                                [''] = colors.orange,
                                ic = colors.yellow,
                                R = colors.violet,
                                Rv = colors.violet,
                                cv = colors.red,
                                ce = colors.red,
                                r = colors.cyan,
                                rm = colors.cyan,
                                ['r?'] = colors.cyan,
                                ['!'] = colors.red,
                                t = colors.red
                            }
                            return {
                                fg = mode_color[vim.fn.mode()]
                            }
                        end,
                        padding = {
                            right = 1
                        }
                    },
                    {
                        -- filesize component
                        'filesize',
                        cond = conditions.buffer_not_empty
                    },
                    {
                        'filename',
                        cond = conditions.buffer_not_empty,
                        color = {
                            fg = colors.magenta,
                            gui = 'bold'
                        }
                    },
                    {
                        "filetype",
                        icon_only = true,
                        separator = "",
                        padding = {
                            left = 1,
                            right = 0
                        }
                    },
                    {
                        'location'
                    },
                    {
                        'progress',
                        color = {
                            fg = colors.fg,
                            gui = 'bold'
                        }
                    },
                    {
                        'diagnostics',
                        sources = {
                            'nvim_diagnostic'
                        },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' '
                        },
                        diagnostics_color = {
                            color_error = {
                                fg = colors.red
                            },
                            color_warn = {
                                fg = colors.yellow
                            },
                            color_info = {
                                fg = colors.cyan
                            }
                        }
                    },
                    {
                        function() return '%=' end
                    },
                    {
                        -- Lsp server name .
                        function()
                            local msg = 'No Active Lsp'
                            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                            local clients = vim.lsp.get_active_clients()
                            if next(clients) == nil then return msg end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    return client.name
                                end
                            end
                            return msg
                        end,
                        icon = ' LSP:',
                        color = {
                            fg = '#ffffff',
                            gui = 'bold'
                        }
                    }

                },

                -- Right Section Components
                lualine_x = {
                    {
                        'o:encoding', -- option component same as &encoding in viml
                        fmt = string.upper, -- I'm not sure why it's upper case either ;)
                        cond = conditions.hide_in_width,
                        color = {
                            fg = colors.green,
                            gui = 'bold'
                        }
                    },
                    {
                        'fileformat',
                        fmt = string.upper,
                        icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
                        color = {
                            fg = colors.green,
                            gui = 'bold'
                        }
                    },
                    {
                        'branch',
                        icon = '',
                        color = {
                            fg = colors.violet,
                            gui = 'bold'
                        }
                    },
                    {
                        'diff',
                        symbols = {
                            added = ' ',
                            modified = '󰝤 ',
                            removed = ' '
                        },
                        diff_color = {
                            added = {
                                fg = colors.green
                            },
                            modified = {
                                fg = colors.orange
                            },
                            removed = {
                                fg = colors.red
                            }
                        },
                        cond = conditions.hide_in_width
                    }

                },
                lualine_y = {},
                lualine_z = {
                    {
                        function() return '▊' end,
                        color = {
                            fg = colors.blue
                        },
                        padding = {
                            left = 1
                        }
                    }
                }
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {
                "neo-tree",
                "lazy",
                "toggleterm",
                "quickfix"
            },
            disabled_filetypes = {
                statusline = {
                    "dashboard",
                    "alpha",
                    "starter"
                }
            }
        }

    end
}
