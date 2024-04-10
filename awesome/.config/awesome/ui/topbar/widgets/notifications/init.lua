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

local notifs_list = wibox.widget({
  widget = wibox.layout.fixed.vertical,
})

local screen_geometry = awful.screen.focused().geometry
local margin = 10
local top_margin = 35
local width = 400

local notif_popup = awful.popup({
  widget = {
    {
      {
        text = "Notifications (WIP)",
        widget = wibox.widget.textbox,
      },
      notifs_list,
      layout = wibox.layout.fixed.vertical,
    },
    margins = 10,
    forced_height = screen_geometry.height - margin - top_margin,
    forced_width = width,
    widget = wibox.container.margin,
  },
  border_color = beautiful.border_focus,
  border_width = beautiful.border_width,
  bg = beautiful.bg_normal,
  shape = sutils.rrect(5),
  visible = false,
  ontop = true,
  placement = function(w)
    awful.placement.top_right(w, {
      margins = { top = top_margin, bottom = margin, right = margin },
    })
  end,
})

notif_widget.widget:connect_signal("button::press", function()
  notif_popup.visible = not notif_popup.visible

  notifs_list:reset()
  for _, x in pairs(notif_store.get_data()) do
    notifs_list:add({
      widget = wibox.container.margin,
      top = 20,
      {
        layout = wibox.layout.align.horizontal,
        {
          widget = wibox.container.margin,
          right = 10,
          {
            image = x["icon"],
            resize = true,
            widget = wibox.widget.imagebox,
            forced_height = 40,
            forced_width = 40,
          }
        },
        {
          layout = wibox.layout.fixed.vertical,
          {
            widget = wibox.widget.textbox,
            text = tostring(x["title"]),
          },
          {
            widget = wibox.widget.textbox,
            text = tostring(x["message"])
          },
        },
        {
          {
            widget = wibox.container.margin,
            margins = 20,
            {
              widget = wibox.widget.textbox,
              text = "x"
            }
          },
          halign = "center",
          widget = wibox.container.place,
        }
      }
    })
  end
end)

local mouse_over = false
local timer = gears.timer {
  timeout     = 1.5,
  single_shot = true,
  callback    = function()
    if not mouse_over then
      notif_popup.visible = false
    end
  end
}

notif_popup:connect_signal("mouse::leave", function()
  if notif_popup.visible then
    mouse_over = false
    timer:again()
  end
end)

notif_popup:connect_signal("mouse::enter", function()
  mouse_over = true
end)



return notif_widget.widget
