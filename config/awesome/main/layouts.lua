-- standard awesome module
local awful = require("awful")
local lain = require("lain")

local _M = {}

function _M.get ()
    local layouts = {
	awful.layout.suit.floating,
	lain.layout.centerwork,
	awful.layout.suit.fair.horizontal
    }

    return layouts
end

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
