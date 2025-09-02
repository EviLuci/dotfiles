local opt = vim.opt
local g = vim.g

g.have_nerd_font = true

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

local indent = 2

-- Tabs and Indent
opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftround = true
opt.shiftwidth = indent
opt.expandtab = true
opt.smartindent = true

-- Number
opt.number = true
opt.relativenumber = true
opt.ruler = false

-- Search
opt.smartcase = true
opt.ignorecase = true

-- General
opt.autowrite = true
opt.completeopt = {
  "menu",
  "menuone",
  "noselect"
}
opt.confirm = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wildmode = "longest:full,full"
opt.shell = "fish"
opt.mouse = 'a'
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
  "skiprtp",
  "folds"
}

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = ""

-- UI
opt.conceallevel = 2
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " "
}
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
opt.foldlevel = 99
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- Preview substitutions live, as you type!
opt.jumpoptions = "view"
opt.laststatus = 3
opt.list = true
opt.termguicolors = true
opt.virtualedit = "block"
opt.winminwidth = 5
opt.smoothscroll = true
opt.signcolumn = "yes"

-- Linebreak
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- Prevent Unnecessary Behavior
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.showmode = false

-- vscode specific settings
if vim.g.vscode then opt.showmode = true end

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

-- Markdown
vim.g.markdown_recommended_style = 0
