local awful = require("awful")

local menu = require("ui.menu")

awful.mouse.append_global_mousebindings({
	awful.button({}, 1, function()
		menu:hide()
	end),
	awful.button({}, 3, function()
		menu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})
