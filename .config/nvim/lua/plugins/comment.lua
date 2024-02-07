return {
    "numToStr/Comment.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true
    },
    opts = {
        ignore = "^$"
    }
}
