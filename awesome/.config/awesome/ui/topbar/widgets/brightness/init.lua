local awful = require("awful")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local controller = require("ui.topbar.widgets.brightness.controller")

local brightness_widget = wutils.topbar_status_widget()

brightness_widget.change_icon("󰃠", beautiful.brightness_color)

brightness_widget.widget:buttons(awful.util.table.join(
  awful.button({}, 4, function()
    controller.inc()
  end),
  awful.button({}, 5, function()
    controller.dec()
  end)
))

controller.on_update(function(value)
  local brightness = 0
  if value then
    brightness = math.floor(value)
  end

  brightness_widget.change_text(brightness .. "%", beautiful.brightness_color)
end)

controller.update()

return brightness_widget.widget
