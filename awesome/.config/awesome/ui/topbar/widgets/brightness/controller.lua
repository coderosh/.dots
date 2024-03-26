local awful = require("awful")

local controller = {}

local _prev = 0
local on_update = function(_) end

function controller.on_update(update_fn)
  on_update = update_fn
end

function controller.inc()
  awful.spawn.easy_async("brightnessctl s 5%+", controller.update)
end

function controller.dec()
  awful.spawn.easy_async("brightnessctl s 5%-", controller.update)
end

function controller.set(val)
  awful.spawn.easy_async("brightnessctl s " .. tostring(val) .. "%", controller.update)
end

local function get_percentage_from_stdout(stdout)
  local percentage_str = stdout:match("%((%d+)%%%)")
  return tonumber(percentage_str)
end

function controller.update(stdout)
  if stdout then
    local percentage = get_percentage_from_stdout(stdout)

    if percentage < 1 and _prev ~= 1 then
      controller.set(1)
    else
      on_update(percentage)
    end
    _prev = percentage
    return
  end
  awful.spawn.easy_async("brightnessctl i", function(stdout)
    on_update(get_percentage_from_stdout(stdout))
  end)
end

return controller
