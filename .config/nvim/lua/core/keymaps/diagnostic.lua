-- Diagnostic and quickfix navigation.
local map = require("core.utils").map

-- =============================================================================
-- Diagnostic Navigation
-- =============================================================================
-- Open floating diagnostic popup
map("n", "<leader>cd", vim.diagnostic.open_float, {
  desc = "Show line diagnostics"
})

-- Jump to next/previous diagnostic (any severity)
map("n", "]d", function() vim.diagnostic.goto_next() end, {
  desc = "Next diagnostic"
})
map("n", "[d", function() vim.diagnostic.goto_prev() end, {
  desc = "Previous diagnostic"
})

-- Jump to next/previous error
map("n", "]e", function()
  vim.diagnostic.goto_next({
    severity = vim.diagnostic.severity.ERROR
  })
end, {
  desc = "Next error"
})
map("n", "[e", function()
  vim.diagnostic.goto_prev({
    severity = vim.diagnostic.severity.ERROR
  })
end, {
  desc = "Previous error"
})

-- Jump to next/previous warning
map("n", "]w", function()
  vim.diagnostic.goto_next({
    severity = vim.diagnostic.severity.WARN
  })
end, {
  desc = "Next warning"
})
map("n", "[w", function()
  vim.diagnostic.goto_prev({
    severity = vim.diagnostic.severity.WARN
  })
end, {
  desc = "Previous warning"
})

-- =============================================================================
-- Quickfix List (Global Diagnostics)
-- =============================================================================

-- Open diagnostic quickfix list
map("n", "<leader>q", function() vim.diagnostic.setqflist() end, {
  desc = "Open diagnostic [Q]uickfix list"
})

-- Navigate quickfix items
map("n", "[q", function() vim.cmd.cprev() end, {
  desc = "Previous quickfix"
})
map("n", "]q", function() vim.cmd.cnext() end, {
  desc = "Next quickfix"
})
map("n", "[Q", "<cmd>cfirst<cr>zvzz", {
  desc = "First quickfix"
})
map("n", "]Q", "<cmd>clast<cr>zvzz", {
  desc = "Last quickfix"
})

-- =============================================================================
-- Location List (Buffer-Local Diagnostics)
-- =============================================================================

-- Navigate location list
map("n", "[l", function() vim.cmd.lprev() end, {
  desc = "Previous location"
})
map("n", "]l", function() vim.cmd.lnext() end, {
  desc = "Next location"
})
map("n", "[L", "<cmd>lfirst<cr>zvzz", {
  desc = "First location"
})
map("n", "]L", "<cmd>llast<cr>zvzz", {
  desc = "Last location"
})

-- =============================================================================
-- List Management
-- =============================================================================

-- Clear quickfix and location lists
map("n", "<leader>qx", function()
  vim.cmd.cexpr({})
  vim.cmd.lexpr({})
end, {
  desc = "Clear diagnostic lists"
})

-- Close both quickfix and location lists
map("n", "<leader>qc", function()
  vim.cmd.cclose()
  vim.cmd.lclose()
end, {
  desc = "Close diagnostic lists"
})

-- =============================================================================
-- Optional: Auto-show diagnostics on cursor hold
-- =============================================================================

-- Show floating diagnostics when idle (like hover, but for errors)
vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("DiagnosticHover", {
    clear = true
  }),
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = {
        "BufLeave",
        "CursorMoved",
        "InsertEnter"
      },
      source = "if_many",
      prefix = "  "
    })
  end,
  desc = "Show diagnostics on hover"
})
