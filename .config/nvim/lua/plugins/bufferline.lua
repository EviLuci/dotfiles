return {
    "akinsho/bufferline.nvim",
    keys = {
        {
            "<A-h>",
            "<cmd>BufferLineMovePrev<cr>",
            desc = "Move buffer Prev"
        },
        {
            "<A-l>",
            "<cmd>BufferLineMoveNext<cr>",
            desc = "Move buffer Next"
        },
        {
            "<A-p>",
            "<cmd>BufferLineCyclePrev<cr>",
            desc = "Prev buffer"
        },
        {
            "<A-n>",
            "<cmd>BufferLineCycleNext<cr>",
            desc = "Next buffer"
        },
        {
            "<leader>bc",
            "<Cmd>BufferLineGroupClose ungrouped<CR>",
            desc = "Delete non-pinned buffers"
        }
    }
}
