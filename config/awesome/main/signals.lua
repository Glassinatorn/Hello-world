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


-- buttons for the titlebar
local buttons = gears.table.join(
    awful.button({ }, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end)
)

-- creating the titlebar
local function create_titlebar(c)
    awful.titlebar(c):setup
    {
	    -- trying to create new config
{ -- Left
        awful.titlebar.widget.iconwidget(c),
        layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
        { -- Title
            align  = 'center',
            widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
    },
    { -- Right
	    --bgimage = test,
	    --layout = wibox.layout.fixed.horizontal()

    awful.titlebar.widget.closebutton    (c),
    layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal}


    -- the original config
    -- awful.titlebar(c):setup {
    -- {
    --     awful.titlebar.iconwidget(c),
    --     layout = wibox.layout.fixed.horizontal
    -- },

	-- {
	--     layout = wibox.layout.fixed.horizontal(),
	-- },
	-- layout = wibox.layout.align.vertical
    -- }
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
	beautiful.titlebar_bg = beautiful.color8 end)

    client.connect_signal("unfocus", function(c) 
	beautiful.titlebar_bg = beautiful.color10 end)
end

return { setup = setup }
