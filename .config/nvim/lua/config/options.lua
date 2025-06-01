vim.g.mapleader = " "
vim.g.maplocalleader = ","

local indent = 2

local opt = vim.opt

-- vscode specific settings
if vim.g.vscode then
  -- show mode in vscode status bar
  opt.showmode = true
end

opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.swapfile = false

-- opt.listchars = {
--     tab = "→ ",
--     eol = "↲",
--     nbsp = "␣",
--     lead = "␣",
--     space = "␣",
--     trail = "•",
--     extends = "⟩",
--     precedes = "⟨"
-- }

opt.clipboard = ""

opt.shell = "fish"

-- Fix common typos
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev W1 w!
    cnoreabbrev w1 w!
    cnoreabbrev Q! q!
    cnoreabbrev Q1 q!
    cnoreabbrev q1 q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wa wa
    cnoreabbrev Wq wq
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev wq1 wq!
    cnoreabbrev Wq1 wq!
    cnoreabbrev wQ1 wq!
    cnoreabbrev WQ1 wq!
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev Qall qall
]])
