local naughty = require("naughty")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local wutils = require("utils.widget")

local upower = require("ui.topbar.widgets.battery.upower")

local empty_icon = "󰂎"
local charging_icons = { "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅" }
local discharging_icons = { "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹" }

local function get_icon(percent, state)
  if state == upower.State.FULLY_CHARGED then
    return discharging_icons[10]
  end

  if state == upower.State.DISCHARGING then
    if percent < 10 then
      return empty_icon
    end

    return discharging_icons[percent // 10]
  end

  if state == upower.State.CHARGING then
    if percent < 10 then
      return charging_icons[1]
    end

    return charging_icons[percent // 10]
  end

  return empty_icon
end

local notification
local notification_icon_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = "",
  font = beautiful.icon_font_name .. " " .. dpi(16),
})

local function send_notification(opts)
  notification_icon_widget.markup = get_icon(opts.percentage, opts.state)

  notification = naughty.notification({
    title = opts.title,
    text = opts.text,
    image = gears.surface.widget_to_surface(notification_icon_widget, 30, 30),
    urgency = opts.urgency or "normal",
  })
end

local battery_widget = wutils.topbar_status_widget()

local prev_percentage = 0
local prev_state = nil
local function update_widget()
  local stats = upower:get_status()

  local limit_point = 25
  if
    (prev_percentage >= limit_point and stats.percentage < limit_point)
    or (
      prev_state == upower.State.CHARGING
      and stats.state == upower.State.DISCHARGING
      and stats.percentage < limit_point
    )
  then
    send_notification({
      title = "Battery Status",
      text = "Bettery Low, Please Charge",
      urgency = "critical",
      percentage = stats.percentage,
      state = stats.state,
    })
  end

  prev_percentage = stats.percentage
  prev_state = stats.state

  local icon_text = get_icon(stats.percentage, stats.state)
  battery_widget.change_icon(icon_text, beautiful.bat_color)
  battery_widget.change_text(stats.percentage .. "%", beautiful.bat_color)

  if stats.state == upower.State.DISCHARGING and stats.percentage < limit_point then
    battery_widget.change_icon(icon_text, beautiful.bat_red_color)
    battery_widget.change_text(stats.percentage .. "%", beautiful.bat_red_color)
  end
end

update_widget()
upower:on_update(update_widget)

-- Notification
local notificaion_icon_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = "",
  font = beautiful.icon_font_name .. " " .. dpi(16),
})

battery_widget.widget:connect_signal("button::press", function()
  local stats = upower:get_status()
  if notification then
    naughty.destroy(notification)
  end

  local state = ""
  local time = ""
  if stats.state == upower.State.CHARGING then
    state = "\nCharging"
    time = "\n" .. stats.time_to_full .. " to full"
  elseif stats.state == upower.State.DISCHARGING then
    state = "\nDischarging"
    time = "\n" .. stats.time_to_empty .. " remaining"
  elseif stats.state == upower.State.FULLY_CHARGED then
    state = "\nFully Charged"
  end

  notificaion_icon_widget.markup = get_icon(stats.percentage, stats.state)

  send_notification({
    title = "Batter Status",
    text = stats.percentage .. "%" .. state .. time,
    percentage = stats.percentage,
    state = stats.state,
  })
end)

return battery_widget.widget
