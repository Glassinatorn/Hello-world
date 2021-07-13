local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local vars = require("main.variables")
local menu = require("main.menu")

-- sidebar widget
local mysides = {
        widget = {
            {
                {
                    markup = "<b>Tasks</b>",
                    widget = wibox.widget.textbox,
                    align = "center",
                    bg = "#ececec",
                },
                layout = wibox.layout.fixed.vertical,
            },
            margins = 10,
            widget  = wibox.container.margin,
         },
    ontop = true,
    x = 10,
    y = 10,
    visible = false,
}

-- clock 
local clock = {
    widget = wibox.widget.textclock("%H %M"),
    align = "center",
    valign = "center",
}

-- buttons for the taglist
local taglist_buttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(t)
            t:view_only()
        end
    ),
    awful.button(
        {vars.MODKEY},
        1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button(
        {vars.MODKEY},
        3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button(
        {},
        4,
        function(t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button(
        {},
        5,
        function(t)
            awful.tag.viewprev(t.screen)
        end
    )
)


return { 
    mysides = mysides,
    clock = clock,
    taglist_buttons = taglist_buttons,
}
