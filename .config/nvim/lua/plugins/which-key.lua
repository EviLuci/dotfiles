return {
    "folke/which-key.nvim",
    opts_extend = {
        "spec"
    },
    opts = {
        defaults = {},
        spec = {
            {
                mode = {
                    "n",
                    "v"
                },
                {
                    "z",
                    group = "fold"
                },
                {
                    "n",
                    group = "neorg"
                }
            }
        }
    }
}
