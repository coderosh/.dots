local awful = require("awful")
local gfs = require("gears").filesystem

local script = gfs.get_configuration_dir() .. "scripts/autostart.sh"

awful.spawn.with_shell(script)
