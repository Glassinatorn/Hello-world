local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local vars = require("my_variables")
local hotkeys_popup = require("awful.hotkeys_popup")
--local client = require("client")
-- local awesome = require("awesome")
-- {{{ Key bindings
-- Globalkeys
local mysides = require("my_widgets").mysides
     
Globalkeys = gears.table.join(
    -- popups
    awful.key({vars.MODKEY}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
    awful.key({vars.MODKEY}, "u", function () awful.popup(mysides) end, {description = "show help", group = "awesome"}),
    -- client focus
    awful.key({vars.MODKEY}, "h", function() awful.client.focus.global_bydirection("left") end, {description = "focus client to the left", group = "client"}),
    awful.key({vars.MODKEY}, "j", function() awful.client.focus.global_bydirection("down") end, {description = "focus client below", group = "client"}),
    awful.key({vars.MODKEY}, "k", function() awful.client.focus.global_bydirection("up") end, {description = "focus client above", group = "client"}),
    awful.key({vars.MODKEY}, "l", function() awful.client.focus.global_bydirection("right") end, {description = "focus client to the right", group = "client"}),
    -- local layout
    awful.key({vars.MODKEY, "Shift"}, "h",
        function(c)
            awful.client.swap.global_bydirection("left", c, true)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "swap with client to the left", group = "client"}
    ),
    awful.key({vars.MODKEY, "Shift"}, "j",
        function()
            awful.client.swap.global_bydirection("down")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "swap with client below", group = "client"}
    ),
    awful.key({vars.MODKEY, "Shift"}, "k",
        function()
            awful.client.swap.global_bydirection("up")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "swap with client above", group = "client"}
    ),
    awful.key({vars.MODKEY, "Shift"}, "l",
        function()
            awful.client.swap.global_bydirection("right")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "swap with client to the right", group = "client"}
    ),
    awful.key({vars.MODKEY}, "[", function() awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
    awful.key({vars.MODKEY}, "]", function() awful.layout.inc(1) end, {description = "select next", group = "layout"}),

    -- global layout
    awful.key({vars.MODKEY, "Control"}, "h", function() awful.screen.focus_relative(1) end, {description = "focus the next screen", group = "screen"}),
    awful.key({vars.MODKEY, "Control"}, "l", function() awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
    awful.key({vars.MODKEY},
        "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}
    ),

    -- Standard program
    awful.key({vars.MODKEY, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({vars.MODKEY, "Shift"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"})
)

-- Clientkeys
Clientkeys =
    gears.table.join(
    awful.key({vars.MODKEY}, "f", function(c) c.fullscreen = not c.fullscreen c:raise() end, {description = "toggle fullscreen", group = "client"}),
    awful.key({vars.MODKEY}, "q", function(c) c:kill() end, {description = "close", group = "client"}),
    awful.key({vars.MODKEY, "Control"}, "space", awful.client.floating.toggle, {description = "toggle floating", group = "client"}),
    awful.key({vars.MODKEY}, "t", function(c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    Globalkeys =
        gears.table.join(
        Globalkeys,
        -- View tag only.
        awful.key({vars.MODKEY}, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #" .. i, group = "tag"}
        ),
        awful.key({vars.MODKEY, "Shift"}, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #" .. i, group = "tag"}
        )
    )
end

-- Clientbuttons
Clientbuttons =
    gears.table.join(
    awful.button({}, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end),
    awful.button({vars.MODKEY}, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end),
    awful.button({vars.MODKEY}, 3,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end)
)

