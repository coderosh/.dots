-- TODO: persist wallpaper change

local awful = require("awful")
local gwall = require("gears.wallpaper")
local gtable = require("gears.table")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local futils = require("utils.file")

local wc = {}

wc.wallpapers_dir = gfs.get_configuration_dir() .. "themes/wallpapers/"

local function create_image_widget(src)
  local image_widget = wibox.widget {
    {
      image         = src,
      resize        = true,
      forced_height = 90,
      forced_width  = 160,
      widget        = wibox.widget.imagebox,
    },
    widget = wibox.container.background,
    border_color = beautiful.bg_normal,
    border_width = beautiful.border_width
  }

  image_widget:connect_signal("mouse::enter", function(c)
    image_widget.border_color = beautiful.border_focus
  end)

  image_widget:connect_signal("mouse::leave", function(c)
    image_widget.border_color = beautiful.bg_normal
  end)

  image_widget:connect_signal("button::press", function(c)
    gwall.maximized(src)
  end)


  return image_widget
end


wc.widget = awful.popup {
  widget       = {
    {
      {
        markup = '<b>Wallpaper Changer</b>',
        widget = wibox.widget.textbox,
        align = "center"
      },
      gtable.join(
        {
          forced_num_cols = 5,
          spacing = dpi(10),
          layout = wibox.layout.grid,
        },
        futils.ls(wc.wallpapers_dir, function(name)
          return create_image_widget(wc.wallpapers_dir .. name)
        end)
      ),
      spacing = dpi(20),
      layout = wibox.layout.fixed.vertical,
    },
    margins = dpi(10),
    widget  = wibox.container.margin
  },
  placement    = awful.placement.centered,
  ontop        = true,
  visible      = false,
  border_color = beautiful.border_focus,
  border_width = beautiful.border_width,
}

function wc:toggle_popup()
  self.widget.visible = not self.widget.visible
end

return wc
