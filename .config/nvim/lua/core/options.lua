-- Core Neovim settings.
-- This file configures editor behavior including indentation, UI, search, and file handling.
local opt = vim.opt
local g = vim.g

-- -----------------------------------------------------------------------------
-- Global variables and provider settings
-- -----------------------------------------------------------------------------

-- Indicate that a Nerd Font is available (used by plugins for icons)
g.have_nerd_font = true

-- Disable unused language providers to improve startup performance
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- -----------------------------------------------------------------------------
-- Indentation and tab behavior
-- -----------------------------------------------------------------------------

local indent = 2

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = indent -- Number of spaces a tab counts for
opt.shiftwidth = indent -- Number of spaces for each indentation step
opt.softtabstop = indent -- Backspace treats spaces like tabs
opt.shiftround = true -- Round indent to nearest shiftwidth
opt.smartindent = true -- Enable smart auto-indenting for code
opt.smarttab = true -- Use shiftwidth for tab in insert mode
opt.autoindent = true -- Copy indent from current line to new line

-- -----------------------------------------------------------------------------
-- Line numbers and cursor display
-- -----------------------------------------------------------------------------

opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show line numbers relative to cursor
opt.ruler = false -- Disable ruler (statusline will show position)

-- -----------------------------------------------------------------------------
-- Search and completion
-- -----------------------------------------------------------------------------

opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Case-sensitive if search contains uppercase
opt.incsearch = true -- Highlight matches as you type
opt.inccommand = "nosplit" -- Preview substitutions live

opt.confirm = true -- Prompt before exiting with unsaved changes
opt.wildmode = "longest:full,full" -- Command-line completion style
opt.wildignore:append("*/node_modules/*") -- Ignore in file completion

-- Completion menu behavior
opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
  "preview"
}

-- -----------------------------------------------------------------------------
-- File and buffer settings
-- -----------------------------------------------------------------------------

opt.autowrite = true -- Save file when switching buffers
opt.swapfile = false -- Disable swap files
opt.backup = false -- Disable backup files
opt.writebackup = false -- Disable backup before write

opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000 -- Number of undo levels
opt.undodir = vim.fn.stdpath("data") .. "/undo" -- Directory for undo files

opt.updatetime = 200 -- Interval for saving swap/undo and CursorHold events
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

-- -----------------------------------------------------------------------------
-- Input and command-line
-- -----------------------------------------------------------------------------

-- Timeout for keymap sequences (longer in VSCode to avoid conflicts)
opt.timeoutlen = vim.g.vscode and 1000 or 300

opt.mouse = "a" -- Enable mouse in all modes

-- Fix common command-line typos
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

-- -----------------------------------------------------------------------------
-- Text wrapping and display
-- -----------------------------------------------------------------------------

opt.wrap = true -- Wrap long lines
opt.linebreak = true -- Break lines at appropriate characters
opt.breakindent = true -- Indent wrapped lines to match original

-- -----------------------------------------------------------------------------
-- Window and split behavior
-- -----------------------------------------------------------------------------

opt.splitbelow = true -- New horizontal splits open below
opt.splitright = true -- New vertical splits open to the right
opt.splitkeep = "screen" -- Keep view stable when loading new content

opt.scrolloff = 8 -- Keep at least 8 lines around cursor
opt.sidescrolloff = 8
opt.winminwidth = 5 -- Minimum window width

-- -----------------------------------------------------------------------------
-- User interface
-- -----------------------------------------------------------------------------

opt.termguicolors = true -- Enable true color support
opt.cursorline = true -- Highlight current line
opt.signcolumn = "yes:2" -- Always show sign column (2 char width)
opt.pumheight = 10 -- Limit height of completion menu
opt.laststatus = 3 -- Global statusline (single at bottom)
opt.showtabline = 2 -- Always show tab line

opt.conceallevel = 2 -- Hide markup in files like Markdown
opt.concealcursor = "" -- Show concealed text outside insert mode

opt.virtualedit = "block" -- Allow cursor beyond end of line in block mode
opt.smoothscroll = true -- Smooth scrolling (if terminal supports it)

-- Characters used to draw UI elements
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " "
}

-- Uncomment to show invisible characters
-- opt.list = true
-- opt.listchars = {
--   tab = "→ ",
--   eol = "↲",
--   nbsp = "␣",
--   lead = "␣",
--   space = "␣",
--   trail = "•",
--   extends = "⟩",
--   precedes = "⟨"
-- }

-- -----------------------------------------------------------------------------
-- Formatting and external tools
-- -----------------------------------------------------------------------------

-- Behavior for automatic formatting
opt.formatoptions = "jcroqlnt"

-- Use ripgrep for :grep commands
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- -----------------------------------------------------------------------------
-- Code folding
-- -----------------------------------------------------------------------------

opt.foldlevel = 99 -- Default fold level
opt.foldlevelstart = 99 -- Fold level when opening a file
opt.foldmethod = "expr" -- Use expression to determine folds
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding
opt.foldtext = "" -- Use default fold line display

-- -----------------------------------------------------------------------------
-- Markdown settings
-- -----------------------------------------------------------------------------

-- Disable aggressive default Markdown syntax rules
vim.g.markdown_recommended_style = 0

-- -----------------------------------------------------------------------------
-- VSCode integration
-- -----------------------------------------------------------------------------

if vim.g.vscode then
  opt.showmode = true -- Show mode in VSCode where statusline may not
else
  opt.showmode = false -- Hide mode indicator (statusline will show it)
end

opt.errorbells = false -- Disable error beeps
