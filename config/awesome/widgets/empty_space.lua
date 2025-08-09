-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local function empty_space()
    local widget = {
        markup = "", forced_width = dpi(1), widget = wibox.widget.textbox
    }
    return widget
end

return empty_space
