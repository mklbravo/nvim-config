-- Global Variables {{{{
vim.g.editorconfig = true -- EditorConfig support
vim.g.mapleader = ","
vim.g.maplocalleader = " "
-- }}}}

-- Options {{{{
vim.o.cursorline = true -- Highlight the text line of the cursor
vim.o.fillchars = "eob: " -- Set space as eob(end of buffer) character
vim.o.mouse = "a" -- Enable trackpad/mouse selection
vim.o.number = true -- Show line numbers
vim.o.swapfile = false -- Disable swapfile
vim.o.termguicolors = true
vim.o.wrap = false -- Don't wrap long lines

-- Split Settings {{{
vim.o.splitbelow = true -- Splitting a window will put the new window below
vim.o.splitright = true -- Splitting a window will put the new window right
-- }}}

-- Tabs {{{
vim.o.autoindent = true -- Copy indent from current line when starting a new line
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- MKL: Buscar que hace
vim.o.smartindent = true -- Do smart autoindenting when starting a new line.
vim.o.tabstop = 2 -- Number of spaces that a <Tab> counts for
-- }}}

-- Neovide specific settings {{{
if vim.g.neovide then
  vim.o.guifont = "MonaspiceAr NFM:11,FiraCode Nerd Font:h12"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
-- }}}

-- }}}}

-- Command for neovide remote {{{
vim.cmd("command! -nargs=0 SetRemoteConfig set guifont=MonaspiceAr\\ Nerd\\ Font\\ Mono:h12")
-- }}}
