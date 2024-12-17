return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    ft = "markdown",
    opts = {
      render_modes = true,
      code = {
        width = "block",
        right_pad = 1,
        disable_background = {
          'css'
        }
      },
      heading = {
        width = "block",
        position = "inline",
        icons = {
          '󰲡 ',
          '󰲣 ',
          '󰲥 ',
          '󰲧 ',
          '󰲩 ',
          '󰲫 '
        }
      },
      indent = {
        enabled = true

      }
    }
  },
  -- {
  --   "nvim-neorg/neorg",
  --   cmd = "Neorg",
  --   lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  --   version = "*", -- Pin Neorg to the latest stable release
  --   event = {
  --     "BufReadPre *.norg",
  --     "BufNewFile *.norg"
  --   },
  --   dependencies = {
  --     {
  --       "nvim-lua/plenary.nvim"
  --     },
  --     {
  --       "nvim-neorg/neorg-telescope"
  --     }
  --   },
  --   opts = {
  --     load = {
  --       ["core.defaults"] = {}, -- Loads default behaviour
  --       ["core.concealer"] = {
  --         config = {
  --           icon_preset = "basic" -- basic | diamond | varied
  --         }
  --       }, -- Adds pretty icons to your documents
  --       ["core.completion"] = {
  --         config = {
  --           engine = "nvim-cmp"
  --         }
  --       },
  --       ["core.integrations.nvim-cmp"] = {},
  --       ["core.integrations.telescope"] = {}, --  Telescope Integration
  --       ["core.integrations.treesitter"] = {},
  --       ["core.dirman"] = { -- Manages Neorg workspaces
  --         config = {
  --           workspaces = {
  --             notes = "~/git repos/notes"
  --           },
  --           default_workspace = "notes"
  --         }
  --       },
  --       ["core.dirman.utils"] = {}, -- A set of utilities for the core.dirman module
  --       ["core.summary"] = {}, -- Creates links to all files in any workspace
  --       -- Export norg files to other formats
  --       ["core.export"] = {},
  --       ["core.export.markdown"] = {}
  --     }

  --   },
  --   keys = {
  --     {
  --       "<leader>nw",
  --       "<CMD>Telescope neorg switch_workspace<CR>",
  --       desc = "Set Neorg Workspace"
  --     },
  --     {
  --       "<leader>ni",
  --       "<CMD>Neorg index<CR>",
  --       desc = "Go to workspace index.norg"
  --     },
  --     {
  --       "<leader>nr",
  --       "<CMD>Neorg return<CR>",
  --       desc = "Close all norg buffers"
  --     },
  --     {
  --       "<leader>ntc",
  --       "<CMD>Neorg toggle-concealer<CR>",
  --       desc = "Toggle Concealer"
  --     },
  --     {
  --       "<leader>nef",
  --       ":Neorg export to-file ",
  --       desc = "Export File"
  --     },
  --     {
  --       "<leader>ned",
  --       ":Neorg export directory ",
  --       desc = "Export Directory"
  --     }
  --   }
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    -- ft = "markdown",
    -- event = {
    --   "BufReadPre *.md",
    --   "BufNewFile *.md"
    -- },
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      -- refer to `:h file-pattern` for more examples
      "BufReadPre " .. vim.fn.expand "~" .. "/git repos/notes/*.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/git repos/notes/*.md"
    },
    keys = {
      {
        "<leader>oss",
        "<cmd>ObsidianQuickSwitch<cr>",
        desc = "Search Notes"
      },
      {
        "<leader>oi",
        "<cmd>ObsidianPasteImg<cr>",
        desc = "Paste Image"
      },
      {
        "<leader>ot",
        "<cmd>ObsidianToggleCheckbox<cr>",
        desc = "Toggle Checkbox"
      },
      {
        "<C-t>",
        "<esc><cmd>ObsidianToggleCheckbox<cr>i",
        desc = "Toggle Checkbox",
        mode = "i"
      },
      {
        "<leader>osc",
        "<cmd>ObsidianTOC<cr>",
        desc = "Search TOC"
      },
      {
        "<leader>ost",
        "<cmd>ObsidianTags<cr>",
        desc = "Search Tags"
      }
    },

    init = function() vim.opt.conceallevel = 1 end,
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/git repos/notes"
        }
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2
      },
      mappings = {
        -- overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function() return require("obsidian").util.gf_passthrough() end,
          opts = {
            noremap = false,
            expr = true,
            buffer = true
          }
        },
        -- toggle check-boxes.
        ["<leader>ch"] = {
          action = function() return require("obsidian").util.toggle_checkbox() end,
          opts = {
            buffer = true
          }
        },
        -- smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function() return require("obsidian").util.smart_action() end,
          opts = {
            buffer = true,
            expr = true
          }
        }
      },
      -- Optional, alternatively you can customize the frontmatter data.
      ---@return table
      note_frontmatter_func = function(note)
        if note.title then note:add_alias(note.title) end
        local out = {
          id = note.id,
          aliases = note.aliases,
          tags = note.tags
        }
        -- ensure fields are kept in the frontmatter
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do out[k] = v end
        end
        return out
      end,
      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        vim.fn.jobstart({
          "yank",
          url
        })
      end,
      follow_img_func = function(img)
        vim.fn.jobstart({
          "yank",
          img
        })
      end,
      picker = {
        name = "fzf-lua",
        note_mappings = {
          -- create a new note from your query.
          new = "<C-n>",
          -- insert a link to the selected note.
          insert_link = "<C-l>"
        },
        tag_mappings = {
          tag_note = "<C-x>",
          insert_tag = "<C-l>"
        }
      },
      ui = {
        enable = false
      }
    }
  }
}
