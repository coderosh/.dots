-- https://upower.freedesktop.org/docs/UpClient.html

local lgi = require("lgi")
local UPowerGlib = lgi.UPowerGlib

local function sec_to_hm(seconds)
  if not seconds then
    return ""
  end

  local hours = math.floor(seconds / 3600)
  local minutes = math.ceil((seconds % 3600) / 60)
  return string.format("%02dh %02dm", hours, minutes)
end

local upower = {}

function upower.on_update(self, cb)
  self._device.on_notify = cb
end

function upower.get_status(self)
  local percentage = 0
  if self._device.percentage then
    percentage = math.floor(self._device.percentage)
  end

  return {
    percentage = math.floor(percentage),
    time_to_full = sec_to_hm(self._device.time_to_full),
    time_to_empty = sec_to_hm(self._device.time_to_empty),
    -- state = shelpers.first_letter_capital(UPowerGlib.Device.state_to_string(self._device.state)),
    state = self._device.state,
  }
end

function upower._get_device_from_path(self, path)
  local devices = self._client:get_devices()

  for _, d in ipairs(devices) do
    if d:get_object_path() == path then
      return d
    end
  end
  return nil
end

upower._client = UPowerGlib.Client()
upower._device = upower._client:get_display_device()
-- upower.device = upower:get_device_from_path("/org/freedesktop/UPower/devices/battery_BAT0")

upower.State = UPowerGlib.DeviceState

return upower
