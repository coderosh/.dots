local wibox = require("wibox")
local ruled = require("ruled")
local naughty = require("naughty")
local menubar = require("menubar")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

ruled.notification.connect_signal("request::rules", function()
  local statusArray = { "low", "critical", "normal" }
  local timeouts = { 4, 0, 5 }

  for i = 1, #statusArray do
    local urgency = statusArray[i]
    ruled.notification.append_rule({
      rule = { urgency = urgency },
      properties = {
        bg = beautiful.notif.message_bg[urgency],
        fg = beautiful.notif.message_fg[urgency],
        timeout = timeouts[i],
      },
    })
  end
end)

naughty.connect_signal("request::icon", function(n, context, hints)
  if context ~= "app_icon" then
    return
  end

  local path = menubar.utils.lookup_icon(hints.app_icon) or menubar.utils.lookup_icon(hints.app_icon:lower())

  if path then
    n.icon = path
  end
end)

naughty.connect_signal("request::action_icon", function(a, context, hints)
  a.icon = menubar.utils.lookup_icon(hints.id)
end)

local gaps = dpi(10)
naughty.connect_signal("request::display", function(n)
  local title = wibox.widget({
    {
      widget = wibox.container.margin,
      margins = gaps,
      {
        widget = naughty.widget.title,
      },
    },
    widget = wibox.widget.background,
    bg = beautiful.notif.title_bg,
  })

  naughty.layout.box({
    notification = n,
    border_width = dpi(1),
    border_color = beautiful.notif.border_color,
    maximum_width = dpi(350),
    maximum_height = dpi(200),
    type = "notification",
    widget_template = {
      layout = wibox.layout.fixed.vertical,
      title,
      {
        widget = wibox.container.margin,
        margins = gaps,
        {
          layout = wibox.layout.fixed.horizontal,
          spacing = gaps,
          naughty.widget.icon,
          naughty.widget.message,
        },
      },
      {
        widget = naughty.list.actions,
      },
    },
  })
end)
