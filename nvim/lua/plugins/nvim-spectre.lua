return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {
        open_cmd = "noswapfile vnew"
    },
    -- stylua: ignore
    keys = {
        {
            "<leader>st",
            function() require("spectre").toggle() end,
            desc = "Spectre Toggle"
        }
    }
}
