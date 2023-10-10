return {
    "numToStr/Comment.nvim",
    event = "BufRead",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true
    },
    opts = {
        ignore = "^$"
    }
}
