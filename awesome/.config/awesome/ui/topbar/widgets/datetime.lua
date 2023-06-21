local wibox = require("wibox")
local beautiful = require("beautiful")

local wutils = require("utils.widget")

local datetime_widget = wutils.topbar_status_widget(nil, wibox.widget.textclock(), true)

datetime_widget.change_icon("󰃰", beautiful.datetime_color)

return datetime_widget.widget
