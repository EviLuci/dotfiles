local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    spec = {
        {
            import = "plugins"
        }
    },
    defaults = {
        lazy = false
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
                "tohtml",
                "tutor",
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "matchparen",
                "tar",
                "tarPlugin",
                "shada_plugin",
                "tutor_mode_plugin",
                "remote_plugins",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin"
            }
        }
    }
    -- debug = true,
}
