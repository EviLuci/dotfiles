local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true
  }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", {
  desc = "Go to Left Window",
  remap = true
})
map("n", "<C-j>", "<C-w>j", {
  desc = "Go to Lower Window",
  remap = true
})
map("n", "<C-k>", "<C-w>k", {
  desc = "Go to Upper Window",
  remap = true
})
map("n", "<C-l>", "<C-w>l", {
  desc = "Go to Right Window",
  remap = true
})
local map = require("core.utils").map

map("n", "<S-Left>", "<C-w><S-h>", {
  desc = "Move window to the left"
})

map("n", "<S-Down>", "<C-w><S-j>", {
  desc = "Move window down"
})
map("n", "<S-Up>", "<C-w><S-k>", {
  desc = "Move window up"
})
map("n", "<S-Right>", "<C-w><S-l>", {
  desc = "Move window to the right"
})

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", {
  desc = "Increase Window Height"
})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {
  desc = "Decrease Window Height"
})
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", {
  desc = "Decrease Window Width"
})
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", {
  desc = "Increase Window Width"
})

-- windows
map("n", "<leader>-", "<C-W>s", {
  desc = "Split Window Below",
  remap = true
})
map("n", "<leader>|", "<C-W>v", {
  desc = "Split Window Right",
  remap = true
})
map("n", "<leader>wd", "<C-W>c", {
  desc = "Delete Window",
  remap = true
})

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", {
  desc = "Prev Buffer"
})
map("n", "<S-l>", "<cmd>bnext<cr>", {
  desc = "Next Buffer"
})
map("n", "<leader>bb", "<cmd>e #<cr>", {
  desc = "Switch to Other Buffer"
})

-- Jump entire buffers throughout jumplist
map("n", "g<C-i>", function() jump_buffer(1) end, {
  desc = "Jump to newer buffer"
})
map("n", "g<C-o>", function() jump_buffer(-1) end, {
  desc = "Jump to older buffer"
})

-- Moving tabs
map("n", "<A-{>", "<cmd>-tabmove<CR>", {
  desc = "Tab Move Backwards"
})
map("n", "<A-}>", "<cmd>+tabmove<CR>", {
  desc = "Tab Move Forwards"
})

