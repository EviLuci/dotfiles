-- local map = vim.keymap.set
local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- save file
map({
    "i",
    "v",
    "n",
    "s"
}, "<C-s>", "<cmd>w<cr><esc>", {
    desc = "Save file"
})
map({
    "i",
    "v",
    "n",
    "s"
}, "<C-q>", "<cmd>wq!<cr><esc>", {
    desc = "Force Save file and quit"
})

-- quit
map("n", "<leader>qq", "<cmd>wqa<cr>", {
    desc = "Quit all"
})

-- go to beginning and end in insert mode
map("i", "<C-b>", "<ESC>^i", {
    desc = "Go to beginning of line"
})
map("i", "<C-e>", "<End>", {
    desc = "Go to end of line"
})

-- navigate within insert mode
map("i", "<C-h>", "<Left>", {
    desc = "Move Left"
})
map("i", "<C-l>", "<Right>", {
    desc = "Move Right"
})
map("i", "<C-j>", "<Down>", {
    desc = "Move Down"
})
map("i", "<C-k>", "<Up>", {
    desc = "Move Up"
})

-- new file
map("n", "<leader>of", "<cmd>enew<cr>", {
    desc = "New File"
})

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", {
    desc = "Lazy"
})

-- Insert empty line without entering insert mode
map('n', '[o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>')
map('n', ']o', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o")
map("i", "<A-O>", "<C-O>O")

-- Insert blank line
-- keymap("n", "]<Space>", "o<Esc>")
-- keymap("n", "[<Space>", "O<Esc>")

-- Select all text in the current buffer
map('n', '<C-a>', ':keepjumps normal! ggyG<cr>', {
    desc = "Select all"
})

-- Copy whole file
map("n", "<C-y>", "<cmd>%y+<CR>", {
    desc = "Copy whole file"
})

-- better indenting
map("v", "<", "<gv", {
    desc = "Decrease Indent"
})
map("v", ">", ">gv", {
    desc = "Increase Indent"
})

-- Paste
map("n", "<leader>p", "o<Esc>p", {
    desc = "Paste below"
})
map("n", "<leader>P", "O<Esc>p", {
    desc = "Paste above"
})

-- Paste over currently selected text without yanking it
-- map("v", "p", '"_dp', {
--     desc = "Paste over currently selected text without yanking it"
-- })
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
    desc = "Paste over currently selected text without yanking it"
})

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

-- Undo
map("i", "<C-z>", "<C-O>u")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "?", "?<c-g>u")

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")

-- Terminal window movement
map("t", "<C-h>", "<C-\\><C-n><C-w>h", {
    desc = "Go to left window"
})
map("t", "<C-j>", "<C-\\><C-n><C-w>j", {
    desc = "Go to lower window"
})
map("t", "<C-k>", "<C-\\><C-n><C-w>k", {
    desc = "Go to upper window"
})
map("t", "<C-l>", "<C-\\><C-n><C-w>l", {
    desc = "Go to right window"
})

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", {
    desc = "Go to left window"
})
map("n", "<C-j>", "<C-w>j", {
    desc = "Go to lower window"
})
map("n", "<C-k>", "<C-w>k", {
    desc = "Go to upper window"
})
map("n", "<C-l>", "<C-w>l", {
    desc = "Go to right window"
})

-- better up/down
map({
    "n",
    "x"
}, "j", "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'", {
    expr = true,
    silent = true
})
map({
    "n",
    "x"
}, "k", "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'", {
    expr = true,
    silent = true
})

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", {
    desc = "Move down"
})
map("n", "<A-k>", "<cmd>m .-2<cr>==", {
    desc = "Move up"
})
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", {
    desc = "Move down"
})
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", {
    desc = "Move up"
})
map("v", "<A-j>", ":m '>+1<cr>gv=gv", {
    desc = "Move down"
})
map("v", "<A-k>", ":m '<-2<cr>gv=gv", {
    desc = "Move up"
})

-- Resize window using <ctrl> arrow keys
map({
    "n",
    "t"
}, "<C-Up>", "<cmd>resize +2<cr>", {
    desc = "Increase window height"
})
map({
    "n",
    "t"
}, "<C-Down>", "<cmd>resize -2<cr>", {
    desc = "Decrease window height"
})
map({
    "n",
    "t"
}, "<C-Left>", "<cmd>vertical resize -2<cr>", {
    desc = "Decrease window width"
})
map({
    "n",
    "t"
}, "<C-Right>", "<cmd>vertical resize +2<cr>", {
    desc = "Increase window width"
})

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", {
    expr = true,
    desc = "Next search result"
})
map("x", "n", "'Nn'[v:searchforward]", {
    expr = true,
    desc = "Next search result"
})
map("o", "n", "'Nn'[v:searchforward]", {
    expr = true,
    desc = "Next search result"
})
map("n", "N", "'nN'[v:searchforward]", {
    expr = true,
    desc = "Prev search result"
})
map("x", "N", "'nN'[v:searchforward]", {
    expr = true,
    desc = "Prev search result"
})
map("o", "N", "'nN'[v:searchforward]", {
    expr = true,
    desc = "Prev search result"
})

-- Search
map({
    "n",
    "x"
}, "gw", "*N", {
    desc = "Search word under cursor"
})

-- Clear search, diff update and redraw
map("n", "<esc>", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", {
    desc = "Redraw / clear hlsearch / diff update"
})

-- Fast searching text under cursor with Goole with Ctrl+q Ctrl+g
-- I am using ArchLinux so I use the xdg-open command
-- For other file system it can be opEn
local searching_google_in_normal =
    [[:lua vim.fn.system({'xdg-open', 'https://google.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
map("n", "<C-q><C-g>", searching_google_in_normal)

-- windows
map("n", "<leader>ww", "<C-W>p", {
    desc = "Other window"
})
map("n", "<leader>wd", "<C-W>c", {
    desc = "Delete window"
})
map("n", "<leader>w-", "<C-W>s", {
    desc = "Split window below"
})
map("n", "<leader>w|", "<C-W>v", {
    desc = "Split window right"
})
map("n", "<leader>-", "<C-W>s", {
    desc = "Split window below"
})
map("n", "<leader>|", "<C-W>v", {
    desc = "Split window right"
})

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", {
    desc = "Prev buffer"
})
map("n", "]b", "<cmd>bnext<cr>", {
    desc = "Next buffer"
})
map("n", "<leader>bd", "<cmd>bdelete<cr>", {
    desc = "Delete buffer"
})
map("n", "<leader>bb", "<cmd>e #<cr>", {
    desc = "Switch to Other Buffer"
})

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", {
    desc = "Last Tab"
})
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", {
    desc = "First Tab"
})
map("n", "<leader><tab><tab>", "<cmd>tabnew<cPr>", {
    desc = "New Tab"
})
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", {
    desc = "Next Tab"
})
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", {
    desc = "Delete Tab"
})
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", {
    desc = "Previous Tab"
})

-- Alt/Meta + c to invert the case
map('n', '<A-c>', 'guiw~iw')

