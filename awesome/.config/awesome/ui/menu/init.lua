local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local pref = require("main.preferences")

local terminal = pref.terminal
local editor_cmd = pref.editor_cmd
local files = pref.files
local browser = pref.browser

local awesomemenu = {
  {
    "Hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "Manual", terminal .. " -e man awesome" },
  { "Edit Config", editor_cmd .. " " .. awesome.conffile },
  { "Restart", awesome.restart },
  {
    "Quit",
    function()
      awesome.quit()
    end,
  },
}

local menu = awful.menu({
  items = {
    { "Awesome", awesomemenu, beautiful.awesome_icon },
    { "Terminal", terminal, "TERM" },
    { "Files", files },
    { "Browser", browser },
    { "ARandR", "arandr" },
    { "Discord", "discord" },
    { "Spotify", "spotify" },
  },
})

return menu
