-- awesomewm libraries
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Signal function to execute when a new client appears.
client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end
)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
    "request::titlebars",
    function(c)
        -- creating the titlebar
        awful.titlebar(c):setup {
            {
                layout = wibox.layout.fixed.horizontal()
            },
            layout = wibox.layout.align.horizontal
        }
    end
)

-- Focus signals
client.connect_signal(
    "focus",
    function(c)
        --c.border_color = beautiful.border_focus
        awful.titlebar.toggle(c)
    end
)
client.connect_signal(
    "unfocus",
    function(c)
        --c.border_color = beautiful.border_normal
        awful.titlebar.toggle(c)
    end
)
