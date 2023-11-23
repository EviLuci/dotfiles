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

-- ctrl a to selected all text in file
map({
    "n",
    "i",
    "v"
}, "<C-a>", "<esc>ggVG")

-- quit
map("n", "<A-q>", "<cmd>wqa<cr>", {
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
map("i", "<C-v>", '<ESC>"+p<ESC>a', {
    desc = "Paste"
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

-- Search
map({
    "n",
    "x"
}, "gw", "*N", {
    desc = "Search word under cursor"
})

-- Fast searching text under cursor with Google with Ctrl+q Ctrl+g
-- I am using ArchLinux so I use the xdg-open command
-- For other file system it can be open
local searching_google_in_normal =
    [[:lua vim.fn.system({'xdg-open', 'https://google.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
map("n", "<C-q><C-g>", searching_google_in_normal)

-- Quickfix mappings
map('n', '<leader>qk', ':cexpr []<cr>', {
    desc = 'Clear list'
})
map('n', '<leader>qc', ':cclose <cr>', {
    desc = 'Close list'
})
map('n', '<leader>qo', ':copen <cr>', {
    desc = 'Open list'
})
map('n', '<leader>qf', ':cfdo %s/', {
    desc = 'Search & Replace'
})
map('n', '<leader>qp', ':cprev<cr>zz', {
    desc = 'Prev Item'
})
map('n', '<leader>qn', ':cnext<cr>zz', {
    desc = 'Next Item'
})

-- windows
map("n", "<leader>ww", "<C-W>p", {
    desc = "Other window"
})
map("n", "<leader>wd", "<C-W>c", {
    desc = "Delete window"
})
map("n", "<leader>w-", "<C-W>s", {
    desc = "Split window horizontally"
})
map("n", "<leader>w|", "<C-W>v", {
    desc = "Split window vertically"
})
map("n", "<leader>ws", "<C-W>s", {
    desc = "Split window horizontally"
})
map("n", "<leader>wv", "<C-W>v", {
    desc = "Split window vertically"
})
map("n", "<leader>-", "<C-W>s", {
    desc = "Split window horizontally"
})
map("n", "<leader>|", "<C-W>v", {
    desc = "Split window vertically"
})

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", {
    desc = "Prev buffer"
})
map("n", "]b", "<cmd>bnext<cr>", {
    desc = "Next buffer"
})
map("n", "<Tab>", "<cmd>bprevious<cr>", {
    desc = "Prev buffer"
})
map("n", "<A-Tab>", "<cmd>bnext<cr>", {
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

-- Alt/Meta + c to invert the caseu
map('n', '<A-c>', 'guiw~iw')

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
}, "<Down>", "v:count == 0 ? 'gj' : 'j'", {
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
map({
    "n",
    "x"
}, "<Up>", "v:count == 0 ? 'gk' : 'k'", {
    expr = true,
    silent = true
})

-- Clear search, diff update and redraw
map("n", "<esc>", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", {
    desc = "Redraw / clear hlsearch / diff update"
})

-- Make 'c' key not copy to clipboard when changing a character.
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

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-N
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
