local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local controller = require("ui.topbar.widgets.brightness.controller")

local icon_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = "󰃠",
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

controller.on_update(function(value)
  text_widget.markup = " " .. math.floor(value) .. "%"
end)

controller.update()

return brightness_widget
