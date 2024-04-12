pcall(require, "luarocks.loader")

local awful = require("awful")

require("awful.autofocus")

require("main.handle-error")

require("themes")

require("main.revelation").init()

require("main.layouts")

require("main.wallpaper")

require("ui.scratchpad")

require("ui.window-switcher")

screen.connect_signal("request::desktop_decoration", function(s)
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  require("ui.topbar")(s)
end)

require("main.bindings")

require("main.rules")

require("ui.notifications.notification")

require("main.autorun")
