return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "petertriho/cmp-git",
        "saadparwaiz1/cmp_luasnip",
        'onsails/lspkind.nvim'
    },
    opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", {
            link = "Comment",
            default = true
        })
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
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            },
            formatting = {
                format = function(entry, vim_item)
                    local lspkind_ok, lspkind = pcall(require, "lspkind")
                    if not lspkind_ok then
                        -- From kind_icons array
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        -- Source
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[LaTeX]"
                        })[entry.source.name]
                        return vim_item
                    else
                        -- From lspkind
                        return lspkind.cmp_format()(entry, vim_item)
                    end
                end
            },
            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText"
                }
            },
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
            snippet = {
                expand = function(args) require('luasnip').lsp_expand(args.body) end
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
            }),
            completion = {
                completeopt = "menu,menuone,noinsert"
            }
        }

    end,
    config = function(_, opts)
        local cmp = require "cmp"
        cmp.setup(opts)

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({
            "/",
            "?"
        }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {
                    name = "buffer"
                }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {
                    name = "path"
                }
            }, {
                {
                    name = "cmdline"
                }
            })
        })

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
