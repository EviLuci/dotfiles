-- lua/core/utils.lua
local M = {}

-- Smart keymap helper
function M.map(mode, lhs, rhs, opts)
  local defaults = {
    noremap = true,
    silent = true
  }
  local options = opts and vim.tbl_extend("force", defaults, opts) or defaults
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
