return {
    "nvim-telescope/telescope.nvim",
    cmd = {
        "Telescope"
    },
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            lazy = true
        },
        {
            "nvim-telescope/telescope-file-browser.nvim"
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        {
            "benfowler/telescope-luasnip.nvim"
        }
    },
    keys = {
        {
            "<leader>:",
            "<cmd>Telescope command_history<cr>",
            desc = "Command History"
        },
        -- find
        {
            "<leader>ff",
            "<cmd> Telescope find_files <CR>",
            desc = "Find Files"
        },
        {
            "<leader>fo",
            "<cmd>Telescope oldfiles<cr>",
            desc = "Recent"
        },
        {
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Buffers"
        },
        {
            "<leader>fe",
            "<cmd>Telescope file_browser<cr>",
            desc = "File Explorer/browser"
        },

        -- git
        {
            "<leader>gc",
            "<cmd>Telescope git_commits<CR>",
            desc = "commits"
        },
        {
            "<leader>gs",
            "<cmd>Telescope git_status<CR>",
            desc = "status"
        },

        -- search
        {
            '<leader>s"',
            "<cmd>Telescope registers<cr>",
            desc = "Registers"
        },
        {
            "<leader>sa",
            "<cmd>Telescope autocommands<cr>",
            desc = "Auto Commands"
        },
        {
            "<leader>sw",
            "<cmd>Telescope live_grep<cr>",
            desc = "Workspace"
        },
        {
            "<leader>ss",
            "<cmd>Telescope luasnip<cr>",
            desc = "Snippets"
        },
        {
            "<leader>sr",
            "<cmd>Telescope repo list<cr>",
            desc = "Repo"
        },
        {
            "<leader>sb",
            "<cmd>Telescope current_buffer_fuzzy_find<cr>",
            desc = "Buffer Fuzzy Finder"
        },
        {
            "<leader>sc",
            "<cmd>Telescope commands<cr>",
            desc = "Commands"
        },
        {
            "<leader>sd",
            "<cmd>Telescope diagnostics bufnr=0<cr>",
            desc = "Document diagnostics"
        },
        {
            "<leader>sD",
            "<cmd>Telescope diagnostics<cr>",
            desc = "Workspace diagnostics"
        },
        {
            "<leader>sh",
            "<cmd>Telescope help_tags<cr>",
            desc = "Help Pages"
        },
        {
            "<leader>sH",
            "<cmd>Telescope highlights<cr>",
            desc = "Search Highlight Groups"
        },
        {
            "<leader>sk",
            "<cmd>Telescope keymaps<cr>",
            desc = "Key Maps"
        },
        {
            "<leader>sM",
            "<cmd>Telescope man_pages<cr>",
            desc = "Man Pages"
        },
        {
            "<leader>sm",
            "<cmd>Telescope marks<cr>",
            desc = "Jump to Mark"
        },
        {
            "<leader>so",
            "<cmd>Telescope vim_options<cr>",
            desc = "Options"
        },
        {
            "<leader>sR",
            "<cmd>Telescope resume<cr>",
            desc = "Resume"
        },
        {
            "<leader>sc",
            "<cmd> Telescope colorscheme<cr>",
            desc = "Colorschemes"
        }
    },
    opts = function()
        local actions = require("telescope.actions")
        local telescope = require("telescope")

        local open_with_trouble = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
        end
        local open_selected_with_trouble = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
        end
        return {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                -- open files in the first window that is an actual file.
                -- use the current window if no other window is available.
                get_selection_window = function()
                    local wins = vim.api.nvim_list_wins()
                    table.insert(wins, 1, vim.api.nvim_get_current_win())
                    for _, win in ipairs(wins) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.bo[buf].buftype == "" then return win end
                    end
                    return 0
                end,
                mappings = {
                    i = {
                        ["<c-t>"] = open_with_trouble,
                        ["<a-t>"] = open_selected_with_trouble,
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                        ["<C-f>"] = actions.preview_scrolling_down,
                        ["<C-b>"] = actions.preview_scrolling_up
                    },
                    n = {
                        ["q"] = actions.close
                    }
                },
                extensions = {
                    file_browser = {
                        hijack_netrw = true
                    }

                }
            }
        }
    end,
    config = function()
        pcall(require("telescope").load_extension("file_browser"))
        pcall(require("telescope").load_extension("luasnip"))
        pcall(require("telescope").load_extension("fzf"))
    end

}
