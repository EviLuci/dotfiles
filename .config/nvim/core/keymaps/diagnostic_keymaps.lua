local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true
  }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list'
})

-- Quickfix and Location list mappings
map("n", "[q", vim.cmd.cprev, {
  desc = "Previous Quickfix"
})
map("n", "]q", vim.cmd.cnext, {
  desc = "Next Quickfix"
})
map("n", "[Q", "<cmd>cfirst<CR>zvzz", {
  desc = "First quickfix"
})
map("n", "]Q", "<cmd>clast<CR>zvzz", {
  desc = "Last quickfix"
})
map("n", "[l", "<cmd>lprevious<CR>zvzz", {
  desc = "Previous location"
})
map("n", "]l", "<cmd>lnext<CR>zvzz", {
  desc = "Next location"
})
map("n", "[L", "<cmd>lfirst<CR>zvzz", {
  desc = "First location"
})
map("n", "]L", "<cmd>llast<CR>zvzz", {
  desc = "Last location"
})
map("n", "<leader>xk", "<cmd>cexpr []<cr>", {
  desc = "Clear list"
})
map("n", "<leader>xc", "<cmd>windo lclose <bar> cclose <cr>", {
  desc = "Close list"
})

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({
      severity = severity
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, {
  desc = "Line Diagnostics"
})
map("n", "]d", diagnostic_goto(true), {
  desc = "Next Diagnostic"
})
map("n", "[d", diagnostic_goto(false), {
  desc = "Prev Diagnostic"
})
map("n", "]e", diagnostic_goto(true, "ERROR"), {
  desc = "Next Error"
})
map("n", "[e", diagnostic_goto(false, "ERROR"), {
  desc = "Prev Error"
})
map("n", "]w", diagnostic_goto(true, "WARN"), {
  desc = "Next Warning"
})
map("n", "[w", diagnostic_goto(false, "WARN"), {
  desc = "Prev Warning"
})
