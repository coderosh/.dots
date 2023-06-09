local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local controller = require("ui.topbar.widgets.volume.controller")

local icons = {
  muted = "󰖁",
  full = "󰕾"
}

local icon_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = icons.full,
  font = beautiful.icon_font,
})

local text_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = " ",
})

local brightness_widget = wibox.widget({
  icon_widget,
  text_widget,
  align = "center",
  widget = wibox.layout.align.horizontal,
})

brightness_widget:buttons(awful.util.table.join(
  awful.button({}, 4, function()
    controller.inc()
  end),
  awful.button({}, 5, function()
    controller.dec()
  end)
))

controller.on_update(function(status)
  if status.is_muted then
    icon_widget.markup = icons.muted
  else
    icon_widget.markup = icons.full
  end
  text_widget.markup = " " .. math.floor(status.percentage) .. "%"
end)

controller.update()

return brightness_widget
