local wibox = require("wibox")
local beautiful = require("beautiful")

local sutils = require("utils.shape")

local function notification_box(data)
  local title = data["title"]
  local message = data["message"]
  local icon = data["icon"]
  local on_remove = data["on_remove"]

  local close_x_icon = wibox.widget({
    {
      widget = wibox.container.margin,
      margins = 5,
      {
        widget = wibox.widget.textbox,
        text = "",
      },
    },
    widget = wibox.container.background,
    shape = sutils.rrect(5),
  })

  local close_button = wibox.widget({
    widget = wibox.container.margin,
    margins = 10,
    close_x_icon,
  })

  close_x_icon:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.bg_focus)
  end)
  close_x_icon:connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bg_normal)
  end)

  close_button:connect_signal("button::press", on_remove)

  return {
    widget = wibox.container.background,
    {
      widget = wibox.container.margin,
      top = 40,
      {
        layout = wibox.layout.align.horizontal,
        {
          widget = wibox.container.margin,
          right = 10,
          {
            image = icon,
            resize = true,
            widget = wibox.widget.imagebox,
            forced_height = 40,
            forced_width = 40,
          },
        },
        {
          layout = wibox.layout.fixed.vertical,
          {
            widget = wibox.widget.textbox,
            text = title,
            markup = "<b>" .. title .. "</b>",
          },
          {
            widget = wibox.widget.textbox,
            text = message,
          },
        },
        {
          close_button,
          halign = "center",
          widget = wibox.container.place,
        },
      },
    },
  }
end

return notification_box
