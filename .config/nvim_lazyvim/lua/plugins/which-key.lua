return {
  "folke/which-key.nvim",
  opts_extend = {
    "spec"
  },
  opts = {
    defaults = {},
    spec = {
      {
        mode = {
          "n",
          "v"
        },
        {
          "<leader>y",
          group = "Yank"
        },
        {
          "<leader>o",
          group = "Open"
        },
        {
          "<leader>a",
          group = "AI"
        },
        {
          "<leader>t",
          group = "Time Machine"
        }
      }
    }
  }
}
