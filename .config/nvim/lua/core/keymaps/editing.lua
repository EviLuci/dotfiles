-- Text editing and clipboard enhancements.
local map = require("core.utils").map

-- =============================================================================
-- Save & New File
-- =============================================================================
map({
  "n",
  "i",
  "x",
  "s"
}, "<C-s>", "<cmd>w<cr>", {
  desc = "Save file"
})
map("n", "<leader>nf", "<cmd>enew<cr>", {
  desc = "New file"
})

-- =============================================================================
-- Clipboard Operations (using + register)
-- =============================================================================

-- Copy, cut, paste using system clipboard
map({
  "n",
  "x"
}, "<C-c>", '"+y', {
  desc = "Copy to clipboard"
})
map({
  "n",
  "x"
}, "<A-v>", '"+p', {
  desc = "Paste from clipboard"
})
map({
  "n",
  "x"
}, "<C-x>", '"+y<cmd>normal! d<cr>', {
  desc = "Cut to clipboard"
})

-- Copy entire buffer
map("n", "<C-c>", "<cmd>%y+<cr>", {
  desc = "Copy entire buffer"
})
map("n", "<C-y>", "<cmd>%y+<cr>", {
  desc = "Copy entire buffer"
})

-- Yank file path (relative and absolute)
map("n", "<leader>y", function()
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:.")
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, {
    title = "Yanked relative path"
  })
end, {
  desc = "Yank relative path"
})

map("n", "<leader>Y", function()
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, {
    title = "Yanked absolute path"
  })
end, {
  desc = "Yank absolute path"
})

-- =============================================================================
-- Duplicate Lines & Selections
-- =============================================================================

-- Duplicate current line or visual selection
map("n", "<leader>yp", 'm`""Y""P``', {
  desc = "Duplicate line"
})
map("x", "<leader>yp", '""Y""Pgv', {
  desc = "Duplicate selection"
})

-- Duplicate line and comment out original
map("n", "<leader>yc", "yygccp", {
  desc = "Duplicate line and comment out"
})

-- =============================================================================
-- Change & Delete Without Yanking
-- =============================================================================

-- Avoid overwriting register when changing or deleting
map({
  "n",
  "x"
}, "c", '"_c', {
  desc = "Change without yank"
})
map({
  "n",
  "x"
}, "C", '"_C', {
  desc = "Change without yank"
})
map({
  "n",
  "x"
}, "cc", '"_cc', {
  desc = "Change without yank"
})
map({
  "n",
  "x"
}, "x", '"_x', {
  desc = "Delete without yank"
})

-- Paste over selection without overwriting yank register
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
  desc = "Paste without yanking"
})
map("x", "P", 'P:let @+=@0<CR>:let @"=@0<CR>', {
  desc = "Paste in-place without yanking"
})

-- =============================================================================
-- Movement & Line Editing
-- =============================================================================

-- Jump to first/last character on screen line (wrapped lines)
map("n", "gh", "g^", {
  desc = "Go to first screen character"
})
map("n", "gl", "g$", {
  desc = "Go to last screen character"
})

-- Alt+h/l to go to BOL/EOL (works in normal and visual modes)
map({
  "n",
  "x"
}, "<A-h>", "^", {
  desc = "Go to beginning of line"
})
map({
  "n",
  "x"
}, "<A-l>", "g_", {
  desc = "Go to end of line"
})

-- Insert empty lines above/below without entering insert mode
map("n", "[o", ":<C-u>call append(line('.'), repeat([''], v:count1))<CR>", {
  desc = "Insert empty line above"
})
map("n", "]o", ":<C-u>call append(line('.'), repeat([''], v:count1))<CR>", {
  desc = "Insert empty line below"
})
map("n", "<A-o>", "]o", {
  desc = "Insert empty line below"
})
map("n", "<A-O>", "[o", {
  desc = "Insert empty line above"
})

-- Insert blank line with Space
map("n", "]<Space>", "o<Esc>", {
  desc = "Insert blank line below"
})
map("n", "[<Space>", "O<Esc>", {
  desc = "Insert blank line above"
})

-- Increment/decrement numbers
map("n", "+", "<C-a>", {
  desc = "Increment number"
})
map("n", "-", "<C-x>", {
  desc = "Decrement number"
})

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", {
  desc = "Move line down"
})
map("n", "<A-k>", ":m .-2<CR>==", {
  desc = "Move line up"
})
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {
  desc = "Move line down"
})
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {
  desc = "Move line up"
})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {
  desc = "Move selection down"
})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", {
  desc = "Move selection up"
})

-- Indent in visual mode with Tab
map("x", "<Tab>", ">gv", {
  desc = "Indent right"
})
map("x", "<S-Tab>", "<gv", {
  desc = "Indent left"
})

-- =============================================================================
-- Paste with Context (above/below)
-- =============================================================================

-- Paste below with marker and re-center
map("n", "]p", "m`o<Esc>p``", {
  desc = "Paste below"
})
map("n", "[p", "m`O<Esc>p``", {
  desc = "Paste above"
})

-- =============================================================================
-- Search & Substitution
-- =============================================================================

-- Search word under cursor (like * but includes non-word chars)
map({
  "n",
  "x"
}, "gw", "*N", {
  desc = "Search word under cursor"
})

-- Quick substitute in visual selection
map("x", "sg", ":s//gc<Left><Left><Left>", {
  desc = "Substitute in selection"
})

-- =============================================================================
-- Folding
-- =============================================================================

-- Fold all except current context
map("n", "<leader>zo", "zMzvzz", {
  desc = "Focus current fold"
})
map("n", "<leader>zf", "zMzvzz", {
  desc = "Focus current fold"
})
map("n", "<leader>zj", "zMzvzz", {
  desc = "Focus current fold"
})

-- Close current fold, open next/previous
map("n", "zj", "zcjzOzz", {
  desc = "Close fold, open next"
})
map("n", "zk", "zckzOzz", {
  desc = "Close fold, open previous"
})

-- =============================================================================
-- Insert Mode Enhancements
-- =============================================================================

-- Exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>", {
  desc = "Exit terminal mode"
})
map("t", "jk", "<C-\\><C-n>", {
  desc = "Exit terminal mode"
})
map("t", "kj", "<C-\\><C-n>", {
  desc = "Exit terminal mode"
})
map("t", "<C-/>", "<cmd>close<cr>", {
  desc = "Hide terminal"
})

-- Fast escape from insert mode
map("i", "jk", "<Esc>", {
  desc = "Exit insert mode"
})
map("i", "kj", "<Esc>", {
  desc = "Exit insert mode"
})
map("i", "jj", "<Esc>", {
  desc = "Exit insert mode"
})

-- Go to BOL/EOL in insert mode
map("i", "<A-h>", "<C-o>I", {
  desc = "Go to beginning of line"
})
map("i", "<A-l>", "<End>", {
  desc = "Go to end of line"
})

-- Insert semicolon or comma at end of line
map("i", "<A-;>", "<Esc>m`A;<Esc>``i", {
  desc = "Insert semicolon at end"
})
map("i", "<A-,>", "<Esc>m`A,<Esc>``i", {
  desc = "Insert comma at end"
})

-- Insert empty lines in insert mode
map("i", "<A-o>", "<C-o>o", {
  desc = "Insert empty line below"
})
map("i", "<A-O>", "<C-o>O", {
  desc = "Insert empty line above"
})

-- Change word in insert mode
map("i", "<C-w>", "<C-o>ciw", {
  desc = "Change word"
})

-- Select all in insert mode
map("i", "<C-a>", "<C-o>gg<C-o>V<C-o>G", {
  desc = "Select all"
})

-- Undo in insert mode
map("i", "<C-z>", "<C-o>u", {
  desc = "Undo"
})

-- Paste in insert mode
map("i", "<C-v>", "<C-o>\"+p", {
  desc = "Paste from clipboard"
})

-- =============================================================================
-- Command Line
-- =============================================================================

-- Better navigation in command mode
map("c", "<C-h>", "<Home>", {
  desc = "Go to start of command line"
})
map("c", "<C-l>", "<End>", {
  desc = "Go to end of command line"
})
map("c", "<C-b>", "<Left>", {
  desc = "Move left"
})
map("c", "<C-f>", "<Right>", {
  desc = "Move right"
})

-- =============================================================================
-- Plugin-Dependent Mappings
-- =============================================================================

-- Open notes (Snacks.nvim or similar)
map("n", "<leader>on", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("~/git_repos/notes")
  })
end, {
  desc = "Open notes"
})

-- Inspect syntax/tree
map("n", "<leader>ui", vim.show_pos, {
  desc = "Inspect highlight groups"
})
map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input("I")
end, {
  desc = "Inspect Treesitter tree"
})

-- Compensate for <A-,> being used as a mapping
map("n", "<A-,>", ",", {
  desc = "Normal comma after remap conflict"
})
