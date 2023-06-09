local wibox = require("wibox")

local M = {}

function M.left_widgets(s)
  local taglist = require("ui.topbar.widgets.taglist")(s)

  return taglist
end

function M.middle_widgets(s)
  local tasklist = require("ui.topbar.widgets.tasklist")(s)

  return tasklist
end

function M.right_widgets(s)
  local systray = require("ui.topbar.widgets.systray")
  local datetime = require("ui.topbar.widgets.datetime")
  local battery = require("ui.topbar.widgets.battery")
  local brightness = require("ui.topbar.widgets.brightness")
  local volume = require("ui.topbar.widgets.volume")

  local layoutbox = require("ui.topbar.widgets.layoutbox")(s)

  return {
    layout = wibox.layout.fixed.horizontal,
    spacing = 10,
    systray,
    battery,
    volume,
    brightness,
    datetime,
    layoutbox,
  }
end

return M
