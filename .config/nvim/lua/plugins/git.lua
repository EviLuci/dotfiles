return {
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles"
        },
        config = true
    },
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        opts = {
            integrations = {
                diffview = true
            },
            disable_commit_confirmation = true
        },
        keys = {
            {
                "<leader>gn",
                "<cmd>Neogit kind=tab<cr>",
                desc = "Status"
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = {
                    hl = "GitSignsAdd",
                    text = "+",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn"
                },
                change = {
                    hl = "GitSignsChange",
                    text = "▍",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "▾",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "~",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                },
                untracked = {
                    text = "┆"
                }
            }
        }
    }

}
