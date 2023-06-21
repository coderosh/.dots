local wibox = require("wibox")
local beautiful = require("beautiful")

local tutils = require("utils.text")
local sutils = require("utils.shape")

local function topbar_status_widget(icon_widget, text_widget, dont_create_text_widget)
  if not icon_widget then
    icon_widget = wibox.widget({
      widget = wibox.widget.textbox,
      markup = "",
      font = beautiful.icon_font,
    })
  end

  if not text_widget then
    if not dont_create_text_widget then
      text_widget = wibox.widget({
        widget = wibox.widget.textbox,
        markup = "Hello",
      })
    end
  end

  local widget = wibox.widget({
    {
      {
        icon_widget,
        text_widget,
        align = "center",
        widget = wibox.layout.align.horizontal,
      },
      widget = wibox.container.margin,
      margins = beautiful.widget_bg_margin,
    },
    widget = wibox.container.background,
    shape = sutils.rrect(beautiful.widget_bg_radius),
    bg = beautiful.widget_bg,
  })

  return {
    widget = widget,
    change_icon = function(icon, color)
      icon_widget.markup = tutils.colored_text(icon .. " ", color)
    end,
    change_text = function(text, color)
      text_widget.markup = tutils.colored_text(text, color)
    end,
  }
end

return {
  topbar_status_widget = topbar_status_widget,
}
