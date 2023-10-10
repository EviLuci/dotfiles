return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = {
            spelling = true
        },
        defaults = {
            mode = {
                "n",
                "v"
            },
            ["g"] = {
                name = "+Goto"
            },
            ["]"] = {
                name = "+Next"
            },
            ["["] = {
                name = "+Prev"
            },
            ["<leader><tab>"] = {
                name = "+Tabs"
            },
            ["<leader>b"] = {
                name = "+Buffer"
            },
            ["<leader>e"] = {
                name = "+Explorer"
            },
            ["<leader>t"] = {
                name = "+Terminal"
            },
            ["<leader>o"] = {
                name = "+Open"
            },
            ["<leader>c"] = {
                name = "+Code",
                x = {
                    name = "Swap Next",
                    f = "Function",
                    p = "Parameter",
                    c = "Class"
                },
                X = {
                    name = "Swap Previous",
                    f = "Function",
                    p = "Parameter",
                    c = "Class"
                }
            },
            ["<leader>f"] = {
                name = "+Find"
            },
            ["<leader>g"] = {
                name = "+Git"
            },
            ["<leader>h"] = {
                name = "+Harpoon"
            },
            ["<leader>gh"] = {
                name = "+hunks"
            },
            ["<leader>q"] = {
                name = "+Quit/Session"
            },
            ["<leader>s"] = {
                name = "+Search/Replace"
            },
            ["<leader>n"] = {
                name = "+Notification(Noice)"
            },
            ["<leader>w"] = {
                name = "+Windows"
            },
            ["<leader>d"] = {
                name = "+Debug"
            }
        }
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end
}
