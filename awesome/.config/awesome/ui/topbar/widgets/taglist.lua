local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local tutils = require("utils.text")

local icons = {
  empty = "",
  filled = "󰪥",
}

local function update_taglist(item, tag)
  if tag.selected then
    item:get_children_by_id("marker")[1].markup = tutils.colored_text(icons.filled, beautiful.bg_focus)
  elseif #tag:clients() == 0 then
    item:get_children_by_id("marker")[1].markup = tutils.colored_text(icons.empty, beautiful.bg_focus .. "77")
  else
    item:get_children_by_id("marker")[1].markup = tutils.colored_text(icons.filled, beautiful.bg_focus .. "77")
  end
end

local modkey = require("main.preferences").modkey

return function(s)
  return wibox.widget({
    awful.widget.taglist({
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = {
        awful.button({}, 1, function(t)
          t:view_only()
        end),
        awful.button({ modkey }, 1, function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end),
        awful.button({}, 4, function(t)
          awful.tag.viewprev(t.screen)
        end),
        awful.button({}, 5, function(t)
          awful.tag.viewnext(t.screen)
        end),
      },
      style = {
        shape = gears.shape.circle,
      },
      layout = {
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal,
      },
      widget_template = {
        id = "marker",
        widget = wibox.widget.textbox,
        align = "center",
        valign = "center",
        font = beautiful.icon_font,

        create_callback = function(self, c3, _)
          update_taglist(self, c3)
        end,
        update_callback = function(self, c3, _)
          update_taglist(self, c3)
        end,
      },
    }),
    widget = wibox.container.margin,
    right = dpi(15),
    bottom = 0,
  })
end
