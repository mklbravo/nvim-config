--[[
 ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 ┃  .      .      *           .       .          .                ╻   ╻   ┏┳┓     ┃
 ┃                 .       .   . *                                ┃   ┃   ┃┃┃     ┃
 ┃  .       ____     .      . .            .                    ┗━┛   ╹   ╹ ╹     ┃
 ┃         >>         .        .               .              Jon Arrien - v1.5   ┃
 ┃ .   .  /WWWI; \  .       .    .  ____               .       *  .     .         ┃
 ┃  *    /WWWWII; \=====;    .     /WI; \   *    .        /\_             .       ┃
 ┃  .   /WWWWWII;..      \_  . ___/WI;:. \     .        _/M; \    .   .         . ┃
 ┃     /WWWWWIIIIi;..      \__/WWWIIII:.. \____ .   .  /MMI;  \   * .             ┃
 ┃ . _/WWWWWIIIi;;;:...:   ;\WWWWWWIIIII;.     \     /MMWII;   \    .  .     .    ┃
 ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--]]


local jit = require("jit")

-----------------------------------------------------------
-- General settings
-----------------------------------------------------------
vim.g.mapleader = ','      -- Leader key
vim.g.maplocalleader = ' ' -- Local leader key

-- Shell settings
vim.opt.shell = (jit.arch == 'arm64' and '/opt/homebrew/bin/zsh' or '/usr/local/bin/zsh')

----------------------------------------------------------
-- Environment variables
-----------------------------------------------------------
vim.env.LANG = 'en_US.UTF-8'
-- vim.env.NVIM_LISTEN_ADDRESS = vim.api.nvim_eval('v:servername')

-----------------------------------------------------------
-- System
-----------------------------------------------------------
vim.o.clipboard = 'unnamedplus' -- copy/paste to system clipboard
vim.o.swapfile = false          -- disable swapfile

-- Disable builtin plugins
-- vim.g.loaded_gzip = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-----------------------------------------------------------
-- GUI
-----------------------------------------------------------

vim.o.termguicolors = true
vim.o.mouse = 'a'            -- enable trackpad/mouse selection
vim.o.laststatus = 3         -- statusline always and ONLY in the last window
vim.o.linespace = 0          -- Space between lines (works in neovide)
vim.o.cmdheight = 0          -- Limit to 1 line
vim.o.cmdwinheight = 10      -- Limit command line window (default 7)
vim.o.relativenumber = false -- enables relative number
vim.o.number = true          -- show line number
vim.o.numberwidth = 4        -- Minimal number of columns
vim.o.showmatch = true       -- highlight matching parenthesis/brackets
vim.o.showmode = false       -- Remove --INSERT-- from command line
vim.o.colorcolumn = '0'      -- line lenght marker at 80 columns
vim.o.cursorline = true      -- Highlights cursor line
vim.o.joinspaces = false     -- No extra space when joining a line
vim.o.showtabline = 2        -- Always shows tabs
vim.o.wrap = false           -- Wrap long lines by default
vim.o.signcolumn = 'yes:1'   -- Always show the sign column with one char width
vim.o.showcmd = true         -- Show commands as you type them (???)
vim.o.conceallevel = 2       -- To see `` in markdown files
vim.o.concealcursor = 'v'    -- Show conceal in current line
vim.o.matchtime = 2          -- How many tenths of a second to blink when matching brackets
vim.o.virtualedit = 'block'  -- To be able to select/paste EOL in visual block mode
vim.o.regexpengine = 1       -- Smooth scrolling for VimR

-----------------------------------------------------------
-- Neovide
-----------------------------------------------------------
if vim.g.neovide then
  vim.o.guifont                               = "MesloLGS NF:h14:#e-subpixelantialias"
  vim.g.neovide_confirm_quit                  = 1
  vim.g.neovide_cursor_animate_command_line   = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animation_length       = 0.01
  vim.g.neovide_cursor_antialiasing           = true
  vim.g.neovide_cursor_trail_size             = 0.4
  vim.g.neovide_cursor_vfx_mode               = "sonicboom"
  vim.g.neovide_floating_blur                 = 2.0
  vim.g.neovide_floating_blur_amount_x        = 20.0
  vim.g.neovide_floating_blur_amount_y        = 2.0
  vim.g.neovide_hide_mouse_when_typing        = true
  vim.g.neovide_input_macos_alt_is_meta       = false
  vim.g.neovide_input_use_logo                = true
  vim.g.neovide_no_idle                       = true
  vim.g.neovide_padding_bottom                = 0
  vim.g.neovide_padding_left                  = 0
  vim.g.neovide_padding_right                 = 0
  vim.g.neovide_padding_top                   = 0
  vim.g.neovide_refresh_rate                  = 60
  vim.g.neovide_remember_window_size          = true
  vim.g.neovide_scale_factor                  = 1.0
  vim.g.neovide_scroll_animation_length       = 0.2
  vim.g.neovide_transparency                  = 1.00
  vim.g.neovide_window_floating_blur          = 2.0
  vim.g.neovide_window_floating_opacity       = 2.0
  -- vim.g.neovide_fullscreen                    = false
end

-----------------------------------------------------------
-- Search settings
-----------------------------------------------------------
vim.o.ignorecase  = true -- ignore case letters when search
vim.o.smartcase   = true -- Make search case sensitive only if it contains uppercase letters
vim.o.wrapscan    = true -- Search again from top when reached the bottom
vim.o.hlsearch    = true -- Don't highlight after search
vim.o.linebreak   = true -- wrap on word boundary

-----------------------------------------------------------
-- Split settings
-----------------------------------------------------------
vim.o.splitright  = true      -- vertical split to the right
vim.o.splitbelow  = true      -- orizontal split to the bottom
vim.o.switchbuf   = "uselast" -- Uses last pane to render the selected entry in quickfix
vim.o.splitkeep   = "screen"  -- Keep the text in the same screen line

-----------------------------------------------------------
-- Performance
-----------------------------------------------------------
vim.o.hidden      = true  -- Enables to switch between unsaved buffers and keep undo history
vim.o.history     = 1000  -- Store lots of :cmdline history
vim.o.lazyredraw  = false -- Don't redraw while executing macros (better performance)
vim.o.synmaxcol   = 1000  -- Show syntax highlight properly in iMac !!!
vim.o.backup      = false -- a
vim.o.writebackup = false -- a


if vim.fn.executable('rg') > 0 then
  vim.o.grepprg = "rg --hidden --glob '!.git' --no-heading --smart-case --vimgrep --follow $*"
  vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" } -- file:line:column:messages
elseif vim.fn.executable('ag') then
  vim.o.grepprg = "ag --nogroup --nocolor --vimgrep"
  vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" } -- file:line:column:messages
end

-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------

vim.g.editorconfig = true -- EditorConfig support
vim.o.autoindent = true   -- copy indent from current line when starting a new line
vim.o.breakindent = true  -- Wrap indent to match  line start
vim.o.expandtab = true    -- use spaces instead of tabs
vim.o.shiftwidth = 4      -- shift 2 spaces when tab
vim.o.tabstop = 4         -- 1 tab == 2 spaces
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smarttab = true       -- Inserts blanks according to shiftwidth, tabstop or softtabstop.
vim.o.smartindent = true    -- Do smart autoindenting when starting a new line.
vim.o.startofline = false   -- Prevent cursor from moving to beginning of line
vim.o.textwidth = 80        -- Disable max width (only used for markdown)
vim.o.wrapmargin = 0        -- Wrap without margins
vim.o.formatoptions = "cqj" -- Auto format comments or using with 'gq'
-- Why does it show "jql" or "jtql" ???
-- t  Auto-wrap text using 'textwidth'
-- c  Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
-- j  Remove a comment leader when joining lines.
-- l  Long lines are not broken in insert mode: When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
-- q  Allow formatting of comments with "gq".

-----------------------------------------------------------
-- Diff: show context lines in diffs
-----------------------------------------------------------
vim.opt.diffopt:append('internal')   -- Internal diff library
vim.opt.diffopt:append('filler')     -- Show empty lines to fill gaps
vim.opt.diffopt:append('context:10') -- Show 10 lines around changes

-- enable linematch diff algorithm
if vim.fn.has "nvim-0.9" == 1 then
  vim.opt.diffopt:append("linematch:60")
end

-----------------------------------------------------------
-- Enable white characters (listchars)
-----------------------------------------------------------
vim.o.list = true
vim.opt.listchars = {
  eol      = " ", -- ⏎/¬
  space    = " ", -- ⋅⋅⋅
  extends  = "", -- ❯
  precedes = "", -- ❮ ▏
  tab      = " ", -- ␣
  trail    = "·", -- ␣
  nbsp     = "·",
}
vim.o.showbreak = '▏ ' -- '↪ '

-- vim.o.showbreak = '⣿⣿ '

-----------------------------------------------------------
-- Folding (market/indent)
-----------------------------------------------------------
--   horiz = '━',
--   horizup = '┻',
--   horizdown = '┳',
--   vert = '┃',
--   vertleft = '┫',
--   vertright = '┣',
--   verthoriz = '╋',
-----------------------------------------------------------

vim.opt.fillchars = {
  wbr = " ", -- ░ ▂
  horiz = "-",
  horizup = "┴",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  fold = " ",
  eob = " ",  -- suppress ~ at EndOfBuffer
  diff = " ", -- alter natives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldclose = "▸",
  foldopen = "▾",
  foldsep = "",
}

vim.o.foldcolumn = "0"    -- Don't show foldings (or auto:2)
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldmethod = 'expr' -- Fold method
vim.o.foldlevel = 99      -- (ufo)
vim.o.foldlevelstart = 99 -- (ufo)
vim.o.foldenable = true   -- Enable folding
vim.o.foldminlines = 0    -- Fold everything
vim.o.foldnestmax = 10    -- Deepest fold

-----------------------------------------------------------
-- Timings
-----------------------------------------------------------
vim.o.timeout = true   -- Quick you must be
vim.o.timeoutlen = 150 -- By default is 1000 ms (added for whichkey)
vim.o.ttimeout = false -- TUI timeout
vim.o.ttimeoutlen = 50 -- TUI timeout milliseconds
vim.o.updatetime = 300 -- Time used to create a swap file or other things

-----------------------------------------------------------
-- Persistent undo - keep undo history per file
-----------------------------------------------------------

if vim.fn.has('persistent_undo') then
  local undo_path = '/tmp/.vim-undo'
  if not vim.fn.isdirectory(undo_path) then
    -- vim.fn.call('mkdir("/tmp/.vim-undo-dir", "p", 0700)')
    -- local backups = Path:new(vim.fn.stdpath('data'), 'backups')
    vim.api.nvim_exec2("silent !mkdir " .. undo_path .. " /dev/null 2>&1")
  end
  vim.o.undodir = undo_path
  vim.o.undolevels = 1000  -- How many undos
  vim.o.undoreload = 10000 -- number of lines to save for undo
  vim.o.undofile = true
end

-----------------------------------------------------------
-- Session
-----------------------------------------------------------

vim.o.autowrite = true
vim.opt.sessionoptions:append('blank')
vim.opt.sessionoptions:append('buffers')
vim.opt.sessionoptions:append('curdir')
vim.opt.sessionoptions:append('globals')
vim.opt.sessionoptions:append('help')
vim.opt.sessionoptions:append('tabpages')
vim.opt.sessionoptions:append('winsize')
vim.opt.sessionoptions:append('winpos')
vim.opt.sessionoptions:append('folds')
-- vim.opt.sessionoptions:append('terminal')

-----------------------------------------------------------
-- Shada file (Shared Data)
-----------------------------------------------------------
-- Unix: "$XDG_STATE_HOME/nvim/shada/main.shada"
-- Windows: "$XDG_STATE_HOME/nvim-data/shada/main.shada"
-- vim.o.shadafile = "~/.local/state/nvim/shada/main.shada"
-- vim.o.shadafile = "$HOME/.local/state/nvim/shada/main.shada"
-- vim.o.shadafile = "1000,n~/.local/state/nvim/shada/main.shada"

-- Also known as `viminfo`. Keep marks, registers, commands and other
-- features accross sessions (not project sepcific).
vim.o.shada = "!,'50,\"1000,<50,s10,h"

-----------------------------------------------------------
-- Scrolling
-----------------------------------------------------------
vim.o.scrollback = 100000 -- Max lines beyond visible screen
vim.o.scrolloff = 3       --  Start scrolling when we're 5 lines away from margins
vim.o.sidescrolloff = 0   --  Keep it zero for floaterm
vim.o.sidescroll = 0      --  Keep it zero for floaterm

-----------------------------------------------------------
-- Spell language
-----------------------------------------------------------
-- set spelllang=fr

vim.opt.dictionary:append('~/.config/nvim/dict/en_US.dic')
vim.opt.dictionary:append('~/.config/nvim/dict/de.dic')
vim.opt.dictionary:append('~/.config/nvim/dict/es.dic')
vim.opt.dictionary:append('~/.config/nvim/dict/eu.dic')
-- vim.o.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
vim.o.spellsuggest = 'fast,20'

vim.opt.spelllang = { 'en_us' } -- Set language to US english
vim.o.spell = false             -- Disable checking by default
-- vim.o.spellfile = '~/.config/nvim/dictionary.utf-8.add'

-- Delete default colors
-- rm /opt/homebrew/Cellar/neovim/0.9.1/share/nvim/runtime/colors/*.vim

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- disable builtins plugins
local disabled_built_ins = {
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin",
  "vimball", "vimballPlugin",
  "2html_plugin", "logipat", "rrhelper", "spellfile_plugin", "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
  vim.g["loaded_" .. plugin .. "_plugin"] = 1
end

-----------------------------------------------------------
-- Abbreviations
-----------------------------------------------------------

-- vim.cmd([[iabbrev teh the]])
-- <cr>Jon Arrien<cr>jonarrien@gmail]]
-- vim.cmd([[iabbrev ssigg)
-- <cr>Jon Arrien<cr>jon.arrien@kashing.co.uk]]
-- vim.cmd([[iabbrev ssigk)
-- <cr>Jon Arrien<cr>jon.arrien@whitebox-services.eu]]
-- vim.cmd([[iabbrev ssigw)
-- vim.cmd([[iabbr ture true]])
-- vim.cmd([[iabbr flase false]])
