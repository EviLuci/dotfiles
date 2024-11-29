return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
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
            cmd = "fortune",
            padding = 1,
            height = 10
          },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files (CWD)",
            section = "recent_files",
            cwd = true,
            indent = 2,
            padding = 1
          },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
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
          },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function() return Snacks.git.get_root() ~= nil end,
            cmd = "hub status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3
          }
        }
      }
    }
  }
}
