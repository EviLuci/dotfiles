-- Window, buffer, and tab management shortcuts.
local map = require("core.utils").map

-- Focus windows
map("n", "<C-h>", "<C-w>h", {
  desc = "Focus left window",
  remap = true
})
map("n", "<C-j>", "<C-w>j", {
  desc = "Focus below window",
  remap = true
})
map("n", "<C-k>", "<C-w>k", {
  desc = "Focus above window",
  remap = true
})
map("n", "<C-l>", "<C-w>l", {
  desc = "Focus right window",
  remap = true
})

-- Move windows to new positions
map("n", "<S-Left>", "<C-w>H", {
  desc = "Move window to left"
})
map("n", "<S-Down>", "<C-w>J", {
  desc = "Move window below"
})
map("n", "<S-Up>", "<C-w>K", {
  desc = "Move window above"
})
map("n", "<S-Right>", "<C-w>L", {
  desc = "Move window to right"
})

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", {
  desc = "Increase height"
})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {
  desc = "Decrease height"
})
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", {
  desc = "Decrease width"
})
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", {
  desc = "Increase width"
})

-- Split shortcuts
map("n", "<leader>-", "<cmd>split<cr>", {
  desc = "Split window below",
  remap = true
})
map("n", "<leader>|", "<cmd>vsplit<cr>", {
  desc = "Split window right",
  remap = true
})
map("n", "<leader>wd", "<cmd>close<cr>", {
  desc = "Close window",
  remap = true
})

-- Equalize window sizes
map("n", "<leader>we", "<cmd>wincmd =<cr>", {
  desc = "Equalize window sizes"
})

-- Jump to last accessed window
map("n", "<leader>wp", "<C-w>p", {
  desc = "Jump to last window",
  remap = true
})
-- Alternative: `<C-w>p` is default, but having it documented helps

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", {
  desc = "Previous buffer"
})
map("n", "<S-l>", "<cmd>bnext<cr>", {
  desc = "Next buffer"
})
map("n", "<leader>bb", "<cmd>buffer #<cr>", {
  desc = "Switch to alternate buffer"
})

-- Tab movement
map("n", "<A-{>", "<cmd>-tabmove<cr>", {
  desc = "Move tab left"
})
map("n", "<A->}>", "<cmd>+tabmove<cr>", {
  desc = "Move tab right"
})

-- Maximize current window (toggle)
map("n", "<leader>wm", "<cmd>wincmd |<cr>", {
  desc = "Maximize window"
})

-- Force write and quit
map("n", "<leader>wq", "<cmd>wq<cr>", {
  desc = "Save and quit"
})
