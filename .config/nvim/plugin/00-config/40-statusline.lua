if vim.g.vscode then return end

local EvilStatusline = {}

-- Central storage for dynamic components
EvilStatusline.components = {
  left = {},
  right = {}
}

-- Register a component: name, position ('left' or 'right'), generator function
function EvilStatusline.register(name, position, generator)
  assert(position == 'left' or position == 'right', "position must be 'left' or 'right'")
  EvilStatusline.components[position][name] = generator
  vim.schedule(function() vim.cmd("redrawstatus") end)
end

-- Unregister a component
function EvilStatusline.unregister(name, position)
  EvilStatusline.components[position][name] = nil
  vim.schedule(function() vim.cmd("redrawstatus") end)
end

-- ========================================================================
-- Modular Highlight Groups based on Tokyonight Palette
-- ========================================================================
function EvilStatusline.setup_hl()
  local hl = vim.api.nvim_set_hl

  -- Base statusline
  hl(0, "StatusLine", {
    fg = '#24283b',
    bg = "none"
  })
  hl(0, "StatusLineNC", {
    fg = '#787c99',
    bg = "none"
  })

  -- Reusable color groups (for any module)
  hl(0, "EvilOrange", {
    fg = '#ff9e64'
  })
  hl(0, "EvilBlue", {
    fg = '#7aa2f7'
  })
  hl(0, "EvilPurple", {
    fg = '#bb9af7'
  })
  hl(0, "EvilCyan", {
    fg = '#73daca'
  })
  hl(0, "EvilRed", {
    fg = '#f7768e'
  })
  hl(0, "EvilYellow", {
    fg = '#e0af68'
  })
  hl(0, "EvilGreen", {
    fg = '#9ece6a'
  })
  hl(0, "EvilTeal", {
    fg = '#2ac3de'
  })
  hl(0, "EvilFg", {
    fg = '#c0caf5'
  })

  -- Optional: Bold variants
  hl(0, "EvilBlueBold", {
    fg = '#7aa2f7',
    bold = true
  })
  hl(0, "EvilTealBold", {
    fg = '#2ac3de',
    bold = true
  })
end

-- Helper function to apply highlight groups
function EvilStatusline.hl(group, text) return "%#" .. group .. "#" .. text .. "%*" end

-- ========================================================================
-- Git Branch (Improved: uses gitsigns OR fallback)
-- ========================================================================
function EvilStatusline.get_branch()
  -- Prefer gitsigns if available
  if vim.b.gitsigns_head then return EvilStatusline.hl("EvilOrange", " " .. vim.b.gitsigns_head) end

  -- Fallback: use cached git branch to avoid system calls
  local bufnr = vim.api.nvim_get_current_buf()
  EvilStatusline.git_cache = EvilStatusline.git_cache or {}

  -- Return cached value if it exists and isn't expired
  if EvilStatusline.git_cache[bufnr] and not EvilStatusline.git_cache[bufnr].expired then
    return EvilStatusline.git_cache[bufnr].value
  end

  -- Safe git branch detection
  local ok, result = pcall(function()
    local dir = vim.fn.expand("%:p:h")
    local cmd = string.format("git -C %s rev-parse --abbrev-ref HEAD 2>/dev/null", vim.fn.shellescape(dir))
    local handle = io.popen(cmd)
    if not handle then return nil end
    local branch = handle:read("*a")
    handle:close()
    return branch and branch:gsub("%s+", "") or nil
  end)

  local value = ok and result and result ~= "" and EvilStatusline.hl("EvilOrange", " " .. result) or ""

  EvilStatusline.git_cache[bufnr] = {
    value = value,
    expired = false
  }

  return value
end

-- Clear cache on GitSignsUpdate
vim.api.nvim_create_autocmd("User", {
  pattern = "GitSignsUpdate",
  callback = function()
    EvilStatusline.git_cache = {}
    vim.schedule(function() vim.cmd("redrawstatus") end)
  end
})

-- ========================================================================
-- File and flags (Modified, Readonly, etc.)
-- ========================================================================
function EvilStatusline.get_path()
  return EvilStatusline.hl("EvilFg", "󰈙 %<%f ") .. EvilStatusline.hl("EvilRed", "%m%r")
end

-- ========================================================================
-- File Size
-- ========================================================================
function EvilStatusline.get_size()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == "" then return "" end

  local size = vim.fn.getfsize(bufname)
  if size <= 0 then return "" end

  local function format_size(bytes)
    local units = {
      "B",
      "KB",
      "MB",
      "GB"
    }
    local unit = 1
    local b = bytes
    while b >= 1024 and unit < #units do
      b = b / 1024
      unit = unit + 1
    end
    return string.format("%.1f%s", b, units[unit])
  end

  return EvilStatusline.hl("EvilBlue", "[" .. format_size(size) .. "]")
end

-- ========================================================================
-- Location (Line, Col)
-- ========================================================================
function EvilStatusline.get_location() return EvilStatusline.hl("EvilPurple", "Ln: %l, Col: %c%V") end

-- ========================================================================
-- Progress (% of file)
-- ========================================================================
function EvilStatusline.get_progress() return EvilStatusline.hl("EvilCyan", "%P") end

-- ========================================================================
-- Filetype
-- ========================================================================

function EvilStatusline.get_filetype() return EvilStatusline.hl("EvilYellow", "%y%q") end

-- ========================================================================
-- LSP Clients
-- ========================================================================
function EvilStatusline.get_lsp()
  local ok, result = pcall(function()
    if not vim.lsp then return "" end
    local clients = vim.lsp.get_clients({
      bufnr = 0
    })
    if #clients == 0 then return "" end
    local names = {}
    for _, client in ipairs(clients) do table.insert(names, client.name) end
    return EvilStatusline.hl("EvilTealBold", " " .. table.concat(names, ","))
  end)
  return ok and result or ""
end

-- ========================================================================
-- Diagnostics
-- ========================================================================
function EvilStatusline.get_diagnostics()
  local ok, result = pcall(function()
    if not vim.diagnostic then return "" end

    local errors = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.ERROR
    })
    local warnings = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.WARN
    })
    local info = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.INFO
    })
    local hints = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.HINT
    })

    local parts = {}
    if errors > 0 then table.insert(parts, EvilStatusline.hl("EvilRed", " " .. errors)) end
    if warnings > 0 then table.insert(parts, EvilStatusline.hl("EvilYellow", " " .. warnings)) end
    if info > 0 then table.insert(parts, EvilStatusline.hl("EvilGreen", " " .. info)) end
    if hints > 0 then table.insert(parts, EvilStatusline.hl("EvilPurple", " " .. hints)) end

    return #parts > 0 and (" " .. table.concat(parts, " ")) or ""
  end)
  return ok and result or ""
end

-- ========================================================================
-- Build Final Statusline String
-- ========================================================================
function EvilStatusline.build()
  local ok, result = pcall(function()
    -- local buftype = vim.bo.buftype
    -- if buftype == "nofile" or buftype == "quickfix" or buftype == "help" then
    --   return "" -- Don't show statusline in special buffers
    -- end

    local left_parts = {
      EvilStatusline.get_branch(),
      EvilStatusline.get_size(),
      EvilStatusline.get_path()
    }

    -- Add registered left components
    for _, gen in pairs(EvilStatusline.components.left) do
      local val = gen()
      if val and val ~= "" then table.insert(left_parts, val) end
    end

    local right_parts = {
      EvilStatusline.get_filetype(),
      EvilStatusline.get_location(),
      EvilStatusline.get_progress(),
      EvilStatusline.get_diagnostics(),
      EvilStatusline.get_lsp()
    }

    -- Add registered right components
    for _, gen in pairs(EvilStatusline.components.right) do
      local val = gen()
      if val and val ~= "" then table.insert(right_parts, val) end
    end

    -- Filter out empty parts
    local filtered_left = {}
    for _, part in ipairs(left_parts) do if part and part ~= "" then table.insert(filtered_left, part) end end

    local filtered_right = {}
    for _, part in ipairs(right_parts) do if part and part ~= "" then table.insert(filtered_right, part) end end

    -- Combine both sides
    if #filtered_right > 0 then
      return table.concat(filtered_left, " ") .. " %=" .. table.concat(filtered_right, " ")
    else
      return table.concat(filtered_left, " ")
    end
  end)

  return ok and result or "Error in statusline"
end

-- ========================================================================
-- Setup: Called Once
-- ========================================================================
function EvilStatusline.setup()
  EvilStatusline.setup_hl()

  -- Enable global statusline (only one across all windows)
  vim.opt.laststatus = 3

  -- Use a local reference instead of polluting global namespace
  _G._evil_statusline_build = function() return EvilStatusline.build() end

  vim.opt.statusline = "%!v:lua._evil_statusline_build()"

  -- Create autocommand group
  local group = vim.api.nvim_create_augroup("EvilStatusline", {
    clear = true
  })

  -- Redraw when needed (with error handling)
  local safe_redraw = function() vim.schedule(function() pcall(vim.cmd, "redrawstatus") end) end

  vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWritePost",
    "BufDelete",
    "FileType",
    "ModeChanged",
    "CursorMoved",
    "CursorMovedI"
  }, {
    group = group,
    callback = safe_redraw
  })

  vim.api.nvim_create_autocmd("DiagnosticChanged", {
    group = group,
    callback = safe_redraw
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "GitSignsUpdate",
    group = group,
    callback = safe_redraw
  })

  -- Optional: Custom event for manual trigger
  vim.api.nvim_create_autocmd("User", {
    pattern = "StatuslineUpdate",
    group = group,
    callback = safe_redraw
  })
end

-- Run setup
EvilStatusline.setup()

-- Return the module for plugins to use
return EvilStatusline
