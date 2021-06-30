-- standard awesome library
local awful = require("awful")

-- theme library
local beautiful = require("beautiful")


local _M = {}


function _M.get(client_keys, client_buttons)
    local rules = {
    -- all clients will match this rule
	{
	    rule = {},
	    properties = {
		border_width = beautiful.border_width,
		border_color = beautiful.border_color,
		focus = awful.client.focus.filter,
		raise = true,
		keys = client_keys,
		buttons = client_buttons,
		screen = awful.screen.preferred,
		placement = awful.placement.no_overlap + awful.placement.no_offscreen
	    },
	},
	-- floating
	{
	    rule_any = {
		instance = {},
		class = {
		    "Arandr",
		    "Blueman-manager",
		    "Gpick",
		    "Sxiv"
		},
		name = {},
		role = {
		    "AlarmWindow",
		    "ConfigManager",
		    "pop-up"
		}
	    },
	    properties = {
		floating = true
	    }
	},
	-- titlebar to normal clients and dialogs
	{
	    rule_any = {
		type = { "normal", "dialog" }
	    },
	    properties = {
		titlebars_enabled = true
	    }
	},
	-- set firefox to always map on the tag named "2" on screen 1
	-- { rule = { class = "Firefox" },
	--	properties = { screen = 1, tag = "2" }},

    }

    return rules 
end

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
