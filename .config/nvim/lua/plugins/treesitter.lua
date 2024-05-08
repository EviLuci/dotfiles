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
    dependencies = {
        {
            "RRethy/nvim-treesitter-endwise"
        }
    },
    opts = {
        ensure_installed = {
            "fish",
            "rust",
            "sql"
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
            disable = {},
            additional_vim_regex_highlighting = {
                "org",
                "markdown"
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

