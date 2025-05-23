return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>on",
      function()
        Snacks.picker.files({
          cwd = vim.fn.expand("~/git_repos/notes")
        })
      end,
      desc = "Open Notes"
    }
  }
}
