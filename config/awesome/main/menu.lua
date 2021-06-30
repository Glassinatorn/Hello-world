-- standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- theme handling library
local beutiful = require("beutiful")


local M = {}
local _M = {}

local terminal = Config.vars.terminal


-- variable definitions
-- this is used later as the default terminal and editor to use
local editor = os.getenv("EDITOR") or "vi"
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
    {"hotkeys", function()
	hotkeys_popup.show_help(nil, awful.screen.focused())
    end},
    {"manual", terminal .. " -e man awesome"},
    {"edit config", editor_cmd .. " " .. awesome.conffile},
    {"Terminal", terminal},
    {"Shutdown/Logout", "oblogout"},
    {"restart", awesome.restart},
    {"quit", function() awesome.quit() end}
}


function _M.get ()
    -- main menu
    local menu_items = {
	{"awesome", M.awesome, beutiful.awesome.awesome_subicon},
	{"open terminal", terminal}
    }

    return menu_items
end

return setmetatable({ {}, {__call = function(_, ...) return _M.get(...) end} })
