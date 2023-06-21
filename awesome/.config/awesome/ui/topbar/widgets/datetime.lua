local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local wutils = require("utils.widget")

local formats = {
  time = " %H:%M ",
  time_12 = " %I:%M %p ",
  date_time = " %a %b %d, %H:%M ",
  date_time_12 = " %a %b %d, %I:%M %p ",
}

local textclock = wibox.widget.textclock(formats.date_time)
local datetime_widget = wutils.topbar_status_widget(nil, textclock, true)

datetime_widget.widget:buttons(awful.util.table.join(
  awful.button({}, 1, function()
    if textclock.format == formats.time then
      textclock.format = formats.date_time
    elseif textclock.format == formats.date_time then
      textclock.format = formats.time
    elseif textclock.format == formats.time_12 then
      textclock.format = formats.date_time_12
    elseif textclock.format == formats.date_time_12 then
      textclock.format = formats.time_12
    end
  end),
  awful.button({}, 3, function()
    if textclock.format == formats.time_12 then
      textclock.format = formats.time
    elseif textclock.format == formats.date_time_12 then
      textclock.format = formats.date_time
    elseif textclock.format == formats.time then
      textclock.format = formats.time_12
    elseif textclock.format == formats.date_time then
      textclock.format = formats.date_time_12
    end
  end)
))

datetime_widget.change_icon("󰃰", beautiful.datetime_color)

return datetime_widget.widget
