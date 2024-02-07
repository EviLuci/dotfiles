vim.g.mapleader = " "

local opt = vim.opt

-- Keymaps
local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- ctrl a to selected all text in file
map({
    "n",
    "i",
    "v"
}, "<C-a>", "<esc>ggVG")

-- Paste
map("n", "]p", "o<Esc>p", {
    desc = "Paste below"
})
map("n", "[P", "O<Esc>p", {
    desc = "Paste above"
})

-- Paste over currently selected text without yanking it
map("v", "p", '"_dp', {
    desc = "Paste over currently selected text without yanking it"
})

map("i", "<C-v>", '<ESC>"+p<ESC>a', {
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
}, "<C-v>", '"+p<ESC>', {
    desc = "Paste from clipboard"
})
map({
    "n",
    "x"
}, "<C-x>", '"+y<ESC>dd', {
    desc = "Cut to clipboard"
})

-- go to beginning and end in insert mode
map("i", "<A-b>", "<ESC>^i", {
    desc = "Go to beginning of line"
})
map("i", "<A-e>", "<End>", {
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

-- Insert empty line without entering insert mode
map('n', '[o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
    desc = "Insert empty line below"
})
map('n', ']o', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
    desc = "Insert empty line above"
})

-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o", {
    desc = "Insert empty line below"
})
map("i", "<A-O>", "<C-O>O", {
    desc = "Insert empty line above"
})

-- Remap _ and $
map("n", "H", "_", {
    desc = "Go to beginning of line"
})
map("n", "L", "$", {
    desc = "Go to end of line"
})

-- better indenting
map("v", "<", "<gv", {
    desc = "Decrease Indent"
})
map("v", ">", ">gv", {
    desc = "Increase Indent"
})

-- Change the default Copy to clipboard behaviour
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
}, "x", '"_x', {
    desc = "delete without yanking"
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

-- Search
map({
    "n",
    "x"
}, "gw", "*N", {
    desc = "Search word under cursor"
})

-- Some cool remaps
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "g,", "g,zvzz")
map("n", "g;", "g;zvzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Undo
map("i", "<C-z>", "<C-O>u")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "?", "?<c-g>u")
