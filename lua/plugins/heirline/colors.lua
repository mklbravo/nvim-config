local utils = require("heirline.utils")

local color_names = {
  "primary",
  "secondary",
  "accent",
  "accent_alt",
  "success",
  "warning",
  "error",
  "info",
  "hint",
  "modified",
  "readonly",
  "text",
  "text_muted",
  "statusline_foreground",
  "statusline_background",
  "surface",
  "surface_alt",
  "surface_emphasis",
  "tabline_background",
  "ruler_foreground",
  "ruler_background",
  "mode_normal",
  "mode_insert",
  "mode_visual",
  "mode_select",
  "mode_replace",
  "mode_command",
}

local M = {}

-- Components use semantic aliases so their intent remains clear across themes.
for _, name in ipairs(color_names) do
  M[name] = "heirline_" .. name
end

local function get_color(group, attribute, fallback)
  return utils.get_highlight(group)[attribute] or fallback
end

function M.setup()
  local normal_fg = get_color("Normal", "fg", 0xffffff)
  local normal_bg = get_color("Normal", "bg", 0x000000)
  local statusline_fg = get_color("StatusLine", "fg", normal_fg)
  local statusline_bg = get_color("StatusLine", "bg", normal_bg)
  local text_muted = get_color("Comment", "fg", statusline_fg)
  local surface = get_color("CursorLine", "bg", statusline_bg)
  local surface_alt = get_color("Visual", "bg", surface)
  local surface_emphasis = get_color("Folded", "bg", surface_alt)

  local primary = get_color("Function", "fg", normal_fg)
  local secondary = get_color("Statement", "fg", primary)
  local accent = get_color("Special", "fg", primary)
  local accent_alt = get_color("Constant", "fg", accent)
  local success = get_color("String", "fg", normal_fg)
  local warning = get_color("DiagnosticWarn", "fg", accent_alt)
  local error = get_color("DiagnosticError", "fg", normal_fg)
  local info = get_color("DiagnosticInfo", "fg", accent)
  local hint = get_color("DiagnosticHint", "fg", info)

  return {
    heirline_primary = primary,
    heirline_secondary = secondary,
    heirline_accent = accent,
    heirline_accent_alt = accent_alt,
    heirline_success = success,
    heirline_warning = warning,
    heirline_error = error,
    heirline_info = info,
    heirline_hint = hint,
    heirline_modified = get_color("Directory", "fg", primary),
    heirline_readonly = error,
    heirline_text = normal_fg,
    heirline_text_muted = text_muted,
    heirline_statusline_foreground = statusline_fg,
    heirline_statusline_background = statusline_bg,
    heirline_surface = surface,
    heirline_surface_alt = surface_alt,
    heirline_surface_emphasis = surface_emphasis,
    heirline_tabline_background = get_color("TabLineFill", "bg", statusline_bg),
    heirline_ruler_foreground = surface,
    heirline_ruler_background = hint,
    heirline_mode_normal = primary,
    heirline_mode_insert = success,
    heirline_mode_visual = warning,
    heirline_mode_select = error,
    heirline_mode_replace = error,
    heirline_mode_command = info,
  }
end

return M
