local M = {}

local config = require("language.config")
local manager = require("language.manager")

local available_languages = config.get_available_languages()
local buffer = nil

local function generate_display_lines()
  local selection_lines = {}

  for _, language in ipairs(available_languages) do
    local prefix = config.is_language_enabled(language) and "[x] " or "[ ] "
    table.insert(selection_lines, prefix .. language)
  end
  return selection_lines
end

local function set_buffer_keymaps()
  if not buffer then
    return
  end

  -- Toggle select on `ENTER`
  vim.api.nvim_buf_set_keymap(
    buffer,
    "n",
    "<CR>",
    ':lua require("language.ui").toggle_select()<CR>',
    { noremap = true, silent = true }
  )

  -- Close the buffer on `q`
  vim.api.nvim_buf_set_keymap(buffer, "n", "q", ":bd!<CR>", { noremap = true, silent = true })
end

local function render()
  local display_lines = generate_display_lines()

  -- Create a new buffer
  buffer = vim.api.nvim_create_buf(false, true)

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, display_lines)

  vim.api.nvim_buf_set_option(buffer, "modifiable", false)
  vim.api.nvim_buf_set_option(buffer, "readonly", true)

  -- Create the floating window
  local width = 30
  local height = #display_lines
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = "minimal",
    border = "rounded",
  }

  vim.api.nvim_open_win(buffer, true, opts)

  set_buffer_keymaps()
end

function M.open()
  render()
end

function M.toggle_select()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  local selected_language = available_languages[cursor_position[1]]

  if config.is_language_enabled(selected_language) then
    config.disable_language(selected_language)
  else
    config.enable_language(selected_language)
    -- TODO: Test This
    -- manager.apply_language_configuration(selected_language)
  end

  local display_lines = generate_display_lines()
  -- Temporarily make the buffer modifiable to update it
  vim.api.nvim_buf_set_option(buffer, "modifiable", true)
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, display_lines)
  vim.api.nvim_buf_set_option(buffer, "modifiable", false)
end

return M
