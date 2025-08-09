-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local function generic_box(widget, margins, width, height)
    local box_widget = wibox.widget {
        {
            {
                {
                    {
                        widget,
                        bg = beautiful.background,
                        widget = wibox.container.background,
                    },
                    color = beautiful.background,
                    margins = margins,
                    widget = wibox.container.margin,
                },
                color = beautiful.color0,
                margins = dpi(5),
                widget = wibox.container.margin,
            },
            bg = beautiful.background,
            forced_height = height,
            forced_width = width,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal
    }

    return box_widget
end

return generic_box
