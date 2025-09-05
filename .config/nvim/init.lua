-- Entry point for Neovim configuration.
-- Designed for minimalism, functionality, and VSCode compatibility.
-- Detect if running inside VSCode
if vim.env.VSCODE then vim.g.vscode = true end

-- Bootstrap: Load core settings before plugins
require("core.options")
require("core.autocmds")
require("core.keymaps")
require("core.netrw")

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local has_lazy, _ = pcall(vim.uv or vim.loop.fs_stat, lazypath)

if not has_lazy then
  local repo = "https://github.com/folke/lazy.nvim.git"
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    repo,
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  spec = {
    {
      import = "plugins"
    },
    {
      import = "plugins.ui"
    }
  },
  defaults = {
    lazy = false,
    version = nil -- Always use latest stable unless pinned
  },
  install = {
    missing = true,
    colorscheme = {
      "tokyonight"
    }
  },
  change_detection = {
    notify = false
  },
  checker = {
    enabled = true,
    frequency = 3600 * 24 -- Once a day
  },
  performance = {
    cache = {
      enabled = true
    },
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "matchparen",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport"
      }
    }
  }
})

-- Only set colorscheme in real Neovim (not VSCode)
if not vim.g.vscode then
  vim.cmd.colorscheme("tokyonight-night")
  vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", {
    desc = "Open Lazy"
  })
end
