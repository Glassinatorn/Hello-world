-- standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = Config.vars.modkey

function _M.get()
    local client_button = gears.table.join(
    awful.button({}, 1, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
    awful.button({ modkey }, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.move(c) end),
    awful.button({ modkey }, 3, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end),
    awful.button({ modkey }, "f", function(c) c.fullscreen = not c.fullscreen c:raise() end, {description = "toggle fullscreen", group = "client"})
    )
    return client_button
end


return setmetatable({}, {__call = function(_, ...) return _M.get(...) end})
