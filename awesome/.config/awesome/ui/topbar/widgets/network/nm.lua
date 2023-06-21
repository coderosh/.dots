local lgi = require("lgi")
local NM = lgi.NM

local tautils = require("utils.table")

local nm = {}

function nm:scan_wifi()
  if not self.client then
    return
  end

  self.client:request_scan()
end

function nm:on_update(cb)
  self.client.on_notify = cb
end

function nm:get_ap_info(ap)
  local flags = ap:get_flags()
  local frequency = ap:get_frequency()
  local wpa_flags = ap:get_wpa_flags()
  local rsn_flags = ap:get_rsn_flags()

  flags["NONE"] = nil
  wpa_flags["NONE"] = nil
  rsn_flags["NONE"] = nil

  return {
    ssid = self:get_ap_ssid(ap),
    -- bssid = ap:get_bssid(),
    strength = ap:get_strength(),
    -- frequency = frequency,
    -- channel = NM.utils_wifi_freq_to_channel(frequency),
    -- mode = ap:get_mode(),
    -- flags = self:flags_to_string(flags),
    -- wpa_flags = self:flags_to_string(wpa_flags),
    -- rsn_flags = self:flags_to_string(rsn_flags),
    -- security = self:flags_to_security(flags, wpa_flags, rsn_flags),
  }
end

function nm:get_device_of_type(device_type)
  local devices = self.client:get_devices()

  for _, device in ipairs(devices) do
    if device:get_device_type() == device_type then
      return device
    end
  end

  return nil
end

function nm:get_ap_ssid(ap)
  local ssid = ap:get_ssid()

  if not ssid then
    return ""
  end

  return NM.utils_ssid_to_utf8(ssid:get_data())
end

function nm:flags_to_string(flags)
  local str = ""
  for flag, _ in pairs(flags) do
    str = str .. " " .. flag
  end
  if str == "" then
    str = "NONE"
  end
  return (str:gsub("^%s", ""))
end

function nm:flags_to_security(flags, wpa_flags, rsn_flags)
  local str = ""
  if flags["PRIVACY"] and tautils.is_empty(wpa_flags) and tautils.is_empty(rsn_flags) then
    str = str .. " WEP"
  end
  if not tautils.is_empty(wpa_flags) then
    str = str .. " WPA1"
  end
  if not tautils.is_empty(rsn_flags) then
    str = str .. " WPA2"
  end
  if wpa_flags["KEY_MGMT_802_1X"] or rsn_flags["KEY_MGMT_802_1X"] then
    str = str .. " 802.1X"
  end
  return (str:gsub("^%s", ""))
end

nm.client = NM.Client.new()
nm.wifi_device = nm:get_device_of_type("WIFI")

return nm
