return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "RRethy/nvim-treesitter-textsubjects"
    }
  },
  opts = {
    ensure_installed = {
      "fish",
      "rust",
      "sql"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = {
        "norg",
        "markdown"
      }
    },
    textobjects = {
      lsp_interop = {
        enable = true,
        border = 'none',
        floating_preview_opts = {},
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer"
        }
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>ca"] = "@parameter.inner"
        },
        swap_previous = {
          ["<leader>cA"] = "@parameter.inner"
        }
      }
    },
    textsubjects = {
      enable = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = {
          'textsubjects-container-inner',
          desc = "Select inside containers (classes, functions, etc.)"
        }
      }
    }
  }
}

