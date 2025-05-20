local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Paste
map("n", "<A-v>", "m`o<ESC>p``", {
  desc = "Paste below",
})
map("n", "<A-p>", "m`O<ESC>p``", {
  desc = "Paste above",
})
map("i", "<C-v>", '<C-O>"+p', {
  desc = "Paste from clipboard",
})
map(
  {
    "n",
    "x",
  },
  "<C-c>",
  '"+y<ESC>',
  {
    desc = "Copy to clipboard",
  }
)

map(
  {
    "n",
    "x",
  },
  "<C-v>",
  '"+p<ESC>',
  {
    desc = "Paste from clipboard",
  }
)
map(
  {
    "n",
    "x",
  },
  "<C-x>",
  '"+y<ESC>dd',
  {
    desc = "Cut to clipboard",
  }
)

-- Paste over currently selected text without yanking it
-- map("v", "p", '"_dp', {
--     desc = "Paste over currently selected text without yanking it"
-- })
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
  desc = "Paste over currently selected text without yanking it",
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
  desc = "Select all",
})

-- Comment
map("i", "<C-/>", "<C-O>gcc", {
  desc = "Comment line",
})

-- Copy whole buffer
map("n", "<C-a>", "<cmd>%y+<CR>", {
  desc = "Copy whole buffer",
})

-- Go to the beginning and end of current line in insert mode quickly
map("i", "<A-h>", "<C-O>^i")
map("i", "<A-l>", "<END>")

-- Go to start or end of line easier
map(
  {
    "n",
    "x",
  },
  "<A-h>",
  "^",
  {
    desc = "Go to beginning of line",
  }
)
map(
  {
    "n",
    "x",
  },
  "<A-l>",
  "g_",
  {
    desc = "Go to end of line",
  }
)

-- insert semicolon in the end
map("i", "<A-;>", "<Esc>miA;<Esc>`ii", {
  desc = "insert semicolon in the end",
})

-- Undo
map("i", "<C-z>", "<C-O>u")

-- Insert empty line without entering insert mode
map("n", "[o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below",
})
map("n", "]o", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above",
})
map("n", "<A-o>", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below",
})
map("n", "<A-O>", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above",
})

-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o", {
  desc = "Insert empty line below",
})
map("i", "<A-O>", "<C-O>O", {
  desc = "Insert empty line above",
})

-- Insert blank line
map("n", "]<Space>", "o<Esc>")
map("n", "[<Space>", "O<Esc>")

-- Change text without putting it into the vim register,
map(
  {
    "n",
    "x",
  },
  "c",
  '"_c',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "C",
  '"_C',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "cc",
  '"_cc',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "x",
  '"_x',
  {
    desc = "delete without yanking",
  }
)

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", {
  desc = "Move window to the left",
})
map("n", "<S-Down>", "<C-w><S-j>", {
  desc = "Move window down",
})
map("n", "<S-Up>", "<C-w><S-k>", {
  desc = "Move window up",
})
map("n", "<S-Right>", "<C-w><S-l>", {
  desc = "Move window to the right",
})

-- Search
map(
  {
    "n",
    "x",
  },
  "gw",
  "*N",
  {
    desc = "Search word under cursor",
  }
)

-- Quickfix and Location list mappings
map("n", "[Q", "<cmd>cfirst<CR>zvzz", {
  desc = "First quickfix",
})
local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Paste
map("n", "<A-v>", "m`o<ESC>p``", {
  desc = "Paste below",
})
map("n", "<A-p>", "m`O<ESC>p``", {
  desc = "Paste above",
})
map("i", "<C-v>", '<ESC>"+p<ESC>a', {
  desc = "Paste from clipboard",
})
map(
  {
    "n",
    "x",
  },
  "<C-c>",
  '"+y<ESC>',
  {
    desc = "Copy to clipboard",
  }
)
map(
  {
    "n",
    "x",
  },
  "<C-v>",
  '"+p<ESC>',
  {
    desc = "Paste from clipboard",
  }
)
map(
  {
    "n",
    "x",
  },
  "<C-x>",
  '"+y<ESC>dd',
  {
    desc = "Cut to clipboard",
  }
)

-- Paste over currently selected text without yanking it
-- map("v", "p", '"_dp', {
--     desc = "Paste over currently selected text without yanking it"
-- })
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
  desc = "Paste over currently selected text without yanking it",
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
  desc = "Select all",
})

-- Go to the beginning and end of current line in insert mode quickly
map("i", "<A-h>", "<ESC>^i")
map("i", "<A-l>", "<END>")

-- Go to start or end of line easier
map(
  {
    "n",
    "x",
  },
  "<A-h>",
  "^",
  {
    desc = "Go to beginning of line",
  }
)
map(
  {
    "n",
    "x",
  },
  "<A-l>",
  "g_",
  {
    desc = "Go to end of line",
  }
)

-- insert semicolon in the end
map("i", "<A-;>", "<Esc>miA;<Esc>`ii", {
  desc = "insert semicolon in the end",
})

-- Undo
map("i", "<C-z>", "<C-O>u")

-- Insert empty line without entering insert mode
map("n", "[o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below",
})
map("n", "]o", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above",
})
map("n", "<A-o>", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below",
})
map("n", "<A-O>", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above",
})

-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o", {
  desc = "Insert empty line below",
})
map("i", "<A-O>", "<C-O>O", {
  desc = "Insert empty line above",
})

-- Insert blank line
map("n", "]<Space>", "o<Esc>")
map("n", "[<Space>", "O<Esc>")

-- Copy whole buffer
map("n", "<C-y>", "<cmd>%y+<CR>", {
  desc = "Copy whole buffer",
})

-- Change text without putting it into the vim register,
map(
  {
    "n",
    "x",
  },
  "c",
  '"_c',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "C",
  '"_C',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "cc",
  '"_cc',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "x",
  '"_x',
  {
    desc = "delete without yanking",
  }
)

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", {
  desc = "Move window to the left",
})
map("n", "<S-Down>", "<C-w><S-j>", {
  desc = "Move window down",
})
map("n", "<S-Up>", "<C-w><S-k>", {
  desc = "Move window up",
})
map("n", "<S-Right>", "<C-w><S-l>", {
  desc = "Move window to the right",
})

-- Search
map(
  {
    "n",
    "x",
  },
  "gw",
  "*N",
  {
    desc = "Search word under cursor",
  }
)

-- Quickfix and Location list mappings
map("n", "[q", "<cmd>cprevious<CR>zvzz", {
  desc = "Next quickfix",
})
map("n", "]q", "<cmd>cnext<CR>zvzz", {
  desc = "Previous quickfix",
})
map("n", "[Q", "<cmd>cfirst<CR>zvzz", {
  desc = "First quickfix",
})
map("n", "]Q", "<cmd>clast<CR>zvzz", {
  desc = "Last quickfix",
})
map("n", "[l", "<cmd>lprevious<CR>zvzz", {
  desc = "Previous location",
})
map("n", "]l", "<cmd>lnext<CR>zvzz", {
  desc = "Next location",
})
map("n", "[L", "<cmd>lfirst<CR>zvzz", {
  desc = "First location",
})
map("n", "]L", "<cmd>llast<CR>zvzz", {
  desc = "Last location",
})
map("n", "<leader>xk", "<cmd>cexpr []<cr>", {
  desc = "Clear list",
})
map("n", "<leader>xc", "<cmd>windo lclose <bar> cclose <cr>", {
  desc = "Close list",
})

-- buffers
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", {
  desc = "Prev buffer",
})
map("n", "<C-Tab>", "<cmd>bnext<cr>", {
  desc = "Next buffer",
})

-- folds
map("n", "<leader>z", "<cmd>normal! zMzv<cr>", {
  desc = "Fold all others",
})

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
-- Always use very magic mode for searching
map("n", "/", [[/\v]])

-- Add undo break-points
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Paste
map("n", "<A-v>", "m`o<ESC>p``", {
  desc = "Paste below",
})
map("n", "<A-p>", "m`O<ESC>p``", {
  desc = "Paste above",
})
map("i", "<C-v>", '<ESC>"+p<ESC>a', {
  desc = "Paste from clipboard",
})
map(
  {
    "n",
    "x",
  },
  "<C-c>",
  '"+y<ESC>',
  {
    desc = "Copy to clipboard",
  }
)
map(
  {
    "n",
    "x",
  },
  "<C-v>",
  '"+p<ESC>',
  {
    desc = "Paste from clipboard",
  }
)
map(
  {
    "n",
    "x",
  },
  "<C-x>",
  '"+y<ESC>dd',
  {
    desc = "Cut to clipboard",
  }
)

-- Paste over currently selected text without yanking it
-- map("v", "p", '"_dp', {
--     desc = "Paste over currently selected text without yanking it"
-- })
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
  desc = "Paste over currently selected text without yanking it",
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
  desc = "Select all",
})

-- Go to the beginning and end of current line in insert mode quickly
map("i", "<A-h>", "<ESC>^i")
map("i", "<A-l>", "<END>")

-- Go to start or end of line easier
map(
  {
    "n",
    "x",
  },
  "<A-h>",
  "^",
  {
    desc = "Go to beginning of line",
  }
)
map(
  {
    "n",
    "x",
  },
  "<A-l>",
  "g_",
  {
    desc = "Go to end of line",
  }
)

-- insert semicolon in the end
map("i", "<A-;>", "<Esc>miA;<Esc>`ii", {
  desc = "insert semicolon in the end",
})

-- Undo
map("i", "<C-z>", "<C-O>u")

-- Insert empty line without entering insert mode
map("n", "[o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below",
})
map("n", "]o", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above",
})
map("n", "<A-o>", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
  desc = "Insert empty line below",
})
map("n", "<A-O>", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
  desc = "Insert empty line above",
})

-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o", {
  desc = "Insert empty line below",
})
map("i", "<A-O>", "<C-O>O", {
  desc = "Insert empty line above",
})

-- Insert blank line
map("n", "]<Space>", "o<Esc>")
map("n", "[<Space>", "O<Esc>")

-- Copy whole buffer
map("n", "<C-y>", "<cmd>%y+<CR>", {
  desc = "Copy whole buffer",
})

-- Change text without putting it into the vim register,
map(
  {
    "n",
    "x",
  },
  "c",
  '"_c',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "C",
  '"_C',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "cc",
  '"_cc',
  {
    desc = "Change without yanking",
  }
)
map(
  {
    "n",
    "x",
  },
  "x",
  '"_x',
  {
    desc = "delete without yanking",
  }
)

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", {
  desc = "Move window to the left",
})
map("n", "<S-Down>", "<C-w><S-j>", {
  desc = "Move window down",
})
map("n", "<S-Up>", "<C-w><S-k>", {
  desc = "Move window up",
})
map("n", "<S-Right>", "<C-w><S-l>", {
  desc = "Move window to the right",
})

-- Search
map(
  {
    "n",
    "x",
  },
  "gw",
  "*N",
  {
    desc = "Search word under cursor",
  }
)

-- Quickfix and Location list mappings
map("n", "[q", "<cmd>cprevious<CR>zvzz", {
  desc = "Next quickfix",
})
map("n", "]q", "<cmd>cnext<CR>zvzz", {
  desc = "Previous quickfix",
})
map("n", "[Q", "<cmd>cfirst<CR>zvzz", {
  desc = "First quickfix",
})
map("n", "]Q", "<cmd>clast<CR>zvzz", {
  desc = "Last quickfix",
})
map("n", "[l", "<cmd>lprevious<CR>zvzz", {
  desc = "Previous location",
})
map("n", "]l", "<cmd>lnext<CR>zvzz", {
  desc = "Next location",
})
map("n", "[L", "<cmd>lfirst<CR>zvzz", {
  desc = "First location",
})
map("n", "]L", "<cmd>llast<CR>zvzz", {
  desc = "Last location",
})
map("n", "<leader>xk", "<cmd>cexpr []<cr>", {
  desc = "Clear list",
})
map("n", "<leader>xc", "<cmd>windo lclose <bar> cclose <cr>", {
  desc = "Close list",
})

-- buffers
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", {
  desc = "Prev buffer",
})
map("n", "<C-Tab>", "<cmd>bnext<cr>", {
  desc = "Next buffer",
})

-- folds
map("n", "<leader>z", "<cmd>normal! zMzv<cr>", {
  desc = "Fold all others",
})

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
-- Always use very magic mode for searching
map("n", "/", [[/\v]])

-- Add undo break-points
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- compromised backward search when comma is being used as localleader
map("n", "<A-,>", ",")

-- compromised backward search when comma is being used as localleader
map("n", "<A-,>", ",")
map("n", "]Q", "<cmd>clast<CR>zvzz", {
  desc = "Last quickfix",
})
map("n", "[l", "<cmd>lprevious<CR>zvzz", {
  desc = "Previous location",
})
map("n", "]l", "<cmd>lnext<CR>zvzz", {
  desc = "Next location",
})
map("n", "[L", "<cmd>lfirst<CR>zvzz", {
  desc = "First location",
})
map("n", "]L", "<cmd>llast<CR>zvzz", {
  desc = "Last location",
})
map("n", "<leader>xk", "<cmd>cexpr []<cr>", {
  desc = "Clear list",
})
map("n", "<leader>xc", "<cmd>windo lclose <bar> cclose <cr>", {
  desc = "Close list",
})

-- buffers
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", {
  desc = "Prev buffer",
})
map("n", "<A-Tab>", "<cmd>bnext<cr>", {
  desc = "Next buffer",
})

-- folds
map("n", "<leader>z", "<cmd>normal! zMzv<cr>", {
  desc = "Fold all others",
})

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
-- Always use very magic mode for searching
map("n", "/", [[/\v]])

-- Add undo break-points
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- compromised backward search when comma is being used as localleader
map("n", "<A-,>", ",")
