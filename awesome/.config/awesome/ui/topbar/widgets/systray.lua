local wibox = require("wibox")

local wutils = require("utils.widget")

return wutils.topbar_status_widget(wibox.widget.systray(), nil, true)
