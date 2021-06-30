local home = os.getenv("HOME")


local _M = {}

function _M.get ()
    -- default terminal
    terminal = "st",

    -- default modkey
    modkey = "Mod4",

    return {
	terminal = terminal,
	modkey = modkey
    }
end


return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
