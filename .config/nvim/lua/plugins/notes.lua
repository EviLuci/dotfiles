return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = true,
        width = "block",
        right_pad = 1
      },
      heading = {
        sign = true
      }
    }
  },
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
  },
  {
    'ChuufMaster/markdown-toc',
    opts = {
      -- The heading level to match (i.e the number of "#"s to match to)
      heading_level_to_match = -1,

      -- Set to display a dropdown to allow you to select the heading level
      ask_for_heading_level = true,

      -- TOC default string
      -- The first %s is for indenting/tabs
      -- The sencond %s is for the original headings text
      -- The third %s is for the markdown files path that the TOC is being generated
      -- from
      -- The forth %s is for the target heading using the markdown rules
      toc_format = '%s- [%s](<%s#%s>)'
    }
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md"
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
        ["<leader>ntt"] = {
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
        name = "telescope.nvim",
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
      sort_by = "modified",
      sort_reversed = true,
      search_max_lines = 1000,
      open_notes_in = "current" -- vsplit|hsplit
    }
  }
}
