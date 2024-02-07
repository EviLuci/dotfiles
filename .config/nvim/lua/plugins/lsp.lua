return {
    'ray-x/navigator.lua',
    dependencies = {
        {
            'ray-x/guihua.lua',
            run = 'cd lua/fzy && make'
        },
        {
            'neovim/nvim-lspconfig'
        },
        {
            'akinsho/flutter-tools.nvim',
            event = "VeryLazy",
            dependencVies = {
                'nvim-lua/plenary.nvim',
                'stevearc/dressing.nvim' -- optional for vim.ui.select
            },
            config = true
        },
        {
            "ray-x/lsp_signature.nvim",
            event = "VeryLazy",
            opts = {},
            config = function(_, opts) require'lsp_signature'.setup(opts) end
        }
    },
    opts = {
        ts_fold = true,
        lsp = {
            servers = {
                "ruff_lsp"
            },
            ruff_lsp = {
                filetypes = {
                    "python"
                }
            }
        }
    },
    config = function() require("navigator").setup({}) end
}
