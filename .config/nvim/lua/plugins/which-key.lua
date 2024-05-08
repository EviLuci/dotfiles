return {
    "folke/which-key.nvim",
    opts = {
        defaults = {
            mode = {
                "n",
                "v"
            },
            ["<leader>o"] = {
                name = "+open/toggle"
            },
            ["<leader>c"] = {
                name = "+code",
                x = {
                    name = "swap sext",
                    f = "Function",
                    p = "Parameter",
                    c = "Class"
                },
                X = {
                    name = "swap previous",
                    f = "Function",
                    p = "Parameter",
                    c = "Class"
                }
            },
            ["<leader>h"] = {
                name = "+Harpoon"
            },
            ["<leader>r"] = {
                name = "+Restore/Session"
            },
            ["<leader>q"] = {
                name = "+Quickfix"
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
