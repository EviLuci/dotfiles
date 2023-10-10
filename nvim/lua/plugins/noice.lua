return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        lazy = true
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true
            }
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        {
                            find = "%d+L, %d+B"
                        },
                        {
                            find = "; after #%d+"
                        },
                        {
                            find = "; before #%d+"
                        }
                    }
                },
                view = "mini"
            }
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false -- add a border to hover docs and signature help
        }
    },
    -- stylua: ignore
    keys = {
        {
            "<leader>nl",
            function() require("noice").cmd("last") end,
            desc = "Noice Last Message"
        },
        {
            "<leader>nh",
            function() require("noice").cmd("history") end,
            desc = "Noice History"
        },
        {
            "<leader>na",
            function() require("noice").cmd("all") end,
            desc = "Noice All"
        },
        {
            "<leader>nd",
            function() require("noice").cmd("dismiss") end,
            desc = "Dismiss All"
        },
        {
            "<c-f>",
            function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
            silent = true,
            expr = true,
            desc = "Scroll forward",
            mode = {
                "i",
                "n",
                "s"
            }
        },
        {
            "<c-b>",
            function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
            silent = true,
            expr = true,
            desc = "Scroll backward",
            mode = {
                "i",
                "n",
                "s"
            }
        }
    }
}
