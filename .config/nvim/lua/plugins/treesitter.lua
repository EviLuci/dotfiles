return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        {
            "RRethy/nvim-treesitter-endwise"
        },
        {
            "RRethy/nvim-treesitter-textsubjects"
        }
    },
    opts = {
        ensure_installed = {
            "fish",
            "rust",
            "sql"
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = {
                "norg",
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
            lsp_interop = {
                enable = true,
                border = 'none',
                floating_preview_opts = {},
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer"
                }
            },
            swap = {
                enable = true
            }
        },
        textsubjects = {
            enable = true,
            prev_selection = ',', -- (Optional) keymap to select the previous selection
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = {
                    'textsubjects-container-inner',
                    desc = "Select inside containers (classes, functions, etc.)"
                }
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

