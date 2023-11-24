vim.g.mapleader = " "
vim.g.maplocalleader = ","

local indent = 2

local opt = vim.opt

opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.copyindent = true
opt.cindent = true
opt.smarttab = true
opt.breakindent = true
opt.smartcase = true
opt.ignorecase = true
opt.infercase = true
opt.shiftround = true
opt.joinspaces = false
opt.backspace = "indent,eol,start"

opt.fillchars = {
    foldopen = "",
    foldclose = "",
    -- fold = "⸱",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " "
}
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.history = 1000
opt.undolevels = 1000
opt.writebackup = false
opt.hidden = true
opt.confirm = true
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
opt.backup = false
opt.swapfile = false

opt.timeoutlen = 300
opt.updatetime = 200

opt.spelllang = {
    "en"
}
opt.autowrite = true
opt.hlsearch = true
opt.scrolloff = 8
opt.sidescrolloff = 8
-- opt.smoothscroll = true

opt.winminwidth = 5
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.cmdheight = 1
opt.emoji = true
opt.virtualedit = "block"
opt.showtabline = 2
opt.laststatus = 0
opt.conceallevel = 0
opt.ruler = true
opt.number = true
opt.cursorline = true
opt.modelines = 1
opt.linebreak = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.background = dark
opt.wrap = false
opt.termguicolors = true
opt.title = true
opt.shortmess:append({
    W = true,
    I = true,
    c = true,
    C = true
})
-- opt.clipboard = "unnamed,unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.inccommand = "nosplit"
opt.magic = true
opt.mouse = "a"
opt.wildignorecase = true
opt.scrolloff = 8

opt.pumblend = 20
opt.pumheight = 10
opt.wildmode = "longest:full,full"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.splitkeep = "screen"
opt.shortmess:append{
    W = true,
    I = true,
    c = true,
    C = true
}

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

