-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")

local create_centered_line = require("widgets.centered_line")
local create_generic_box = require("widgets.generic_box")

local function centered_box(widgets, margins, spacing, width, height)
    local centered_box = wibox.layout.flex.vertical()
    centered_box.spacing = spacing
    centered_box.expand = "none"

    if width ~= nil then
        centered_box.forced_width = width
    end

    if height ~= nil then
        centered_box.forced_width = width
    end

    for i=1,#widgets do
        local centered_line = create_centered_line(widgets[i])
        centered_box:add(centered_line)
    end

    centered_box = create_generic_box(centered_box, margins, width, height)
    return centered_box
end

return centered_box
