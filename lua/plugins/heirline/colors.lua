-- Get catppuccin palette colors
local ok, clrs = pcall(require, "catppuccin.palettes")
if not ok then
  -- Fallback if catppuccin is not loaded
  return {
    -- Accent colors
    rosewater = "#F5E0DC",
    flamingo = "#F2CDCD",
    pink = "#F5C2E7",
    mauve = "#CBA6F7",
    red = "#F38BA8",
    maroon = "#EBA0AC",
    peach = "#FAB387",
    yellow = "#F9E2AF",
    green = "#A6E3A1",
    teal = "#94E2D5",
    sky = "#89DCEB",
    sapphire = "#74C7EC",
    blue = "#89B4FA",
    lavender = "#B4BEFE",
    -- Text colors
    text = "#CDD6F4",
    subtext1 = "#BAC2DE",
    subtext0 = "#A6ADC8",
    -- Overlay colors
    overlay2 = "#9399B2",
    overlay1 = "#7F849C",
    overlay0 = "#6C7086",
    -- Surface colors
    surface2 = "#585B70",
    surface1 = "#45475A",
    surface0 = "#313244",
    -- Base colors
    base = "#1E1E2E",
    mantle = "#181825",
    crust = "#11111B",
  }
end

local palette = clrs.get_palette()

return {
  -- Accent colors
  rosewater = palette.rosewater,
  flamingo = palette.flamingo,
  pink = palette.pink,
  mauve = palette.mauve,
  red = palette.red,
  maroon = palette.maroon,
  peach = palette.peach,
  yellow = palette.yellow,
  green = palette.green,
  teal = palette.teal,
  sky = palette.sky,
  sapphire = palette.sapphire,
  blue = palette.blue,
  lavender = palette.lavender,
  -- Text colors
  text = palette.text,
  subtext1 = palette.subtext1,
  subtext0 = palette.subtext0,
  -- Overlay colors
  overlay2 = palette.overlay2,
  overlay1 = palette.overlay1,
  overlay0 = palette.overlay0,
  -- Surface colors
  surface2 = palette.surface2,
  surface1 = palette.surface1,
  surface0 = palette.surface0,
  -- Base colors
  base = palette.base,
  mantle = palette.mantle,
  crust = palette.crust,
  -- Semantic aliases for convenience
  fg = palette.text,
  bg = palette.base,
  orange = palette.peach,
  cyan = palette.sky,
  grey = palette.surface0,
  grey_dark = palette.surface1,
}
