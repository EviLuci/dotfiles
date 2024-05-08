return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "petertriho/cmp-git",
        "saadparwaiz1/cmp_luasnip",
        'onsails/lspkind.nvim'
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        local cmp = require("cmp")
        local lspkind = require('lspkind')
        local luasnip = require("luasnip")

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        -- kind_icons array
        local kind_icons = {
            Codeium = ""
            -- ... (remaining)
        }

        return {
            mapping = cmp.mapping.preset.insert {
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                    "c"
                }),
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                    "c"
                }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item {
                    behavior = cmp.SelectBehavior.Select
                }, {
                    "i"
                }),
                ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item {
                    behavior = cmp.SelectBehavior.Select
                }, {
                    "i"
                }),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false
                            })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({
                        select = true
                    }),
                    c = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    })
                }),
                ["<C-Space>"] = cmp.mapping.complete()
            },
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    group_index = 1
                },
                {
                    name = "luasnip",
                    group_index = 1
                },
                {
                    name = "codeium",
                    group_index = 1
                },
                {
                    name = "buffer",
                    group_index = 2
                },
                {
                    name = "path",
                    group_index = 2
                },
                {
                    name = "git",
                    group_index = 2
                }
            })
        }

    end,
    config = function(_, opts)
        local cmp = require "cmp"
        cmp.setup(opts)

        -- Auto pairs
        local has_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if has_autopairs then
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {
                map_char = {
                    tex = ""
                }
            })
        end

        -- Cmp
        if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
            cmp.setup.buffer {
                completion = {
                    enable = false
                }
            }
        end

        -- Git
        require("cmp_git").setup {
            filetypes = {
                "NeogitCommitMessage"
            }
        }
    end
}
