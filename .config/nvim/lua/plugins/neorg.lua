return {
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
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
        ["core.concealer"] = {
          config = {
            icon_preset = "basic" -- basic | diamond | varied
          }
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        ["core.integrations.nvim-cmp"] = {},
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
