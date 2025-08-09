-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")

local empty_space = require("widgets.empty_space")

local function centered_column(widget)
    local centered_column = wibox.widget {
        {
            empty_space(),
            widget,
            empty_space(),
            expand = "none",
            layout = wibox.layout.align.vertical
        },
        widget = wibox.widget.background
    }

    return centered_column
end

return centered_column
