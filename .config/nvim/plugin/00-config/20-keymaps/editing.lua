-- Text editing and clipboard enhancements.
vim.keymap.set({
    "n",
    "i",
    "x",
    "s"
}, "<C-s>", "<cmd>w<cr>", {
    desc = "Save file",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>nf", "<cmd>enew<cr>", {
    desc = "New file",
    noremap = true,
    silent = true
})

-- Copy, cut, paste using system clipboard
vim.keymap.set({
    "n",
    "x"
}, "<C-c>", '"+y', {
    desc = "Copy to clipboard",
    noremap = true
})
vim.keymap.set({
    "n",
    "x"
}, "<A-v>", '"+p', {
    desc = "Paste from clipboard",
    noremap = true
})
vim.keymap.set({
    "n",
    "x"
}, "<C-x>", '"+y<cmd>normal! d<cr>', {
    desc = "Cut to clipboard",
    noremap = true
})

-- Yank file path (relative and absolute)
vim.keymap.set("n", "<leader>y", function()
    local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:.")
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, {
        title = "Yanked relative path"
    })
end, {
    desc = "Yank relative path",
    noremap = true,
    silent = true
})

vim.keymap.set("n", "<leader>Y", function()
    local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, {
        title = "Yanked absolute path"
    })
end, {
    desc = "Yank absolute path",
    noremap = true,
    silent = true
})

-- Duplicate current line or visual selection
vim.keymap.set("n", "<leader>yp", 'm`""Y""P``', {
    desc = "Duplicate line",
    noremap = true
})
vim.keymap.set("x", "<leader>yp", '""Y""Pgv', {
    desc = "Duplicate selection",
    noremap = true
})

-- Duplicate line and comment out original
vim.keymap.set("n", "<leader>yc", "yygccp", {
    desc = "Duplicate line and comment out",
    noremap = true
})

-- Avoid overwriting register when changing or deleting
vim.keymap.set({
    "n",
    "x"
}, "c", '"_c', {
    desc = "Change without yank",
    noremap = true
})
vim.keymap.set({
    "n",
    "x"
}, "C", '"_C', {
    desc = "Change without yank",
    noremap = true
})
vim.keymap.set({
    "n",
    "x"
}, "cc", '"_cc', {
    desc = "Change without yank",
    noremap = true
})
vim.keymap.set({
    "n",
    "x"
}, "x", '"_x', {
    desc = "Delete without yank",
    noremap = true
})

-- Paste over selection without overwriting yank register
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
    desc = "Paste without yanking",
    expr = true,
    noremap = true
})
vim.keymap.set("x", "P", 'P:let @+=@0<CR>:let @"=@0<CR>', {
    desc = "Paste in-place without yanking",
    expr = true,
    noremap = true
})

-- Jump to first/last character on screen line (wrapped lines)
vim.keymap.set("n", "gh", "g^", {
    desc = "Go to first screen character",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "gl", "g$", {
    desc = "Go to last screen character",
    noremap = true,
    silent = true
})

-- Alt+h/l to go to BOL/EOL (works in normal and visual modes)
vim.keymap.set({
    "n",
    "x"
}, "<A-h>", "^", {
    desc = "Go to beginning of line",
    noremap = true,
    silent = true
})
vim.keymap.set({
    "n",
    "x"
}, "<A-l>", "g_", {
    desc = "Go to end of line",
    noremap = true,
    silent = true
})

-- Insert empty lines above/below without entering insert mode
vim.keymap.set("n", "[o", ":<C-u>call append(line('.'), repeat([''], v:count1))<CR>", {
    desc = "Insert empty line above",
    expr = true,
    noremap = true
})
vim.keymap.set("n", "]o", ":<C-u>call append(line('.'), repeat([''], v:count1))<CR>", {
    desc = "Insert empty line below",
    expr = true,
    noremap = true
})

-- Increment/decrement numbers
vim.keymap.set("n", "+", "<C-a>", {
    desc = "Increment number",
    noremap = true
})
vim.keymap.set("n", "-", "<C-x>", {
    desc = "Decrement number",
    noremap = true
})

-- Move lines up/down
vim.keymap.set("n", "<A-down>", ":m .+1<CR>==", {
    desc = "Move line down",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<A-up>", ":m .-2<CR>==", {
    desc = "Move line up",
    noremap = true,
    silent = true
})
vim.keymap.set("i", "<A-down>", "<Esc>:m .+1<CR>==gi", {
    desc = "Move line down",
    noremap = true,
    silent = true
})
vim.keymap.set("i", "<A-up>", "<Esc>:m .-2<CR>==gi", {
    desc = "Move line up",
    noremap = true,
    silent = true
})
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", {
    desc = "Move selection down",
    noremap = true,
    silent = true
})
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", {
    desc = "Move selection up",
    noremap = true,
    silent = true
})

-- Indent in visual mode with Tab
vim.keymap.set("x", "<Tab>", ">gv", {
    desc = "Indent right",
    noremap = true,
    silent = true
})
vim.keymap.set("x", "<S-Tab>", "<gv", {
    desc = "Indent left",
    noremap = true,
    silent = true
})

-- Paste below with marker and re-center
vim.keymap.set("n", "]p", "m`o<Esc>p``", {
    desc = "Paste below",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "[p", "m`O<Esc>p``", {
    desc = "Paste above",
    noremap = true,
    silent = true
})

-- Search word under cursor (like * but includes non-word chars)
vim.keymap.set({
    "n",
    "x"
}, "gw", "*N", {
    desc = "Search word under cursor",
    noremap = true,
    silent = true
})

-- Fold all except current context
vim.keymap.set("n", "<leader>zf", "zMzvzz", {
    desc = "Focus current fold",
    noremap = true,
    silent = true
})

-- Close current fold, open next/previous
vim.keymap.set("n", "zj", "zcjzOzz", {
    desc = "Close fold, open next",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "zk", "zckzOzz", {
    desc = "Close fold, open previous",
    noremap = true,
    silent = true
})

-- =============================================================================
-- Insert Mode Enhancements
-- =============================================================================

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode",
    noremap = true
})
vim.keymap.set("t", "jk", "<C-\\><C-n>", {
    desc = "Exit terminal mode",
    noremap = true
})
vim.keymap.set("t", "kj", "<C-\\><C-n>", {
    desc = "Exit terminal mode",
    noremap = true
})
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", {
    desc = "Hide terminal",
    noremap = true,
    silent = true
})

-- Fast escape from insert mode
vim.keymap.set("i", "jk", "<Esc>", {
    desc = "Exit insert mode",
    noremap = true
})
vim.keymap.set("i", "kj", "<Esc>", {
    desc = "Exit insert mode",
    noremap = true
})

-- Go to BOL/EOL in insert mode
vim.keymap.set("i", "<A-h>", "<C-o>I", {
    desc = "Go to beginning of line",
    noremap = true
})
vim.keymap.set("i", "<A-l>", "<End>", {
    desc = "Go to end of line",
    noremap = true
})

-- Insert semicolon or comma at end of line
vim.keymap.set("i", "<A-;>", "<Esc>m`A;<Esc>``i", {
    desc = "Insert semicolon at end",
    noremap = true
})
vim.keymap.set("i", "<A-,>", "<Esc>m`A,<Esc>``i", {
    desc = "Insert comma at end",
    noremap = true
})

-- Insert empty lines in insert mode
vim.keymap.set("i", "<A-o>", "<C-o>o", {
    desc = "Insert empty line below",
    noremap = true
})
vim.keymap.set("i", "<A-O>", "<C-o>O", {
    desc = "Insert empty line above",
    noremap = true
})

-- Change word in insert mode
vim.keymap.set("i", "<C-w>", "<C-o>ciw", {
    desc = "Change word",
    noremap = true
})

-- Select all in insert mode
vim.keymap.set("i", "<C-a>", "<C-o>gg<C-o>V<C-o>G", {
    desc = "Select all",
    noremap = true
})

-- Undo in insert mode
vim.keymap.set("i", "<C-z>", "<C-o>u", {
    desc = "Undo",
    noremap = true
})

-- Paste in insert mode
vim.keymap.set("i", "<C-v>", "<C-o>\"+p", {
    desc = "Paste from clipboard",
    noremap = true
})

-- =============================================================================
-- Command Line
-- =============================================================================

-- Better navigation in command mode
vim.keymap.set("c", "<C-h>", "<Home>", {
    desc = "Go to start of command line",
    noremap = true
})
vim.keymap.set("c", "<C-l>", "<End>", {
    desc = "Go to end of command line",
    noremap = true
})
vim.keymap.set("c", "<C-b>", "<Left>", {
    desc = "Move left",
    noremap = true
})
vim.keymap.set("c", "<C-f>", "<Right>", {
    desc = "Move right",
    noremap = true
})

-- Send visual selection to terminal
vim.keymap.set("v", "<leader>ts", "y<C-w>jpa<cr><C-w>k", {
    noremap = true,
    desc = "Send selection to terminal"
})

-- =============================================================================
-- Plugin-Dependent Mappings
-- =============================================================================

-- Open notes (Snacks.nvim or similar)
vim.keymap.set("n", "<leader>on", function()
    Snacks.picker.files({
        cwd = vim.fn.expand("~/git_repos/notes")
    })
end, {
    desc = "Open notes",
    noremap = true,
    silent = true
})

-- Inspect syntax/tree
vim.keymap.set("n", "<leader>ui", vim.show_pos, {
    desc = "Inspect highlight groups",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "<leader>uI", function()
    vim.treesitter.inspect_tree()
    vim.api.nvim_input("I")
end, {
    desc = "Inspect Treesitter tree",
    noremap = true,
    silent = true
})

-- Compensate for <A-,> being used as a mapping
vim.keymap.set("n", "<A-,>", ",", {
    desc = "Normal comma after remap conflict",
    noremap = true,
    silent = true
})

-- Toggle case of word
vim.keymap.set("n", "<leader>u", "g~iw", {
    noremap = true,
    desc = "Toggle case of word"
})
vim.keymap.set("x", "<leader>u", "g~", {
    noremap = true,
    desc = "Toggle case of selection"
})
