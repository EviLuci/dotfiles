return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
        {
            "<leader>e",
            "<cmd>:Neotree toggle<cr>",
            desc = "NeoTree"
        },
        {
            "<leader>ge",
            function()
                require("neo-tree.command").execute({
                    source = "git_status",
                    toggle = true
                })
            end,
            desc = "Git explorer"
        },
        {
            "<leader>be",
            function()
                require("neo-tree.command").execute({
                    source = "buffers",
                    toggle = true
                })
            end,
            desc = "Buffer explorer"
        }
    },
    opts = {
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "document_symbols"
        },
        open_files_do_not_replace_types = {
            "terminal",
            "Trouble",
            "trouble",
            "qf",
            "Outline"
        },
        filesystem = {
            follow_current_file = {
                enabled = true
            },
            use_libuv_file_watcher = true
        },
        window = {
            mappings = {
                ["<space>"] = "none"
            }
        },
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander"
            }
        }
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
        vim.api.nvim_create_autocmd("TermClose", {
            pattern = "*lazygit",
            callback = function()
                if package.loaded["neo-tree.sources.git_status"] then
                    require("neo-tree.sources.git_status").refresh()
                end
            end
        })
    end
}
