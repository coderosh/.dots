local awful = require("awful")
local info = {}

local on_update = function(_) end
function info.on_update(update_fn)
  on_update = update_fn
end

local function get_data_from_stdout(stdout)
  local data = {}
  for line in stdout:gmatch("[^\r\n]+") do
    local device, total, used, available, percent, mount = line:match("(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)")

    if device and percent and mount and total then
      data[mount] = {
        percent = percent,
        mount = mount,
        total = total,
        used = used,
        available = available,
      }
    end
  end

  return data
end

function info.update()
  awful.spawn.easy_async([[bash -c "df -x tmpfs -x devtmpfs | tail -n +2"]], function(stdout)
    on_update(get_data_from_stdout(stdout))
  end)
end

return info
