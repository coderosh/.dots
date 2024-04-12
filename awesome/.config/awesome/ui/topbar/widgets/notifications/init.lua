local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local notif_store = require("ui.notifications.notif_store")
local notif_popup = require("ui.notifications.notifs-popup.notification-popup")

local notif_widget = wutils.topbar_status_widget()

notif_widget.change_icon("", beautiful.notif_color)
notif_widget.change_text("0", beautiful.notif_color)

naughty.connect_signal("request::display", function(n)
  notif_store.add({ title = n.title, icon = n.icon, message = n.message })
  notif_widget.change_text(tostring(notif_store.length()), beautiful.notif_color)
end)


notif_widget.widget:connect_signal("button::press", function()
  notif_popup.toggle(notif_widget)
end)


return notif_widget.widget
