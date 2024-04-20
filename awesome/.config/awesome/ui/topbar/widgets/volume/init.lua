local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local controller = require("ui.topbar.widgets.volume.controller")

local icons = {
  muted = "󰖁",
  full = "",
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
  local percentage_floor = 0

  if status.percentage then
    percentage_floor = math.floor(status.percentage)
  end

  if status.is_muted then
    volume_widget.change_icon(icons.muted, beautiful.vol_mute_color)
    volume_widget.change_text(percentage_floor .. "%", beautiful.vol_mute_color)
  else
    volume_widget.change_icon(icons.full, beautiful.vol_color)
    volume_widget.change_text(percentage_floor .. "%", beautiful.vol_color)
  end
end)

controller.update()

gears.timer({
  timeout = 4,
  call_now = true,
  autostart = true,
  callback = function()
    controller.update()
  end,
})

return volume_widget.widget
