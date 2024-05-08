return {
    "L3MON4D3/LuaSnip",
    opts = function()
        local types = require "luasnip.util.types"
        return {
            -- Display a cursor-like placeholder in unvisited nodes of the snippet.
            ext_opts = {
                [types.insertNode] = {
                    unvisited = {
                        virt_text = {
                            {
                                "|",
                                "Conceal"
                            }
                        }
                        -- virt_text_pos = "inline",
                    }
                },
                [types.exitNode] = {
                    unvisited = {
                        virt_text = {
                            {
                                "|",
                                "Conceal"
                            }
                        }
                        -- virt_text_pos = "inline",
                    }
                }
            }
        }
    end
}
