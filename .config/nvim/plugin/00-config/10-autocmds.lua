-- Autocmds define editor behavior in response to events (e.g., file open, window focus).
if vim.g.vscode then return end

-- This file uses autocommand groups to organize and avoid conflicts.
local function augroup(name)
  return vim.api.nvim_create_augroup("Eviluci_" .. name, {
    clear = true
  })
end

-- Briefly highlight text when yanked (copied), to confirm the action.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  desc = "Highlight text on yank",
  callback = function() vim.highlight.on_yank() end
})

-- Disable conceal in text, markdown, and JSON files.
-- Conceal hides syntax markers (e.g., `` in Markdown), but sometimes it's useful to see them.
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("conceal"),
  pattern = {
    "markdown",
    "json",
    "jsonc",
    "json5"
  },
  callback = function() vim.opt_local.conceallevel = 0 end,
  desc = "Disable conceal in Markdown and JSON files"
})

-- Enable wrapping and spell check for text-based file types.
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = {
    "text",
    "plaintex",
    "typst",
    "gitcommit",
    "markdown"
  },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
  desc = "Enable wrap and spell for text file types"
})

-- Disable diagnostics in node_modules directories.
-- These files are usually third-party and don't need linting or error checks.
vim.api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
  group = augroup("diagnostics"),
  pattern = "*/node_modules/*",
  callback = function()
    vim.diagnostic.disable(0) -- 0 = current buffer
  end,
  desc = "Disable diagnostics in node_modules"
})

-- Automatically create parent directories when saving a new file.
-- Useful when editing paths like `src/components/NewPage/index.lua`.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("auto_create_dir"),
  callback = function(event)
    -- Skip if path is a protocol (e.g., git:, fzf:)
    if event.match:match("^%w%w+:[\\/][\\/]") then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    local dir = vim.fn.fnamemodify(file, ":p:h") -- parent directory
    vim.fn.mkdir(dir, "p") -- create recursively
  end,
  desc = "Auto-create parent directories before saving"
})

-- Restore cursorline only in active windows.
-- This makes it clear which window is focused when multiple splits are open.
--
-- When entering Insert mode, cursorline is disabled (by some plugins or settings).
-- On leaving Insert mode or entering a window, we re-enable it.
vim.api.nvim_create_autocmd({
  "InsertLeave",
  "WinEnter"
}, {
  group = augroup("cursorline"),
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
  desc = "Re-enable cursorline in active window"
})

-- Resize windows evenly when the terminal is resized.
-- Ensures splits remain balanced after resizing the terminal window.
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =") -- equalize window sizes
    vim.cmd("tabnext " .. current_tab) -- return to current tab
  end,
  desc = "Resize splits evenly after window resize"
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_position"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
  desc = "Return to last edit position on file open"
})

-- Check for file changes when Neovim regains focus or after terminal activity.
-- Prevents working on outdated buffers if the file was changed externally.
vim.api.nvim_create_autocmd({
  "FocusGained",
  "TermClose",
  "TermLeave"
}, {
  group = augroup("checktime"),
  callback = function() if vim.o.buftype == "" or vim.o.buftype == "acwrite" then vim.cmd("checktime") end end,
  desc = "Check for file changes on focus gain or terminal exit"
})
