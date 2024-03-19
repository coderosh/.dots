local awful = require("awful")
local info = {}

local on_update = function(_) end
function info.on_update(update_fn)
  on_update = update_fn
end

function info.update()
  awful.spawn.easy_async([[bash -c "free -h | awk '/^Mem:/{print $3}'"]], function(stdout)
    on_update(string.gsub(stdout, "%s+", ""))
  end)
end

info.update()

return info
