local ruled = require("ruled")
local awful = require("awful")

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule({
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered,
    },
  })

  -- Floating clients.
  ruled.client.append_rule({
    id = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer",
        "Protonvpn",
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true },
  })

  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule({
    id = "titlebars",
    rule_any = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false },
  })

  ruled.client.append_rule({
    id = "plank",
    rule_any = { name = { "plank" } },
    properties = {
      border_width = 0,
      floating = true,
      sticky = true,
      ontop = true,
      focusable = false,
      -- below = true
    },
  })

  ruled.client.append_rules({
    {
      rule_any = { class = { "TelegramDesktop", "discord", "Viber" } },
      properties = { screen = 1, tag = "9" },
    },
    {

      rule_any = { class = { "Nitrogen", "Pavucontrol", "Protonvpn" } },
      properties = { screen = 1, tag = "8" },
    },
    {
      rule_any = { class = { "Spotify" } },
      properties = { screen = 1, tag = "7" },
    },
    {
      rule_any = { class = { "firefox", "Google-chrome", "Microsoft-edge" } },
      properties = { screen = 1, tag = "1" },
    },
  })

  -- ruled.client.append_rule({
  --   rule_any = { class = { "TelegramDesktop", "discord", "Viber" } },
  --   properties = { screen = 1, tag = "9" },
  -- })
  --
  -- ruled.client.append_rule({
  --   rule_any = { class = { "Nitrogen", "Pavucontrol", "Protonvpn" } },
  --   properties = { screen = 1, tag = "8" },
  -- })
  --
  -- ruled.client.append_rule({
  --   rule_any = { class = { "Spotify" } },
  --   properties = { screen = 1, tag = "7" },
  -- })
  --
  -- ruled.client.append_rule({
  --   rule_any = { class = { "firefox" } },
  --   properties = { screen = 1, tag = "1" },
  -- })
end)
-- }}}
