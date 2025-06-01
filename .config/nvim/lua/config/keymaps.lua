local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true
  }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Paste
map("n", "]p", "m`o<ESC>p``", {
  desc = "Paste below"
})
map("n", "[p", "m`O<ESC>p``", {
  desc = "Paste above"
})
map("i", "<C-v>", '<C-O>"+p', {
  desc = "Paste from clipboard"
})
map({
  "n",
  "x"
}, "<C-c>", '"+y<ESC>', {
  desc = "Copy to clipboard"
})

map({
  "n",
  "x"
}, "<A-v>", '"+p<ESC>', {
  desc = "Paste from clipboard"
})

map({
  "n",
  "x"
}, "<C-x>", '"+y<ESC>dd', {
  desc = "Cut to clipboard"
})

-- Copy whole buffer
map("n", "<C-y>", "<cmd>%y+<CR>", {
  desc = "Copy whole buffer"
})

-- Yank buffer's relative path to clipboard
map("n", "<leader>y", function()
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:.") or ""
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, {
    title = "Yanked relative path"
  })
end, {
  silent = true,
  desc = "Yank relative path"
})

-- Yank absolute path
map("n", "<leader>Y", function()
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p") or ""
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, {
    title = "Yanked absolute path"
  })
end, {
  silent = true,
  desc = "Yank absolute path"
})

-- Duplicate lines without affecting PRIMARY and CLIPBOARD selections.
map("n", "<Leader>yp", 'm`""Y""P``', {
  desc = "Duplicate line"
})
map("x", "<Leader>yp", '""Y""Pgv', {
  desc = "Duplicate selection"
})
map("i", "<A-d>", '<C-O>m`<C-O>""Y""P``', {
  desc = "Duplicate line in insert mode"
})

-- Duplicate a line and comment out the first line
map("n", "<leader>yc", "yygccp", {
  remap = true,
  desc = "Duplicate line and comment out the first line"
})

-- Change word in insert mode
map("i", "<C-w>", "<C-O>ciw", {
  desc = "Change word in insert mode"
})

-- Change text without putting it into the vim register,
map({
  "n",
  "x"
}, "c", '"_c', {
  desc = "Change without yanking"
})
map({
  "n",
  "x"
}, "C", '"_C', {
  desc = "Change without yanking"
})
map({
  "n",
  "x"
}, "cc", '"_cc', {
  desc = "Change without yanking"
})
map({
  "n",
  "x"
}, "x", '"_x', {
  desc = "delete without yanking"
})

-- Paste over currently selected text without yanking it
-- map("v", "p", '"_dp', {
--     desc = "Paste over currently selected text without yanking it"
-- })
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
  silent = true,
  desc = "Paste"
})
map("x", "P", 'P:let @+=@0<CR>:let @"=@0<CR>', {
  silent = true,
  desc = "Paste In-place"
})

-- map("x", "p", '"_c<Esc>p', {
--     desc = "paste without yanking"
-- })

-- ctrl a to selected all text in file
-- map({
--     "n",
--     "i",
--     "v"
-- }, "<C-a>", "<esc>ggVG")
--
-- Select all text in the current buffer
map("i", "<C-a>", "<esc><cmd>keepjumps normal! ggVG<cr>", {
  desc = "Select all"
})

-- Comment (doesn't work right now)
-- map("i", "<C-/", "<C-O>gcc", {
--   remap = true,
--   desc = "Comment line",
-- })

-- Go to the beginning and end of current line in insert mode quickly
map("i", "<A-h>", "<C-O>I")
map("i", "<A-l>", "<END>")

-- Easier line-wise movement
map("n", "gh", "g^", {
  desc = "Jump to first screen character"
})
map("n", "gl", "g$", {
  desc = "Jump to last screen character"
})

-- Ctrl Backspace
map('i', '<C-H>', '<C-W>', {
  desc = "Delete word backwards"
})

-- Go to start or end of line easier
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

-- insert semicolon in the end
map("i", "<A-;>", "<Esc>miA;<Esc>`ii", {
  desc = "insert semicolon in the end"
})
-- insert comma in the end
map("i", "<A-,>", "<Esc>miA,<Esc>`ii", {
  desc = "insert comma in the end"
})

-- Undo
map("i", "<C-z>", "<C-O>u")

-- Insert empty line without entering insert mode
map("n", "[o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below"
})
map("n", "]o", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above"
})
map("n", "<A-o>", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below"
})
map("n", "<A-O>", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above"
})

-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o", {
  desc = "Insert empty line below"
})
map("i", "<A-O>", "<C-O>O", {
  desc = "Insert empty line above"
})

-- Insert blank line
map("n", "]<Space>", "o<Esc>")
map("n", "[<Space>", "O<Esc>")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

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

-- Use tab for indenting in visual/select mode
map("x", "<Tab>", ">gv", {
  remap = true,
  desc = "Indent Left"
})
map("x", "<S-Tab>", "<gv", {
  remap = true,
  desc = "Indent Right"
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

-- Quick substitute within selected area
map("x", "sg", ":s//gc<Left><Left><Left>", {
  desc = "Substitute Within Selection"
})

-- Search
map({
  "n",
  "x"
}, "gw", "*N", {
  desc = "Search word under cursor"
})

-- Quickfix and Location list mappings
map("n", "[q", "<cmd>cprevious<CR>zvzz", {
  desc = "Next quickfix"
})
map("n", "]q", "<cmd>cnext<CR>zvzz", {
  desc = "Previous quickfix"
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

-- folds
map("n", "<leader>zo", "<cmd>normal! zMzv<cr>", {
  desc = "Fold all others"
})
-- Focus the current fold by closing all others
map("n", "<leader>zf", "zMzvzz", {
  desc = "Focus Fold"
})

map("n", "<leader>zj", "zMzvzz", {
  desc = "Focus Fold"
})
-- Close current fold when open. Always open next fold.
map("n", "zj", "zcjzOzz", {
  desc = "Close fold & open next one"
})

-- Close current fold when open. Always open previous fold.
map("n", "zk", "zckzOzz", {
  desc = "Close fold & open previous one"
})

-- Navigation in command line
map("c", "<C-h>", "<Home>")
map("c", "<C-l>", "<End>")
map("c", "<C-f>", "<Right>")
map("c", "<C-b>", "<Left>")

-- Split Window Right
map("n", "<C-\\>", "<C-W>v", {
  desc = "Split Window Right",
  remap = true
})

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")

-- compromised backward search when comma is being used as localleader
map("n", "<A-,>", ",")

-- Some cool remaps
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "}", "}zzzv")
map("n", "{", "{zzzv")
map("n", "g,", "g,zvzz")
map("n", "g;", "g;zvzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "^", "g^")
map("n", "0", "g0")
-- Do not include white space characters when using $ in visual mode,
map("x", "$", "g_")

-- Add undo break-points
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Keymaps Dependent to plugins

-- Open Notes Folder
map("n", "<leader>on", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("~/git_repos/notes")
  })
end, {
  desc = "Open Notes"
})
