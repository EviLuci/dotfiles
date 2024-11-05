return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "Neorg"
      })
      table.insert(opts.sources, {
        name = "supermaven",
        group_index = 1,
        priority = 100
      })
    end
  }
}
