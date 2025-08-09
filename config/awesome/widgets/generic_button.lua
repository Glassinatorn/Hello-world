-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local create_generic_box = require("widgets.generic_box")


local function generic_button(text, size)
    local text = wibox.widget {
        {
            {
                markup = text,
                font = "monospace bold " .. tostring(size),
                widget = wibox.widget.textbox,
            },
            bg = beautiful.transparent,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal
    }

    local button = create_generic_box(text, 0, size + dpi(100), size + dpi(50))

    return button
end

return generic_button
