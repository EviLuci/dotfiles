local swap_next, swap_prev = (function()
    local swap_objects = {
        p = "@parameter.inner",
        f = "@function.outer",
        c = "@class.outer"
    }

    local n, p = {}, {}
    for key, obj in pairs(swap_objects) do
        n[string.format("<leader>cx%s", key)] = obj
        p[string.format("<leader>cX%s", key)] = obj
    end

    return n, p
end)()

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {
        "BufReadPost",
        "BufNewFile",
        "BufWritePost",
        "VeryLazy"
    },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function()
                -- When in diff mode, we want to use the default
                -- vim text objects c & C instead of the treesitter ones.
                local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
                local configs = require("nvim-treesitter.configs")
                for name, fn in pairs(move) do
                    if name:find("goto") == 1 then
                        move[name] = function(q, ...)
                            if vim.wo.diff then
                                local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                                for key, query in pairs(config or {}) do
                                    if q == query and key:find("[%]%[][cC]") then
                                        vim.cmd("normal! " .. key)
                                        return
                                    end
                                end
                            end
                            return fn(q, ...)
                        end
                    end
                end
            end
        },
        -- Show context of the current function
        {
            "nvim-treesitter/nvim-treesitter-context",
            event = {
                "BufReadPost",
                "BufNewFile",
                "BufWritePost"
            },
            enabled = true,
            opts = {
                mode = "cursor",
                max_lines = 3
            }
        },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = {
                "BufReadPost",
                "BufNewFile",
                "BufWritePost"
            },
            opts = {
                enable_autocmd = false
            }
        },
        {
            "RRethy/nvim-treesitter-endwise"
        },
        -- Automatically add closing tags for HTML and JSX
        {
            "windwp/nvim-ts-autotag",
            event = {
                "BufReadPost",
                "BufNewFile",
                "BufWritePost"
            },
            opts = {}
        }
    },
    cmd = {
        "TSUpdateSync",
        "TSUpdate",
        "TSInstall"
    },
    opts = {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = {
                "org",
                "markdown"
            }
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                -- mappings for incremental selection (visual mappings)
                init_selection = "C-space", -- maps in normal mode to init the node/scope selection
                node_incremental = "C-space", -- increment to the upper named parent
                scope_incremental = "A-space", -- increment to the upper scope (as defined in locals.scm)
                node_decremental = "<bs>" -- decrement to the previous node
            }
        },
        textobjects = {
            -- syntax-aware textobjects
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aC"] = "@conditional.outer",
                    ["iC"] = "@conditional.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["is"] = "@statement.inner",
                    ["as"] = "@statement.outer",
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner"
                }
            },

            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer"
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer"
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer"
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer"
                }
            },
            swap = {
                enable = true,
                swap_next = swap_next,
                swap_previous = swap_prev
            }
        },
        matchup = {
            enable = true
        },
        indent = {
            enable = true
        },
        autopairs = {
            enable = true
        },
        endwise = {
            enable = true
        },
        autotag = {
            enable = true
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false
        }
    }
}

