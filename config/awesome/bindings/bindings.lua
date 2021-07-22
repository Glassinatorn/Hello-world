local gears = require("gears")
local awful = require("awful")
local vars = require("main.variables")
local hotkeys_popup = require("awful.hotkeys_popup")

local mysides = require("widgets.widgets").mysides
     
-- wrapper for client focus
local function focus_tag_wrapper(direction)
    awful.client.focus.global_bydirection(direction)
end

-- wrapper for client swap
local function swap_tag_wrapper(direction, c)
    awful.client.swap.global_bydirection(direction, c, true)
    if client.focus then
	client.focus:raise()
    end
end

-- client focus based on history
local function history_focus()
    awful.client.focus.history.previous()
    if client.focus then
	client.focus:raise()
    end
end

-- toggle fullscreen for selected client
local function toggle_fullscreen(c)
    c.fullscreen = not 
    c.fullscreen 
    c:raise()
end

-- go to tag
local function move_to_tag(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
	tag:view_only()
    end
end

-- send client to tag
local function send_to_tag(i)
    if client.focus then
	local tag = client.focus.screen.tags[i]
	if tag then
	    client.focus:move_to_tag(tag)
	end
    end
end

-- move client with mouse
local function mouse_move_client(client)
    client:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(client)
end

-- resize client with mouse
local function mouse_resize_client(client)
    client:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(client)
end

-- globalkeys
Globalkeys = gears.table.join(
    -- popups
    awful.key({vars.MODKEY}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
    awful.key({vars.MODKEY}, "u", function () awful.popup(mysides) end, {description = "show help", group = "awesome"}),

    -- client focus
    awful.key({vars.MODKEY}, "h", function() focus_tag_wrapper("left") end, {description = "focus client to the left", group = "client"}),
    awful.key({vars.MODKEY}, "j", function() focus_tag_wrapper("down") end, {description = "focus client below", group = "client"}),
    awful.key({vars.MODKEY}, "k", function() focus_tag_wrapper("up") end, {description = "focus client above", group = "client"}),
    awful.key({vars.MODKEY}, "l", function() focus_tag_wrapper("right") end, {description = "focus client to the right", group = "client"}),

    -- local layout
    awful.key({vars.MODKEY, "Shift"}, "h", function(c) swap_tag_wrapper("left", c) end, {description = "swap with client to the left", group = "client"}),
    awful.key({vars.MODKEY, "Shift"}, "j", function() swap_tag_wrapper("down", c) end, {description = "swap with client below", group = "client"}),
    awful.key({vars.MODKEY, "Shift"}, "k", function() swap_tag_wrapper("up", c) end, {description = "swap with client above", group = "client"}),
    awful.key({vars.MODKEY, "Shift"}, "l", function() swap_tag_wrapper("right", c) end, {description = "swap with client to the right", group = "client"}),

    -- change layout scheme
    awful.key({vars.MODKEY}, "[", function() awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),
    awful.key({vars.MODKEY}, "]", function() awful.layout.inc(1) end, {description = "select next", group = "layout"}),

    -- focus based on history
    awful.key({vars.MODKEY}, "Tab", function() history_focus() end, {description = "go back", group = "client"}),

    -- Standard program
    awful.key({vars.MODKEY, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({vars.MODKEY, "Shift"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"})
)

-- clientkeys
Clientkeys =
    gears.table.join(
    awful.key({vars.MODKEY}, "f", function(c) toggle_fullscreen(c) end, {description = "toggle fullscreen", group = "client"}),
    awful.key({vars.MODKEY}, "q", function(c) c:kill() end, {description = "close", group = "client"}),
    awful.key({vars.MODKEY, "Control"}, "space", awful.client.floating.toggle, {description = "toggle floating", group = "client"}),
    awful.key({vars.MODKEY}, "t", function(c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"})
)

-- make taglist clickable
local taglist_buttons = awful.button({}, 1, function(t) t:view_only() end)

-- Clientbuttons
Clientbuttons =
    gears.table.join(
	awful.button({}, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
	awful.button({vars.MODKEY}, 1, function(c) mouse_move_client(c) end),
	awful.button({vars.MODKEY}, 3, function(c) mouse_resize_client(c) end)
)

local function setup()
    -- Bind all key numbers to tags.
    for i = 1, 9 do
	Globalkeys =
	    gears.table.join(
	    Globalkeys,
	    -- view tag
	    awful.key({vars.MODKEY}, "#" .. i + 9,
		function() move_to_tag(i) end,
		{description = "view tag #" .. i, group = "tag"}
	    ),
	    -- send to tag
	    awful.key({vars.MODKEY, "Shift"}, "#" .. i + 9,
		function() send_to_tag(i) end,
		{description = "move focused client to tag #" .. i, group = "tag"}
	    )
	)
    end

    -- Mouse bindings
    root.buttons(
	gears.table.join(
	    awful.button({}, 3, function() Mymainmenu:toggle() end),
	    awful.button({}, 4, awful.tag.viewnext),
	    awful.button({}, 5, awful.tag.viewprev)
	)
    )

    -- Set keys
    root.keys(Globalkeys)
end

return {
    setup = setup,
    Globalkeys = Globalkeys,
    Clientkeys = Clientkeys,
    taglist_buttons = taglist_buttons,
    Clientbuttons = Clientbuttons,
}
