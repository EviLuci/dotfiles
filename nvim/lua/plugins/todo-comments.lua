return {
    "folke/todo-comments.nvim",
    cmd = {
        "TodoTrouble",
        "TodoTelescope"
    },
    event = {
        "BufReadPost",
        "BufNewFile",
        "BufWritePost"
    },
    config = true,
    -- stylua: ignore
    keys = {
        {
            "]t",
            function() require("todo-comments").jump_next() end,
            desc = "Next todo comment"
        },
        {
            "[t",
            function() require("todo-comments").jump_prev() end,
            desc = "Previous todo comment"
        },
        {
            "<leader>tc",
            "<cmd>TodoTrouble<cr>",
            desc = "Todo Comments (Trouble)"
        },
        {
            "<leader>tk",
            "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
            desc = "Todo/Fix/Fixme (Trouble)"
        },
        {
            "<leader>st",
            "<cmd>TodoTelescope<cr>",
            desc = "Todo"
        },
        {
            "<leader>sT",
            "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
            desc = "Todo/Fix/Fixme"
        }
    }
}
