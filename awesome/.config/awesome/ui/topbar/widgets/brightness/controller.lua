local awful = require("awful")

local controller = {}

local on_update = function() end

function controller.on_update(update_fn)
  on_update = update_fn
end

function controller.inc()
  awful.spawn.easy_async("brightnessctl s 5%+", controller.update)
end

function controller.dec()
  awful.spawn.easy_async("brightnessctl s 5%-", controller.update)
end

local function get_percentage_from_stdout(stdout)
  local percentage_str = stdout:match("%((%d+)%%%)")
  return tonumber(percentage_str)
end

function controller.update(stdout)
  if stdout then
    on_update(get_percentage_from_stdout(stdout))
    return
  end
  awful.spawn.easy_async("brightnessctl i", function(stdout)
    on_update(get_percentage_from_stdout(stdout))
  end)
end

return controller
