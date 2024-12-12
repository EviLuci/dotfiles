return {
  "supermaven-inc/supermaven-nvim",
  keys = {
    "<leader>at",
    "<Cmd>SupermavenToggle<CR>",
    desc = "Toggle Supermaven"
  },
  config = function()
    require("supermaven-nvim").setup({
      ignore_file_types = {
        markdown = true
      }
    })
  end
}
