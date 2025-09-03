if vim.env.VSCODE then vim.g.vscode = true end

require("core.autocmds")
require("core.keymaps")
require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy.nvim
require("lazy").setup({
  spec = {
    {
      import = "plugins"
    },
    {
      import = "plugins.UI"
    }
  },
  defaults = {
    lazy = false,
    version = false
  },
  change_detection = {
    notify = false
  },
  install = {
    missing = true,
    colorscheme = {
      "tokyonight"
    }
  },
  checker = {
    enabled = true
  },
  performance = {
    cache = {
      enabled = true
    },
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        -- "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
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
        "bugreport",
        "ftplugin"
      }
    }
  }
  -- debug = true,
})

vim.cmd.colorscheme("tokyonight-night")
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
