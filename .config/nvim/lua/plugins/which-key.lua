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
          "o",
          group = "Obsidian"
        },
        {
          "a",
          group = "AI"
        }
      }
    }
  }
}
