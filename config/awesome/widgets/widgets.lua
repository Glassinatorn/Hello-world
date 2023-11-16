local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local vars = require("main.variables")
local menu = require("widgets.menu")

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
    visible = true,
}

return {
    mysides = mysides,
}
