local ruled = require("ruled")
local naughty = require("naughty")
local awful = require("awful")

local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

ruled.notification.connect_signal("request::rules", function()
  -- All notifications will match this rule.
  ruled.notification.append_rule({
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    },
  })
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box({
    notification = n,
    widget_template = {
      {
        {
          {
            {
              naughty.widget.icon,
              {
                naughty.widget.title,
                naughty.widget.message,
                spacing = 4,
                layout = wibox.layout.fixed.vertical,
              },
              fill_space = true,
              spacing = 4,
              layout = wibox.layout.fixed.horizontal,
            },
            naughty.list.actions,
            spacing = 10,
            layout = wibox.layout.fixed.vertical,
          },
          margins = beautiful.notification_margin,
          widget = wibox.container.margin,
        },
        id = "background_role",
        widget = naughty.container.background,
      },
      strategy = "max",
      width = dpi(500),
      widget = wibox.container.constraint,
    },
  })
end)
