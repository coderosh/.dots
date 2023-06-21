local awful = require("awful")

local wutils = require("utils.widget")

local function layoutbox(s)
  local layoutbox_widget = wutils.topbar_status_widget(
    awful.widget.layoutbox({
      screen = s,
      buttons = {
        awful.button({}, 1, function()
          awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
          awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
          awful.layout.inc(-1)
        end),
        awful.button({}, 5, function()
          awful.layout.inc(1)
        end),
      },
    }),
    nil,
    true
  )

  return layoutbox_widget.widget
end

return layoutbox
