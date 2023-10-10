return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
        {
            "<leader>e",
            "<cmd>:Neotree toggle<cr>",
            desc = "NeoTree"
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
