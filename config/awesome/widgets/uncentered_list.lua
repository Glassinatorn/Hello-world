-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local function uncentered_list(title)
    local list = wibox.widget {
        {
            {
                markup = "  " .. title .. "  ",
                forced_width = dpi(175),
                widget = wibox.widget.textbox,
            },
            color = beautiful.color4,
            bottom = dpi(3),
            widget = wibox.container.margin,
        },
        {
            id = "list",
            markup = "",
            widget = wibox.widget.textbox,
        },
        layout = wibox.layout.fixed.vertical
    }

    return list
end

return uncentered_list
