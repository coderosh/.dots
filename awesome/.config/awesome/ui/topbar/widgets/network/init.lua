local beautiful = require("beautiful")

-- TODO: WIP

local wutils = require("utils.widget")
local nm = require("ui.topbar.widgets.network.nm")

local icons = {
  strength = { "󰤟", "󰤢", "󰤥", "󰤥", "󰤨" },
}

local nm_widget = wutils.topbar_status_widget()

nm_widget.change_icon("󰤯", beautiful.network_color)
nm_widget.change_text("")

local function update_widget()
  local ap = nm.wifi_device:get_active_access_point()

  if not ap then
    nm_widget.change_text("")
    nm_widget.change_icon("󰤯", beautiful.network_color_nocon)
    return
  end

  local info = nm:get_ap_info(ap)

  nm_widget.change_text(info.ssid, beautiful.network_color)
  nm_widget.change_icon(icons.strength[info.strength // 20], beautiful.network_color)
end

nm:on_update(update_widget)

return nm_widget.widget
