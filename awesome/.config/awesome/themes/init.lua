local awful = require("awful")
local gears = require("gears")
local menubar = require("menubar")
local beautiful = require("beautiful")

local gfs = gears.filesystem

local theme_name = "default"
local theme = gfs.get_configuration_dir() .. "themes/" .. theme_name .. "/init.lua"
beautiful.init(theme)

client.connect_signal("manage", function(c)
  awful.spawn.easy_async_with_shell("sleep 0.1", function()
    if c.valid then
      if c.instance ~= nil then
        local icon = menubar.utils.lookup_icon(c.instance)
        local lower_icon = menubar.utils.lookup_icon(c.instance:lower())
        if icon ~= nil then
          local new_icon = gears.surface(icon)
          c.icon = new_icon._native
        elseif lower_icon ~= nil then
          local new_icon = gears.surface(lower_icon)
          c.icon = new_icon._native
        elseif c.icon == nil then
          local new_icon = gears.surface(menubar.utils.lookup_icon("application-default-icon"))
          c.icon = new_icon._native
        end
      else
        local new_icon = gears.surface(menubar.utils.lookup_icon("application-default-icon"))
        c.icon = new_icon._native
      end
    end
  end)
end)
