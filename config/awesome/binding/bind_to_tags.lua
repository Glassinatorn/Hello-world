-- standard awesome libraries
local gears = require("gears")
local awful = require("awful")

local _M = {}

function _M.get()
    local global_buttons = gears.table.join(
	awful.button({}, 3, function () Config.main_menu:toggle() end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
    )

    return global_buttons
end

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
