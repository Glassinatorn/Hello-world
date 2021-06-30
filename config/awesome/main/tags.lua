local awful = require("awful")
local Config = require("")

local _M = {}

function _M.get()
    local tags = {}

    names = { 
	"    code", 
	"    webb", 
	"    music", 
    }

    layout = {
	Config.layouts[2],
	Config.layouts[1],
	Config.layouts[1],
    }

    awful.screen.connect_for_each_screen(function(s)
	-- each screen has it's own tag table
	tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
    end)

    return tags
end

-- defining function to return values with from this module
return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
