local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local sutils = require("utils.shape")
local futils = require("utils.funcs")

local gaps = dpi(10)
local function notification_box(data)
  local title = data["title"]
  local message = data["message"]
  local icon = data["icon"]
  local on_remove = data["on_remove"]

  local close_x_icon = wibox.widget({
    {
      widget = wibox.widget.textbox,
      text = "",
      align = "center",
      valign = "center",
    },
    widget = wibox.container.background,
    bg = beautiful.notif_title_bg,
    forced_height = 20,
    forced_width = 20,
    shape = sutils.rrect(4),
  })

  local close_button = wibox.widget({
    widget = wibox.container.margin,
    margins = 5,
    close_x_icon,
  })

  close_x_icon:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.bg_normal)
  end)
  close_x_icon:connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.notif_title_bg)
  end)

  close_button:connect_signal("button::press", on_remove)

  local titlew = wibox.widget({
    widget = wibox.container.margin,
    left = gaps,
    right = gaps,
    {
      widget = wibox.widget.textbox,
      text = title,
      -- markup = "<b>" .. title .. "</b>",
    },
    forced_width = 350,
    forced_height = 20,
  })

  local messagew = wibox.widget({
    widget = wibox.widget.textbox,
    text = message,
    forced_height = futils.ternary(#message > 300, 100, nil),
  })

  local iconw = wibox.widget({
    image = icon,
    resize = true,
    widget = wibox.widget.imagebox,
    forced_height = 40,
    forced_width = 40,
  })

  return {
    widget = wibox.container.margin,
    bottom = gaps,
    {
      widget = wibox.container.background,
      bg = beautiful.notif.title_bg,
      border_color = beautiful.notif.title_bg,
      border_width = dpi(2),
      {
        layout = wibox.layout.fixed.vertical,
        {
          layout = wibox.layout.align.horizontal,
          titlew,
          nil,
          close_button,
        },
        {
          widget = wibox.container.background,
          bg = beautiful.notif.message_bg.normal,
          {
            layout = wibox.layout.fixed.vertical,
            {
              widget = wibox.container.margin,
              margins = gaps,
              {
                layout = wibox.layout.fixed.horizontal,
                spacing = 10,
                iconw,
                messagew,
              },
            },
          },
        },
      },
    },
  }
end

return notification_box
