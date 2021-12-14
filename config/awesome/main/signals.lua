-- awesomewm libraries
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- execute when a new client appears.
local function ensure_placement(c)
    -- Prevent clients from being unreachable after screen count changes.
    if awesome.startup and 
	not c.size_hints.user_position and 
	not c.size_hints.program_position then
	awful.placement.no_offscreen(c)
    end
end

-- creating the titlebar
local function create_titlebar(c)
    awful.titlebar(c):setup {
	{
	    layout = wibox.layout.fixed.horizontal(),
	},
	layout = wibox.layout.align.horizontal
    }
end

-- toggle titlebar
local function toggle_titlebar(c)
    awful.titlebar.show(c)
end

-- setup signals
local function setup(c)
    -- ensure no client spawns outside of the screen
    client.connect_signal("manage", function(c) ensure_placement(c) end)
    -- Add a titlebar if titlebars_enabled is set to true in the rules.
    client.connect_signal( "request::titlebars", function(c) create_titlebar(c) end)


    -- Focus signals
    client.connect_signal("focus", function(c) 
	awful.titlebar.show(c) 
	beautiful.titlebar_bg = beautiful.transparent end)

    client.connect_signal("unfocus", function(c) 
	beautiful.titlebar_bg = beautiful.color10 end)
end

return { setup = setup }
