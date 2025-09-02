return {
  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lualine = require("lualine")

      local colors = {
        bg = '#24283b',
        fg = '#c0caf5',
        red = '#f7768e',
        green = '#9ece6a',
        blue = '#2ac3de',
        purple = '#bb9af7',
        orange = '#ff9e64'
      }

      local conditions = {
        buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
        hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
        check_git_workspace = function()
          local filepath = vim.fn.expand('%:p:h')
          local gitdir = vim.fn.finddir('.git', filepath .. ';')
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end
      }

      opts.options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = ""
      }
      table.insert(opts.sections.lualine_y, {
        "filesize",
        cond = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end
      })
      table.insert(opts.sections.lualine_c, {
        function() return "%=" end
      })
      table.insert(opts.sections.lualine_c, {
        function()
          local buf_clients = vim.lsp.get_clients({
            bufnr = 0
          })

          local formatters = require("conform").list_formatters(0)

          local buf_client_names = {}
          local buf_formatters = {}

          for _, client in pairs(buf_clients) do
            if client.name ~= "copilot" then table.insert(buf_client_names, client.name) end
          end

          for _, client in pairs(formatters) do table.insert(buf_formatters, client.name) end

          vim.list_extend(buf_client_names, buf_formatters)

          if #buf_client_names == 0 then return "No Active LSP" end

          local unique_client_names = table.concat(buf_client_names, ", ")
          local language_servers = string.format("[%s]", unique_client_names)

          return language_servers
        end,
        icon = " LSP:",
        color = {
          fg = colors.blue,
          gui = "bold"
        }
      })
    end
  }
}
