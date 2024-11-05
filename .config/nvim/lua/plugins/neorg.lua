return {
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    event = {
      "BufReadPre *.norg",
      "BufNewFile *.norg"
    },
    dependencies = {
      {
        "nvim-lua/plenary.nvim"
      },
      {
        "nvim-neorg/neorg-telescope"
      }
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        --[[         ["core.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        ["core.integrations.nvim-cmp"] = {}, ]]
        ["core.integrations.telescope"] = {}, --  Telescope Integration
        ["core.integrations.treesitter"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/git repos/notes"
            },
            default_workspace = "notes"
          }
        },
        ["core.dirman.utils"] = {}, -- A set of utilities for the core.dirman module
        ["core.summary"] = {}, -- Creates links to all files in any workspace
        -- Export norg files to other formats
        ["core.export"] = {},
        ["core.export.markdown"] = {}
      }

    },
    config = function()
      local neorg_callbacks = require("neorg.core.callbacks")

      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            {
              "<C-l>",
              "core.integrations.telescope.find_linkable"
            }
          },

          i = { -- Bind in insert mode
            {
              "<C-l>",
              "core.integrations.telescope.insert_link"
            }
          }
        }, {
          silent = true,
          noremap = true
        })
      end)
    end,
    keys = {
      {
        "<leader>nw",
        "<CMD>Telescope neorg switch_workspace<CR>",
        desc = "Set Neorg Workspace"
      },
      {
        "<leader>ni",
        "<CMD>Neorg index<CR>",
        desc = "Go to workspace index.norg"
      },
      {
        "<leader>nr",
        "<CMD>Neorg return<CR>",
        desc = "Close all norg buffers"
      },
      {
        "<leader>ntc",
        "<CMD>Neorg toggle-concealer<CR>",
        desc = "Toggle Concealer"
      },
      {
        "<leader>nef",
        ":Neorg export to-file ",
        desc = "Export File"
      },
      {
        "<leader>ned",
        ":Neorg export directory ",
        desc = "Export Directory"
      }
    }
  }
}
