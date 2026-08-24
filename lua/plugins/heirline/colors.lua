local utils = require("heirline.utils")

local color_names = {
  "rosewater",
  "flamingo",
  "pink",
  "mauve",
  "red",
  "maroon",
  "peach",
  "yellow",
  "green",
  "teal",
  "sky",
  "sapphire",
  "blue",
  "lavender",
  "text",
  "subtext1",
  "subtext0",
  "overlay2",
  "overlay1",
  "overlay0",
  "surface2",
  "surface1",
  "surface0",
  "base",
  "mantle",
  "crust",
  "fg",
  "bg",
  "orange",
  "cyan",
  "grey",
  "grey_dark",
}

local M = {}

-- Components use aliases so Heirline can update their values after a theme change.
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
  local comment_fg = get_color("Comment", "fg", statusline_fg)
  local cursorline_bg = get_color("CursorLine", "bg", statusline_bg)
  local visual_bg = get_color("Visual", "bg", cursorline_bg)
  local folded_bg = get_color("Folded", "bg", visual_bg)
  local tabline_bg = get_color("TabLineFill", "bg", statusline_bg)

  local red = get_color("DiagnosticError", "fg", normal_fg)
  local yellow = get_color("DiagnosticWarn", "fg", normal_fg)
  local blue = get_color("Function", "fg", normal_fg)
  local cyan = get_color("DiagnosticInfo", "fg", normal_fg)
  local green = get_color("String", "fg", normal_fg)
  local teal = get_color("DiagnosticHint", "fg", cyan)
  local sky = get_color("Special", "fg", cyan)
  local peach = get_color("Constant", "fg", yellow)
  local lavender = get_color("Statement", "fg", blue)

  return {
    heirline_rosewater = sky,
    heirline_flamingo = red,
    heirline_pink = lavender,
    heirline_mauve = lavender,
    heirline_red = red,
    heirline_maroon = red,
    heirline_peach = peach,
    heirline_yellow = yellow,
    heirline_green = green,
    heirline_teal = teal,
    heirline_sky = sky,
    heirline_sapphire = get_color("Directory", "fg", blue),
    heirline_blue = blue,
    heirline_lavender = lavender,
    heirline_text = normal_fg,
    heirline_subtext1 = statusline_fg,
    heirline_subtext0 = comment_fg,
    heirline_overlay2 = statusline_fg,
    heirline_overlay1 = comment_fg,
    heirline_overlay0 = comment_fg,
    heirline_surface2 = folded_bg,
    heirline_surface1 = visual_bg,
    heirline_surface0 = cursorline_bg,
    heirline_base = normal_bg,
    heirline_mantle = statusline_bg,
    heirline_crust = tabline_bg,
    heirline_fg = statusline_fg,
    heirline_bg = statusline_bg,
    heirline_orange = peach,
    heirline_cyan = cyan,
    heirline_grey = cursorline_bg,
    heirline_grey_dark = visual_bg,
  }
end

return M
