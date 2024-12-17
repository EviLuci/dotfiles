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
            icon = "󱀢 ",
            title = "Today's Quote",
            cmd = "fortune",
            padding = 1,
            height = 10
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
