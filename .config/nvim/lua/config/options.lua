vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local indent = 4

local opt = vim.opt

opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.autoindent = true
opt.copyindent = true
opt.cindent = true
opt.smarttab = true
opt.breakindent = true
opt.infercase = true
opt.joinspaces = false
opt.backspace = "indent,eol,start"

opt.listchars = {
    tab = "→ ",
    eol = "↲",
    nbsp = "␣",
    lead = "␣",
    space = "␣",
    trail = "•",
    extends = "⟩",
    precedes = "⟨"
}

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.history = 1000
opt.undolevels = 10000
opt.writebackup = false
opt.hidden = true
opt.backup = false
opt.swapfile = false

opt.timeoutlen = 300
opt.updatetime = 200

opt.hlsearch = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.winminwidth = 5
opt.showmode = false
opt.cmdheight = 1
opt.emoji = true
opt.showtabline = 2
-- opt.laststatus = 0
-- opt.conceallevel = 0
opt.ruler = true
opt.modelines = 1
opt.linebreak = true
opt.relativenumber = true
opt.title = true
opt.clipboard = ""
opt.wildignorecase = true
opt.pumblend = 20
opt.pumheight = 10
-- opt.formatoptions = "jcroqlnt" -- tcqj
opt.formatoptions = opt.formatoptions - "a" -- Auto formatting is BAD.
- "t" -- Don't auto format my code. I got linters for that.
+ "c" -- In general, I like it when comments respect textwidth
+ "q" -- Allow formatting comments w/ gq
- "o" -- O and o, don't continue comments
+ "r" -- But do continue when pressing enter.
+ "n" -- Indent past the formatlistpat, not underneath it.
+ "j" -- Auto-remove comments if possible.
- "2" -- I'm not in gradeschool anymore
+ "l" -- Long lines are just too hard to wrap

opt.shell = "fish"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

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
