local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")

local volume_controller = require("ui.topbar.widgets.volume.controller")
local brightness_controller = require("ui.topbar.widgets.brightness.controller")
local menu = require("ui.menu")
local pref = require("main.preferences")
local xrandr = require("main.xrandr")
local revelation = require("main.revelation")
local modkey = pref.modkey
local terminal = pref.terminal

awful.keyboard.append_global_keybindings({
  awful.key({ "Mod1" }, "Tab", function()
    awesome.emit_signal("bling::window_switcher::turn_on")
  end, { description = "Window Switcher", group = "controls" }),

  awful.key({ modkey }, "e", revelation, { description = "Revelation", group = "controls" }),

  awful.key({}, "XF86MonBrightnessUp", function()
    brightness_controller.inc()
  end, { description = "increase brightness", group = "controls" }),

  awful.key({}, "XF86MonBrightnessDown", function()
    brightness_controller.dec()
  end, { description = "decrease brightness", group = "controls" }),

  awful.key({}, "XF86AudioRaiseVolume", function()
    volume_controller.inc()
  end, { description = "increase volume", group = "controls" }),

  awful.key({}, "XF86AudioLowerVolume", function()
    volume_controller.dec()
  end, { description = "decrease volume", group = "controls" }),

  awful.key({}, "XF86AudioMute", function()
    -- awful.spawn("amixer -D pulse sset Master toggle")
    volume_controller.toggle_mute()
  end, { description = "mute volume", group = "controls" }),

  awful.key({ "Shift" }, "Print", function()
    awful.spawn("flameshot gui --clipboard -s")
  end),
  awful.key({}, "Print", function()
    awful.spawn("flameshot gui")
  end),
  awful.key({ modkey }, "r", function()
    awful.util.spawn("rofi -show drun")
  end, { description = "run prompt", group = "launcher" }),
  awful.key({ modkey }, "o", function()
    awful.util.spawn("rofi -show window")
  end, { description = "run prompt", group = "launcher" }),

  awful.key({ modkey }, "d", function()
    require("ui.scratchpad"):toggle()
  end, { description = "run prompt", group = "launcher" }),

  awful.key({ modkey, "Shift" }, "x", function()
    awful.util.spawn("betterlockscreen -l")
  end, { description = "lockscreen", group = "launcher" }),

  awful.key({ modkey }, "x", function()
    xrandr.xrandr()
  end, { description = "xrandr", group = "launcher" }),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
  awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
  awful.key({ modkey }, "w", function()
    menu:show()
  end, { description = "show main menu", group = "awesome" }),
  awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
  -- awful.key({ modkey }, "x", function()
  -- 	awful.prompt.run({
  -- 		prompt = "Run Lua code: ",
  -- 		textbox = awful.screen.focused().mypromptbox.widget,
  -- 		exe_callback = awful.util.eval,
  -- 		history_path = awful.util.get_cache_dir() .. "/history_eval",
  -- 	})
  -- end, { description = "lua execute prompt", group = "awesome" }),
  awful.key({ modkey }, "Return", function()
    awful.spawn(terminal)
  end, { description = "open a terminal", group = "launcher" }),
  --   awful.key({ modkey }, "r", function()
  --     awful.screen.focused().mypromptbox:run()
  --   end, { description = "run prompt", group = "launcher" }),
  awful.key({ modkey }, "p", function()
    menubar.show()
  end, { description = "show the menubar", group = "launcher" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
  awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
  awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey }, "j", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ modkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),
  awful.key({ modkey }, "Tab", function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end, { description = "go back", group = "client" }),
  awful.key({ modkey, "Control" }, "j", function()
    awful.screen.focus_relative(1)
  end, { description = "focus the next screen", group = "screen" }),
  awful.key({ modkey, "Control" }, "k", function()
    awful.screen.focus_relative(-1)
  end, { description = "focus the previous screen", group = "screen" }),
  awful.key({ modkey, "Control" }, "n", function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:activate({ raise = true, context = "key.unminimize" })
    end
  end, { description = "restore minimized", group = "client" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end, { description = "swap with next client by index", group = "client" }),
  awful.key({ modkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end, { description = "swap with previous client by index", group = "client" }),
  awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
  awful.key({ modkey }, "l", function()
    awful.tag.incmwfact(0.05)
  end, { description = "increase master width factor", group = "layout" }),
  awful.key({ modkey }, "h", function()
    awful.tag.incmwfact(-0.05)
  end, { description = "decrease master width factor", group = "layout" }),
  awful.key({ modkey, "Shift" }, "h", function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = "increase the number of master clients", group = "layout" }),
  awful.key({ modkey, "Shift" }, "l", function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ modkey, "Control" }, "h", function()
    awful.tag.incncol(1, nil, true)
  end, { description = "increase the number of columns", group = "layout" }),
  awful.key({ modkey, "Control" }, "l", function()
    awful.tag.incncol(-1, nil, true)
  end, { description = "decrease the number of columns", group = "layout" }),
  awful.key({ modkey }, "space", function()
    awful.layout.inc(1)
  end, { description = "select next", group = "layout" }),
  awful.key({ modkey, "Shift" }, "space", function()
    awful.layout.inc(-1)
  end, { description = "select previous", group = "layout" }),
})

awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { modkey },
    keygroup = "numrow",
    description = "only view tag",
    group = "tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  }),
  awful.key({
    modifiers = { modkey, "Control" },
    keygroup = "numrow",
    description = "toggle tag",
    group = "tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  }),
  awful.key({
    modifiers = { modkey, "Shift" },
    keygroup = "numrow",
    description = "move focused client to tag",
    group = "tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  }),
  awful.key({
    modifiers = { modkey, "Control", "Shift" },
    keygroup = "numrow",
    description = "toggle focused client on tag",
    group = "tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  }),
  awful.key({
    modifiers = { modkey },
    keygroup = "numpad",
    description = "select layout directly",
    group = "layout",
    on_press = function(index)
      local t = awful.screen.focused().selected_tag
      if t then
        t.layout = t.layouts[index] or t.layout
      end
    end,
  }),
})
