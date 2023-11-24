return {
    "akinsho/toggleterm.nvim",
    keys = {
        {
            "<leader>ot",
            "<Cmd>ToggleTerm<Cr>",
            desc = "Terminal"
        },
        {
            "<leader>oT",
            "<Cmd>2ToggleTerm<Cr>",
            desc = "Terminal #2"
        }
    },
    cmd = {
        "ToggleTerm",
        "TermExec"
    },
    opts = {
        size = 20,
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 0.3,
        start_in_insert = true,
        persist_size = true,
        direction = "float",
        winbar = {
            enabled = false,
            name_formatter = function(term) return term.name end
        }
    }
}

