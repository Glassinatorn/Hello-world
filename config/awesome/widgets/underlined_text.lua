-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local function underlined_text(text, color, size)
    local text_widget = wibox.widget {
        {
            {
                {
                    markup = text,
                    font = "monospace bold " .. (tostring(size) or "10"),
                    id = "text",
                    widget = wibox.widget.textbox,
                },
                bg = beautiful.transparent,
                widget = wibox.container.background,
            },
            color = color or beautiful.color4,
            bottom = dpi(5),
            id = "underline",
            widget = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal
    }

    return text_widget
end


return underlined_text
