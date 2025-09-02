return {
  "adalessa/laravel.nvim",
  dependencies = {
    "kevinhwang91/promise-async"
  },
  cmd = {
    "Laravel"
  },
  keys = {
    {
      "<leader>la",
      ":Laravel artisan<cr>"
    },
    {
      "<leader>lr",
      ":Laravel routes<cr>"
    },
    {
      "<leader>lm",
      ":Laravel related<cr>"
    }
  },
  event = {
    "VeryLazy"
  },
  opts = {
    pickers = {
      enable = true,
      provider = 'snacks.pick'
    }
  },
  config = true
}
