-- ------------------------------------------------
-- General Neovim settings
-- ------------------------------------------------
vim.g.editorconfig = true -- EditorConfig support
vim.g.mapleader = "," -- Set global leader key to comma
vim.g.maplocalleader = " " -- Set local leader key to space

-- ------------------------------------------------
-- Options
-- ------------------------------------------------
vim.o.cursorline = true -- Highlight the text line of the cursor
vim.o.clipboard = "unnamedplus" -- Use system clipboard for all operations
vim.o.fillchars = "eob: " -- Set space as eob(end of buffer) character
vim.o.mouse = "a" -- Enable trackpad/mouse suppont in all modes
vim.o.number = true -- Show line numbers in the gutter
vim.o.swapfile = false -- Disable swapfile creation
vim.o.termguicolors = true -- Enable true color support in the terminal
vim.o.wrap = false -- Disable line wrapping

-- ------------------------------------------------
-- Split Window Behavior
-- ------------------------------------------------
vim.o.splitbelow = true -- New horizontal splits open below the current window
vim.o.splitright = true -- New vertical splits open to the right of the current window

-- ------------------------------------------------
-- Tab and Indentation Settings
-- ------------------------------------------------
vim.o.autoindent = true -- Automatically indent a new line to match the indentation of the previous line
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.o.smartindent = true -- Enable smart auto-indentation for new lines
vim.o.tabstop = 2 -- Number of spaces that a <Tab> character represents
-- }}}

-- ------------------------------------------------
-- Newovide Settings
-- ------------------------------------------------
if vim.g.neovide then
  vim.o.guifont = "MonaspiceAr NFM:11,FiraCode Nerd Font:h12"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end

-- Command for neovide remote
vim.cmd("command! -nargs=0 SetRemoteConfig set guifont=MonaspiceAr\\ Nerd\\ Font\\ Mono:h12")
