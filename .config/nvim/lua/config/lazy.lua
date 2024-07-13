local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins"
        },
        {
            import = "plugins"
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
})
