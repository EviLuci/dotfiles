return {
    {
        "telescope.nvim",
        keys = {
            {
                "<leader>fp",
                function()
                    require("telescope.builtin").find_files({
                        cwd = require("lazy.core.config").options.root
                    })
                end,
                desc = "Find Plugin File"
            }
        }
    }
}
