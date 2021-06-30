-- standard libraries
local gears = require("gears")
local awful = require("awful")
local awesome = require("awesome")

local _M = {}

function _M.get()
    local global_keys = gears.table.join(
    awful.key({modkey,}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
    awful.key({modkey,}, "p", function() menubar.show() end, {description = "show the menubar", group = "launcher"}),
    awful.key({modkey,}, "Return", function () awful.spawn(terminal) end, {description = "open a terminal", group = "launcher"}),
    awful.key({modkey, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({modkey, "Control"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),
    -- window navigation
    awful.key({Modkey}, "h", function() awful.client.focus.bydirection("left") end, {description = "focus client to the left", group = "client"}),
    awful.key({modkey}, "j", function() awful.client.focus.bydirection("down") end, {description = "focus client below", group = "client"}),
    awful.key({modkey}, "k", function() awful.client.focus.bydirection("up") end, {description = "focus client above", group = "client"}),
    awful.key({modkey}, "l", function() awful.client.focus.bydirection("right") end, {description = "focus client to the right", group = "client"}),
    awful.key({modkey,}, "q", function (c) c:kill() end, {description = "close", group = "client"}),
    awful.key({modkey, "Shift"}, "h", function(c) awful.client.swap.bydirection("left", c, true) if client.focus then client.focus:raise() end end, {description = "swap with client to the left", group = "client"}),
    awful.key({modkey, "Shift"}, "j", function() awful.client.swap.global_bydirection("down") if client.focus then client.focus:raise() end end, {description = "swap with client below", group = "client"}),
    awful.key({modkey, "Shift"}, "k", function() awful.client.swap.global_bydirection("up") if client.focus then client.focus:raise() end end, {description = "swap with client above", group = "client"}),
    awful.key({modkey, "Shift"}, "l", function() awful.client.swap.global_bydirection("right") if client.focus then client.focus:raise() end end, {description = "swap with client to the right", group = "client"}),
    -- global layout
    awful.key({modkey, "Control"}, "h", function() awful.screen.focus_relative(1) end, {description = "focus the next screen", group = "screen"}),
    awful.key({modkey, "Control"}, "l", function() awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
    awful.key({modkey}, "Tab", function() awful.client.focus.history.previous() if client.focus then client.focus:raise() end end, {description = "go back", group = "client"}),
    -- tag navigation
    -- -- 
    awful.key({modkey}, "[", function() awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
    awful.key({modkey}, "]", function() awful.layout.inc(1) end, {description = "select next", group = "layout"}),
    )
    return global_keys
end

return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})

-- -- for language server
-- local client = require("client")
-- local gears = require("gears")
-- local awful = require("awful")
-- 
-- -- hotkey bindings from awful module
-- local hotkeys_popup = require("awful.hotkeys_popup")
-- 
-- -- own widgets and popups
-- local own_popups = require("..widgets.popups")
-- 
-- -- definind super/modkey
-- Modkey = "Mod4"
-- 
-- -- global key bindings
-- Globalkeys =
--     gears.table.join(
--     -- popups
--     awful.key({Modkey}, "s", hotkeys_popup.show_help,
--         {description = "show help", group = "awesome"}),
--     awful.key({Modkey}, "u", function ()
--             awful.popup(own_popups.mysides)
--         end, {description = "show help", group = "awesome"}),
--     -- client focus
--     awful.key(
--         {Modkey},
--         "h",
--         function()
--             awful.client.focus.bydirection("left")
--         end,
--         {description = "focus client to the left", group = "client"}
--     ),
--     awful.key(
--         {Modkey},
--         "j",
--         function()
--             awful.client.focus.bydirection("down")
--         end,
--         {description = "focus client below", group = "client"}
--     ),
--     awful.key(
--         {Modkey},
--         "k",
--         function()
--             awful.client.focus.bydirection("up")
--         end,
--         {description = "focus client above", group = "client"}
--     ),
--     awful.key(
--         {Modkey},
--         "l",
--         function()
--             awful.client.focus.bydirection("right")
--         end,
--         {description = "focus client to the right", group = "client"}
--     ),
--     -- local layout
--     awful.key(
--         {Modkey, "Shift"},
--         "h",
--         function(c)
--             awful.client.swap.bydirection("left", c, true)
--             if client.focus then
--                 client.focus:raise()
--             end
--         end,
--         {description = "swap with client to the left", group = "client"}
--     ),
--     awful.key(
--         {Modkey, "Shift"},
--         "j",
--         function()
--             awful.client.swap.global_bydirection("down")
--             if client.focus then
--                 client.focus:raise()
--             end
--         end,
--         {description = "swap with client below", group = "client"}
--     ),
--     awful.key(
--         {Modkey, "Shift"},
--         "k",
--         function()
--             awful.client.swap.global_bydirection("up")
--             if client.focus then
--                 client.focus:raise()
--             end
--         end,
--         {description = "swap with client above", group = "client"}
--     ),
--     awful.key(
--         {Modkey, "Shift"},
--         "l",
--         function()
--             awful.client.swap.global_bydirection("right")
--             if client.focus then
--                 client.focus:raise()
--             end
--         end,
--         {description = "swap with client to the right", group = "client"}
--     ),
--     awful.key(
--         {Modkey},
--         "[",
--         function()
--             awful.layout.inc(-1)
--         end,
--         {description = "select previous", group = "layout"}
--     ),
--     awful.key(
--         {Modkey},
--         "]",
--         function()
--             awful.layout.inc(1)
--         end,
--         {description = "select next", group = "layout"}
--     ),
--     -- global layout
--     awful.key(
--         {Modkey, "Control"},
--         "h",
--         function()
--             awful.screen.focus_relative(1)
--         end,
--         {description = "focus the next screen", group = "screen"}
--     ),
--     awful.key(
--         {Modkey, "Control"},
--         "l",
--         function()
--             awful.screen.focus_relative(-1)
--         end,
--         {description = "focus the previous screen", group = "screen"}
--     ),
--     awful.key(
--         {Modkey},
--         "Tab",
--         function()
--             awful.client.focus.history.previous()
--             if client.focus then
--                 client.focus:raise()
--             end
--         end,
--         {description = "go back", group = "client"}
--     ),
--     -- Standard program
--     awful.key({Modkey, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
--     awful.key({Modkey, "Shift"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"})
-- )
-- -- client bindings
-- -- client bindings
-- -- client bindings
-- -- client bindings
