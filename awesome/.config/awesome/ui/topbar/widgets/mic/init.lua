local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local wutils = require("utils.widget")
local controller = require("ui.topbar.widgets.mic.controller")

local icons = {
    full = "",
    muted = "",
}

local mic_widget = wutils.topbar_status_widget()

mic_widget.widget:buttons(awful.util.table.join(
    awful.button({}, 3, function()
        controller.toggle_mute()
    end),
    awful.button({}, 4, function()
        controller.inc()
    end),
    awful.button({}, 5, function()
        controller.dec()
    end)
))

controller.on_update(function(status)
    local percentage_floor = 0

    if status.percentage then
        percentage_floor = math.floor(status.percentage)
    end

    if status.is_muted then
        mic_widget.change_icon(icons.muted, beautiful.mic_mute_color)
        mic_widget.change_text(percentage_floor .. "%", beautiful.mic_mute_color)
    else
        mic_widget.change_icon(icons.full, beautiful.mic_color)
        mic_widget.change_text(percentage_floor .. "%", beautiful.mic_color)
    end
end)

controller.update()

gears.timer({
    timeout = 3,
    call_now = true,
    autostart = true,
    callback = function()
        controller.update()
    end,
})

return mic_widget.widget
