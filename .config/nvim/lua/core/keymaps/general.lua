-- Quality-of-life keymaps that enhance core editing behavior.
local map = require("core.utils").map

-- =============================================================================
-- Navigation: Handle wrapped lines properly
-- =============================================================================
-- Make `j` and `k` move by display line, not logical line
-- Useful when lines wrap (e.g., in prose or long code lines)
map({
  "n",
  "x"
}, "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = "Move down (by screen line)"
})
map({
  "n",
  "x"
}, "<Down>", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = "Move down (by screen line)"
})
map({
  "n",
  "x"
}, "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = "Move up (by screen line)"
})
map({
  "n",
  "x"
}, "<Up>", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = "Move up (by screen line)"
})

-- =============================================================================
-- Indentation: Preserve visual mode selection
-- =============================================================================

-- Better indenting in visual mode: reselect after shifting
map("v", "<", "<gv", {
  desc = "Indent left and preserve selection"
})
map("v", ">", ">gv", {
  desc = "Indent right and preserve selection"
})

-- =============================================================================
-- Search: Center results and improve movement
-- =============================================================================

-- Center screen and re-highlight when jumping to search results
map("n", "n", "'Nn'[v:searchforward].'zv'", {
  expr = true,
  desc = "Next search result (centered)"
})
map("n", "N", "'nN'[v:searchforward].'zv'", {
  expr = true,
  desc = "Previous search result (centered)"
})

-- Also apply to operator-pending and visual modes
map("x", "n", "'Nn'[v:searchforward]", {
  expr = true,
  desc = "Next search result"
})
map("o", "n", "'Nn'[v:searchforward]", {
  expr = true,
  desc = "Next search result (operator-pending)"
})
map("x", "N", "'nN'[v:searchforward]", {
  expr = true,
  desc = "Previous search result"
})
map("o", "N", "'nN'[v:searchforward]", {
  expr = true,
  desc = "Previous search result (operator-pending)"
})

-- Clear search highlight with <Esc> in normal mode
map("n", "<Esc>", ":nohlsearch<CR>", {
  desc = "Clear search highlight"
})

-- =============================================================================
-- Scrolling and movement: Keep cursor centered
-- =============================================================================

-- Center view when scrolling half-page
map("n", "<C-d>", "<C-d>zz", {
  desc = "Scroll down and center"
})
map("n", "<C-u>", "<C-u>zz", {
  desc = "Scroll up and center"
})

-- Center after jumping to next/previous paragraph
map("n", "{", "{zz", {
  desc = "Previous paragraph (centered)"
})
map("n", "}", "}zz", {
  desc = "Next paragraph (centered)"
})

-- Center after jumping to next/previous change
map("n", "g;", "g;zvzz", {
  desc = "Next change (centered)"
})
map("n", "g,", "g,zvzz", {
  desc = "Previous change (centered)"
})

-- =============================================================================
-- Text navigation: Handle wrapped lines and line beginnings
-- =============================================================================

-- Make `^` go to first non-whitespace character on screen line
map("n", "^", "g^", {
  desc = "Go to first non-whitespace (screen line)"
})

-- Make `0` go to very first character on screen line
map("n", "0", "g0", {
  desc = "Go to beginning of screen line"
})

-- In visual mode, `$` should go to last non-whitespace of screen line
map("x", "$", "g_", {
  desc = "Go to last non-whitespace (screen line)"
})

-- =============================================================================
-- Insert mode: Improve undo behavior
-- =============================================================================

-- Add undo breakpoints before punctuation
-- This allows finer-grained undo (e.g., undo one sentence at a time)
for _, key in ipairs({
  ",",
  ".",
  ";",
  "?",
  "!"
}) do
  map("i", key, key .. "<C-g>u", {
    desc = "Insert '" .. key .. "' with undo break"
  })
end

-- =============================================================================
-- Miscellaneous improvements
-- =============================================================================

-- Join lines without moving cursor far
map("n", "J", "mzJ`z", {
  desc = "Join lines, restore cursor position"
})
