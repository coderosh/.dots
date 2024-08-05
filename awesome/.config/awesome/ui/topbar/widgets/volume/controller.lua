local awful = require("awful")

-- TODO: use dbus

local controller = {}

local function get_percentage_from_stdout(stdout)
  -- local percentage_str = stdout:match("%[(%d+)%%%]")
  local percentage, status = stdout:match("%[(%d+)%%%] %[(%a+)%]")
  controller._percentage = percentage

  return {
    percentage = tonumber(percentage),
    is_muted = status == "off",
  }
end

local on_update = function(_) end

function controller.on_update(update_fn)
  on_update = update_fn
end

function controller.inc()
  -- awful.spawn.easy_async("amixer -D pulse sset Master 2%+", controller.update)
  awful.spawn.easy_async("pactl set-sink-volume 0 +2%", controller.update)
end

function controller.dec()
  -- awful.spawn.easy_async("amixer -D pulse sset Master 2%-", controller.update)
  awful.spawn.easy_async("pactl set-sink-volume 0 -2%", controller.update)
end

function controller.toggle_mute()
  -- awful.spawn.easy_async("amixer -D pulse sset Master toggle", controller.update)
  awful.spawn.easy_async("pactl set-sink-mute 0 toggle", controller.update)
end

function controller.update()
  awful.spawn.easy_async("amixer -D pulse sget Master", function(stdout)
    on_update(get_percentage_from_stdout(stdout))
  end)
end

return controller
