if vim.g.vscode then
    -- VSCode Settings
    require("config.vscode")
else
    -- ordinary Neovim
    require("config.options")
    require("config.lazy")
    require("config.keymaps")
    require("config.autocmds")
end

