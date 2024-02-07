return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opt = {
        check_ts = true,
        disable_filetype = {
            "TelescopePrompt",
            "guihua",
            "guihua_rust",
            "clap_input"
        },
        fast_wrap = {}
    }
}
