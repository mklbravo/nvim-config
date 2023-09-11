-- Global Variables {{{{
vim.g.mapleader = ','
vim.g.maplocalleader = ' '
vim.g.editorconfig = true   -- EditorConfig support
-- }}}}

-- Options {{{{
vim.o.mouse = 'a'   -- Enable trackpad/mouse selection
vim.o.number = true -- Show line numbers
vim.o.swapfile = false -- Disable swapfile
vim.o.termguicolors = true
vim.o.wrap = false  -- Don't wrap long lines
vim.o.fillchars='eob: ' -- Set space as eob(end of buffer) character

-- Split Settings {{{
vim.o.splitright = true -- Splitting a window will put the new window right
vim.o.splitbelow = true -- Splitting a window will put the new window below
-- }}}

-- Tabs {{{
vim.o.autoindent = true   -- Copy indent from current line when starting a new line
vim.o.expandtab = true    -- Use spaces instead of tabs
vim.o.shiftwidth = 2      -- MKL: Buscar que hace
vim.o.smartindent = true  -- Do smart autoindenting when starting a new line.
vim.o.tabstop = 2         -- Number of spaces that a <Tab> counts for
-- }}}

-- }}}}

