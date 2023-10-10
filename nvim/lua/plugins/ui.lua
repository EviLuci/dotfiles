return {
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent"
            }
        },
        config = function(_, opts)
            local tokyonight = require "tokyonight"
            tokyonight.setup(opts)
            tokyonight.load()
        end
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({
                    plugins = {
                        "dressing.nvim"
                    }
                })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({
                    plugins = {
                        "dressing.nvim"
                    }
                })
                return vim.ui.input(...)
            end
        end
    },
    {
        "NvChad/nvim-colorizer.lua"
    }
}
