-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")

local function create_hw_bar(image, fill_color)
    local bar = wibox.widget { -- battery
        {
            image = image,
            resize = true,
            forced_height = dpi(20),
            forced_width = dpi(22),
            widget = wibox.widget.imagebox
        },
        {
            id = "value",
            max_value       = 100,
            value           = 20,
            shape           = gears.shape.rectangle,
            color           = fill_color,
            background_color = beautiful.color4,
            border_width    = dpi(4),
            border_color    = beautiful.color8,
            border          = dpi(2),
            widget          = wibox.widget.progressbar,
        },
        {
            id = "text",
            markup = "",
            widget = wibox.widget.textbox,
        },
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal,
    }

    return bar
end

return create_hw_bar
