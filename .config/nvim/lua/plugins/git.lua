return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "sindrets/diffview.nvim" -- optional - Diff integration         -- optional
    },
    opts = {
      integrations = {
        diffview = true
      },
      disable_commit_confirmation = true
    },
    keys = {
      {
        "<leader>gn",
        "<cmd>Neogit kind=tab<cr>",
        desc = "Status"
      }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = {
          text = "+"
        },
        change = {
          text = "▎"
        },
        delete = {
          text = ""
        },
        topdelete = {
          text = "▾"
        },
        changedelete = {
          text = "~"
        },
        untracked = {
          text = "┆"
        }
      },
      signs_staged = {
        add = {
          text = "+"
        },
        change = {
          text = "▎"
        },
        delete = {
          text = ""
        },
        topdelete = {
          text = "▾"
        },
        changedelete = {
          text = "~"
        }
      }
    }
  }

}
