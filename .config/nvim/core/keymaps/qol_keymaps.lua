local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true
  }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- better up/down
map({
  "n",
  "x"
}, "j", "v:count == 0 ? 'gj' : 'j'", {
  desc = "Down",
  expr = true,
  silent = true
})
map({
  "n",
  "x"
}, "<Down>", "v:count == 0 ? 'gj' : 'j'", {
  desc = "Down",
  expr = true,
  silent = true
})
map({
  "n",
  "x"
}, "k", "v:count == 0 ? 'gk' : 'k'", {
  desc = "Up",
  expr = true,
  silent = true
})
map({
  "n",
  "x"
}, "<Up>", "v:count == 0 ? 'gk' : 'k'", {
  desc = "Up",
  expr = true,
  silent = true
})

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

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
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", {
  expr = true,
  desc = "Next Search Result"
})
map("x", "n", "'Nn'[v:searchforward]", {
  expr = true,
  desc = "Next Search Result"
})
map("o", "n", "'Nn'[v:searchforward]", {
  expr = true,
  desc = "Next Search Result"
})
map("n", "N", "'nN'[v:searchforward].'zv'", {
  expr = true,
  desc = "Prev Search Result"
})
map("x", "N", "'nN'[v:searchforward]", {
  expr = true,
  desc = "Prev Search Result"
})
map("o", "N", "'nN'[v:searchforward]", {
  expr = true,
  desc = "Prev Search Result"
})

-- Clear Highlights on search
map("n", "<ESC>", ":nohlsearch<CR>", {
  desc = "Clear Highlight"
})
