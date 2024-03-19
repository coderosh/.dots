local gears = require("gears")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local fsinfo = require("ui.topbar.widgets.fs.fsinfo")

local icon = ""

local fs_widget = wutils.topbar_status_widget()

fsinfo.on_update(function(info)
  local root = info["/"]
  fs_widget.change_text(root.percent, beautiful.fs_color)
  fs_widget.change_icon(icon, beautiful.fs_color)
end)

fsinfo.update()

gears.timer({
  timeout = 10,
  call_now = true,
  autostart = true,
  callback = function()
    fsinfo.update()
  end,
})

return fs_widget.widget
