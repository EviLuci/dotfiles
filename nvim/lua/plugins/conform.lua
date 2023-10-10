return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = {
                "stylua"
            },
            -- Conform will run multiple formatters sequentially
            python = {
                "isort",
                "black",
                "ruff_fix",
                "ruff_format"
            },
            -- Use a sub-list to run only the first available formatter
            javascript = {
                {
                    "prettierd",
                    "prettier"
                }
            },
            markdown = {
                {
                    "prettierd",
                    "prettier"
                }
            }
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true
        }
    }
}
