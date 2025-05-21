return {
  "folke/which-key.nvim",
  opts_extend = {
    "spec",
  },
  opts = {
    defaults = {},
    spec = {
      {
        mode = {
          "n",
          "v",
        },
        {
          "<leader>o",
          group = "Obsidian",
        },
        {
          "<leader>a",
          group = "AI",
        },
        {
          "<leader>t",
          group = "Time Machine",
        },
      },
    },
  },
}
