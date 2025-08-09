-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local function seperator()
    local seperator = {
        {
            markup = "",
            forced_width = dpi(1),
            widget = wibox.widget.textbox,
        },
        color = beautiful.color4,
        right = dpi(4),
        widget = wibox.container.margin,
    }

    return seperator
end

return seperator
