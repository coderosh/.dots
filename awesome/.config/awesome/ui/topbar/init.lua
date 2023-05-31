local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

local widgets = require("ui.topbar.widgets")

local function topbar(s)
  local taskbar = awful.wibar({
    position = "top",
    screen = s,
    bg = beautiful.bg_normal,
    height = dpi(38),
  })

  taskbar:setup({
    widget = wibox.container.margin,
    top = dpi(5),
    bottom = dpi(5),
    left = dpi(10),
    right = dpi(10),
    {
      layout = wibox.layout.align.horizontal,
      widgets.left_widgets(s),
      widgets.middle_widgets(s),
      widgets.right_widgets(s),
    },
  })
end

return topbar
