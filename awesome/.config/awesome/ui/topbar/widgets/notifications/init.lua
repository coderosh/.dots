local naughty = require("naughty")
local notif_store = require("utils.notif_store")

local wutils = require("utils.widget")

local notif_widget = wutils.topbar_status_widget()

notif_widget.change_icon("")
notif_widget.change_text("0")

naughty.connect_signal("request::display", function(n)
  notif_store.add({ title = n.title, icon = n.icon, message = n.message })
  notif_widget.change_text(tostring(notif_store.length()))
end)

return notif_widget
