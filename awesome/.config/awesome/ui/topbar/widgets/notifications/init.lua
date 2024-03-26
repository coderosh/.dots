local naughty = require("naughty")
local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local notif_store = require("utils.notif_store")

local wutils = require("utils.widget")
local sutils = require("utils.shape")

local notif_widget = wutils.topbar_status_widget()

notif_widget.change_icon("", beautiful.notif_color)
notif_widget.change_text("0", beautiful.notif_color)

naughty.connect_signal("request::display", function(n)
  notif_store.add({ title = n.title, icon = n.icon, message = n.message })
  notif_widget.change_text(tostring(notif_store.length()), beautiful.notif_color)
end)

-- local notifs_list = wibox.widget({
--   widget = wibox.layout.fixed.vertical,
-- })
--
-- local notif_popup = awful.popup({
--   widget = {
--     {
--       {
--         text = "Notifications (WIP)",
--         widget = wibox.widget.textbox,
--       },
--       notifs_list,
--       layout = wibox.layout.fixed.vertical,
--     },
--     margins = 10,
--     widget = wibox.container.margin,
--   },
--   border_color = beautiful.border_focus,
--   border_width = beautiful.border_width,
--   bg = beautiful.widget_bg,
--   shape = sutils.rrect(5),
--   visible = false,
--   ontop = true,
--   placement = function(w)
--     awful.placement.top_right(w, {
--       margins = { top = 35 },
--     })
--   end,
-- })
--
-- notif_widget.widget:connect_signal("button::press", function()
--   notif_popup.visible = not notif_popup.visible
--
--   notifs_list:reset()
--   for _, x in pairs(notif_store.get_data()) do
--     notifs_list:add({
--       widget = wibox.widget.textbox,
--       text = tostring(x["title"]),
--     })
--   end
-- end)

return notif_widget.widget
