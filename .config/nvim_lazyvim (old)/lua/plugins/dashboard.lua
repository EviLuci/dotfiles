return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        ---@class snacks.dashboard.Config
        ---@field enabled? boolean
        ---@field sections snacks.dashboard.Section
        ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>

        preset = {
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":lua Snacks.dashboard.pick('files')"
            },
            {
              icon = " ",
              key = "n",
              desc = "New File",
              action = ":ene | startinsert"
            },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')"
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')"
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
            },
            {
              icon = " ",
              key = "s",
              desc = "Restore Session",
              section = "session"
            },
            {
              icon = " ",
              key = "q",
              desc = "Quit",
              action = ":qa"
            }
          },
          -- Used by the `header` section
          header = [[

███████╗██╗   ██╗██╗██╗     ██╗   ██╗ ██████╗██╗
██╔════╝██║   ██║██║██║     ██║   ██║██╔════╝██║
█████╗  ██║   ██║██║██║     ██║   ██║██║     ██║
██╔══╝  ╚██╗ ██╔╝██║██║     ██║   ██║██║     ██║
███████╗ ╚████╔╝ ██║███████╗╚██████╔╝╚██████╗██║
╚══════╝  ╚═══╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝╚═╝

   ]]
        },
        sections = {
          {
            section = "header"
          },
          {
            section = "keys",
            gap = 1,
            padding = 1
          },
          {
            section = "startup",
            padding = 1
          },
          {
            pane = 2,
            section = "terminal",
            icon = "󱀢 ",
            title = "Today's Quote",
            cmd = "fortune",
            padding = 1,
            height = 9
          },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files (CWD)",
            file = vim.fn.fnamemodify(".", ":~"),
            section = "recent_files",
            cwd = true,
            indent = 2,
            padding = 1
          },
          {
            pane = 2,
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1
          }
        }
      }
    }
  }
}
