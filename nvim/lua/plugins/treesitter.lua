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
        "BufNewFile"
    },
    dependencies = {
        {
            "nvim-treesitter/playground",
            cmd = "TSPlaygroundToggle"
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            event = "BufRead"
        },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            lazy = true
        },
        {
            "RRethy/nvim-treesitter-endwise"
        },
        {
            "windwp/nvim-ts-autotag"
        }
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
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",

                -- This shows stuff like literal strings, commas, etc.
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?"
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
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer"
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer"
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer"
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer"
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

