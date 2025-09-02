return {
  {
    'altermo/ultimate-autopair.nvim',
    event = "VeryLazy",
    opts = {
      -- Config goes here
    }
  },
  {
    'windwp/nvim-autopairs',
    enabled = true,
    event = "VeryLazy",
    opts = function()
      local npairs = require('nvim-autopairs')
      npairs.setup()

      for _, i in ipairs(npairs.config.rules) do i.key_map = nil end
    end
  }
}
