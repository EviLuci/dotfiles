return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = {
          "--config",
          "/home/sujan/dotfiles/.config/nvim/lua/utils/.markdownlint-cli2.yaml",
          "--"
        }
      }
    }
  }
}
