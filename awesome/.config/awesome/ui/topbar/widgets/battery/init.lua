local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local tutils = require("utils.text")
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
      return empty_icon
    end

    return charging_icons[percent // 10]
  end

  return empty_icon
end

local icon_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = "",
  font = beautiful.icon_font,
})

local text_widget = wibox.widget({
  widget = wibox.widget.textbox,
  markup = "",
})

local prev_percentage = nil
local prev_state = nil
local function update_widget()
  local stats = upower:get_status()

  if
    (prev_percentage == 25 and stats.percentage == 24)
    or (prev_state == upower.State.CHARGING and stats.state == upower.State.DISCHARGING and stats.percentage < 25)
  then
    naughty.notification({
      title = "Battery Status",
      text = "Battery Low, Please Charge",
    })
  end

  prev_percentage = stats.percentage
  prev_state = stats.state

  local icon_text = get_icon(stats.percentage, stats.state)
  icon_widget.markup = tutils.colored_text(icon_text, beautiful.bg_focus)

  text_widget.markup = " " .. stats.percentage .. "%"

  if stats.state == upower.State.DISCHARGING and stats.percentage < 25 then
    icon_widget.markup = [[<span foreground="#ff1010">]] .. icon_text .. [[</span>]]
  end
end

local battery_widget = wibox.widget({
  icon_widget,
  text_widget,
  widget = wibox.layout.align.horizontal,
})

update_widget()
upower:on_update(update_widget)

local notification
battery_widget:connect_signal("button::press", function()
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

  notification = naughty.notification({
    title = "Battery Status",
    text = stats.percentage .. "%" .. state .. time,
  })
end)

return battery_widget
