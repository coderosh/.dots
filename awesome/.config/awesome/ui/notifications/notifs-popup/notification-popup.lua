local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local sutils = require("utils.shape")
local notif_store = require("ui.notifications.notif_store")
local notification_box = require("ui.notifications.notifs-popup.notification-box")

local screen_geometry = awful.screen.focused().geometry
local margin = 10
local top_margin = 35
local width = 400

local notif_container = wibox.widget({
  widget = wibox.layout.fixed.vertical,
})

local header = wibox.widget({
  widget = wibox.container.margin,
  margins = 10,
  {
    markup = "<span font_desc='14' weight='bold'>Notifications (WIP)</span>",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
  },
})

local notif_popup = awful.popup({
  widget = {
    {
      header,
      -- {
      --   widget = wibox.widget.separator,
      --   orientation = "horizontal",
      --   forced_height = 5,
      --   color = beautiful.border_focus,
      --   visible = true,
      -- },
      notif_container,
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
  screen = awful.screen.focused(),
  placement = function(w)
    awful.placement.top_right(w, {
      margins = { top = top_margin, bottom = margin, right = margin },
      screen = awful.screen.focused(),
    })
  end,
})

local function add_notifs_to_container(notif_widget)
  notif_container:reset()
  for i, x in pairs(notif_store.get_data()) do
    local notif_box = notification_box({
      title = tostring(x["title"]),
      message = tostring(x["message"]),
      icon = x["icon"],
      on_remove = function()
        notif_store.remove(i)
        notif_widget.change_text(tostring(notif_store.length()), beautiful.notif_color)
        add_notifs_to_container(notif_widget)
      end,
    })

    notif_container:add(notif_box)
  end
end

local mouse_over = false
local timer = gears.timer({
  timeout = 1.5,
  single_shot = true,
  callback = function()
    if not mouse_over then
      notif_popup.visible = false
    end
  end,
})

notif_popup:connect_signal("mouse::leave", function()
  if notif_popup.visible then
    mouse_over = false
    timer:again()
  end
end)

notif_popup:connect_signal("mouse::enter", function()
  mouse_over = true
end)

return {
  popup = notif_popup,
  toggle = function(notif_widget)
    notif_popup.visible = not notif_popup.visible

    if notif_popup.visible then
      add_notifs_to_container(notif_widget)
    end
  end,
}
