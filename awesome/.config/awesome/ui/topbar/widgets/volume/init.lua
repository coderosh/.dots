local awful = require("awful")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local controller = require("ui.topbar.widgets.volume.controller")

local icons = {
  muted = "󰖁",
  full = "󰕾",
}

local volume_widget = wutils.topbar_status_widget()

volume_widget.widget:buttons(awful.util.table.join(
  awful.button({}, 3, function()
    controller.toggle_mute()
  end),
  awful.button({}, 4, function()
    controller.inc()
  end),
  awful.button({}, 5, function()
    controller.dec()
  end)
))

controller.on_update(function(status)
  if status.is_muted then
    volume_widget.change_icon(icons.muted, beautiful.vol_mute_color)
  else
    volume_widget.change_icon(icons.full, beautiful.vol_color)
  end

  volume_widget.change_text(" " .. math.floor(status.percentage) .. "%")
end)

controller.update()

return volume_widget.widget
