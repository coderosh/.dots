local gears = require("gears")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local meminfo = require("ui.topbar.widgets.memory.meminfo")

local icon = "󰍛"

local memory_widget = wutils.topbar_status_widget()

meminfo.on_update(function(info)
  memory_widget.change_text(info, beautiful.mem_color)
  memory_widget.change_icon(icon, beautiful.mem_color)
end)

meminfo.update()

gears.timer({
  timeout = 5,
  call_now = true,
  autostart = true,
  callback = function()
    meminfo.update()
  end,
})

return memory_widget.widget
