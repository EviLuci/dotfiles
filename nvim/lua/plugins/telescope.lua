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
            "<leader>,",
            "<cmd>Telescope buffers show_all_buffers=true<cr>",
            desc = "Switch Buffer"
        },
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
            "<cmd>Telescope buffers<cr>",
            desc = "Buffers"
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
            "<cmd>Telescope command_history<cr>",
            desc = "Command History"
        },
        {
            "<leader>sC",
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
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<c-t>"] = function(...)
                        return require("trouble.providers.telescope").open_with_trouble(...)
                    end,
                    ["<a-t>"] = function(...)
                        return require("trouble.providers.telescope").open_selected_with_trouble(...)
                    end,
                    ["<C-Down>"] = function(...)
                        return require("telescope.actions").cycle_history_next(...)
                    end,
                    ["<C-Up>"] = function(...)
                        return require("telescope.actions").cycle_history_prev(...)
                    end,
                    ["<C-f>"] = function(...)
                        return require("telescope.actions").preview_scrolling_down(...)
                    end,
                    ["<C-b>"] = function(...)
                        return require("telescope.actions").preview_scrolling_up(...)
                    end
                },
                n = {
                    ["q"] = function(...) return require("telescope.actions").close(...) end
                },
                color_devicons = true
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true
                }

            }
        }
    },
    config = function()
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("luasnip")
        require("telescope").load_extension("fzf")
    end

}
