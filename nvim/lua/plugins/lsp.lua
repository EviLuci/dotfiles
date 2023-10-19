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
            'simrat39/rust-tools.nvim',
            config = function()
                require('rust-tools').setup({
                    server = {
                        on_attach = function(client, bufnr)
                            require('navigator.lspclient.mapping').setup({
                                client = client,
                                bufnr = bufnr
                            }) -- setup navigator keymaps here,
                            require("navigator.dochighlight").documentHighlight(bufnr)
                            require('navigator.codeAction').code_action_prompt(bufnr)
                            -- otherwise, you can define your own commands to call navigator functions
                        end
                    }
                })
            end
        },
        {
            'akinsho/flutter-tools.nvim',
            lazy = false,
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
    }
}
