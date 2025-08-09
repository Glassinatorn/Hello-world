-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'


local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")


local function shaped_box(widget, height, width, shape)                           local shaped_box = wibox.widget {
    {                                                                                            widget,
    bg = beautiful.background,                                                           shape = shape or gears.shape.rounded_rect,
    forced_width = height or dpi(100),                                                   forced_height = width or dpi(100),
    widget = wibox.container.background,                                         },                                                                                   layout = wibox.layout.fixed.horizontal,                                          }
    return shaped_box
end                                                                             

return shaped_box
