-- Core Neovim settings.
if vim.g.vscode then return end

-- This file configures editor behavior including indentation, UI, search, and file handling.
local o = vim.o
local g = vim.g
local opt = vim.opt

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

o.expandtab = true -- Use spaces instead of tabs
o.tabstop = indent -- Number of spaces a tab counts for
o.shiftwidth = indent -- Number of spaces for each indentation step
o.softtabstop = indent -- Backspace treats spaces like tabs
o.shiftround = true -- Round indent to nearest shiftwidth
o.smartindent = true -- Enable smart auto-indenting for code
o.smarttab = true -- Use shiftwidth for tab in insert mode

-- -----------------------------------------------------------------------------
-- Line numbers and cursor display
-- -----------------------------------------------------------------------------

o.number = true -- Show absolute line numbers
o.relativenumber = true -- Show line numbers relative to cursor

-- -----------------------------------------------------------------------------
-- Search and completion
-- -----------------------------------------------------------------------------

o.ignorecase = true -- Case-insensitive search
o.smartcase = true -- Case-sensitive if search contains uppercase
o.incsearch = true -- Highlight matches as you type
o.inccommand = "nosplit" -- Preview substitutions live

o.confirm = true -- Prompt before exiting with unsaved changes
o.wildmode = "longest:full,full" -- Command-line completion style
opt.wildignore:append("*/node_modules/*") -- Ignore in file completion

-- Completion menu behavior
opt.completeopt = {
  "menuone",
  "noselect",
  "popup",
  "fuzzy",
  "preview"
}

-- -----------------------------------------------------------------------------
-- File and buffer settings
-- -----------------------------------------------------------------------------

o.autowrite = true -- Save file when switching buffers
o.swapfile = false -- Disable swap files
o.backup = false -- Disable backup files
o.writebackup = false -- Disable backup before write

o.undofile = true -- Enable persistent undo
o.undolevels = 10000 -- Number of undo levels

o.updatetime = 200 -- Interval for saving swap/undo and CursorHold events
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
-- Input, Behavior and command-line
-- -----------------------------------------------------------------------------

-- Timeout for keymap sequences (longer in VSCode to avoid conflicts)
o.timeoutlen = vim.g.vscode and 1000 or 300

o.mouse = "a" -- Enable mouse in all modes
o.backspace = "indent,eol,start" -- Backspace works in insert mode
opt.iskeyword:append("-") -- Treat dash as part of a word
opt.path:append("**") -- Search in subdirectories with commands like :find

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

o.wrap = true -- Wrap long lines
o.linebreak = true -- Break lines at appropriate characters
o.breakindent = true -- Indent wrapped lines to match original

-- -----------------------------------------------------------------------------
-- Window and split behavior
-- -----------------------------------------------------------------------------

o.splitbelow = true -- New horizontal splits open below
o.splitright = true -- New vertical splits open to the right
o.splitkeep = "screen" -- Keep view stable when loading new content

o.scrolloff = 8 -- Keep at least 8 lines around cursor
o.sidescrolloff = 8
o.winminwidth = 5 -- Minimum window width

-- -----------------------------------------------------------------------------
-- User interface
-- -----------------------------------------------------------------------------

o.cursorline = true -- Highlight current line
o.signcolumn = "yes:2" -- Always show sign column (2 char width)
o.pumheight = 10 -- Limit height of completion menu
o.cmdheight = 1 -- Command line height
o.showmode = true -- Show mode in VSCode where statusline may not

o.showtabline = 1 -- Show tabline (0=never, 1=when multiple tabs, 2=always)
o.winborder = "rounded" -- Rounded borders for windows and popups

o.conceallevel = 2 -- Hide markup in files like Markdown
o.concealcursor = "" -- Show concealed text outside insert mode

o.virtualedit = "block" -- Allow cursor beyond end of line in block mode
o.smoothscroll = true -- Smooth scrolling (if terminal supports it)

o.lazyredraw = true -- Don't redraw while executing macros. Faster scrolling

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
o.formatoptions = "jcroqlnt"

-- Use ripgrep for :grep commands
o.grepprg = "rg --vimgrep"
o.grepformat = "%f:%l:%c:%m"

-- -----------------------------------------------------------------------------
-- Code folding
-- -----------------------------------------------------------------------------

o.foldenable = true -- Enable code folding
o.foldlevel = 99 -- Default fold level
o.foldlevelstart = 99 -- Fold level when opening a file
o.foldmethod = "expr" -- Use expression to determine folds
o.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding
o.foldtext = "" -- Use default fold line display

-- -----------------------------------------------------------------------------
-- Markdown settings
-- -----------------------------------------------------------------------------

-- Disable aggressive default Markdown syntax rules
vim.g.markdown_recommended_style = 0

-- -----------------------------------------------------------------------------
-- Misc
-- -----------------------------------------------------------------------------

o.errorbells = false -- Disable error beeps
