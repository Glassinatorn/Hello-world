local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local functions = require("functions")
local MOD = require("constants").MODKEY

-- Global bindings
global_keys = gears.table.join(
    -- popups
    awful.key({MOD},            "s", hotkeys_popup.show_help,                               {description = "show help", group = "awesome"}),

    -- client focus
    awful.key({MOD},            "h", function() functions.focus_tag_wrapper("left") end,    {description = "focus client to the left", group = "client"}),
    awful.key({MOD},            "j", function() functions.focus_tag_wrapper("down") end,    {description = "focus client below", group = "client"}),
    awful.key({MOD},            "k", function() functions.focus_tag_wrapper("up") end,      {description = "focus client above", group = "client"}),
    awful.key({MOD},            "l", function() functions.focus_tag_wrapper("right") end,   {description = "focus client to the right", group = "client"}),

    -- local layout
    awful.key({MOD, "Shift"},   "h", function() functions.swap_tag_wrapper("left", c) end,  {description = "swap with client to the left", group = "client"}),
    awful.key({MOD, "Shift"},   "j", function() functions.swap_tag_wrapper("down", c) end,  {description = "swap with client below", group = "client"}),
    awful.key({MOD, "Shift"},   "k", function() functions.swap_tag_wrapper("up", c) end,    {description = "swap with client above", group = "client"}),
    awful.key({MOD, "Shift"},   "l", function() functions.swap_tag_wrapper("right", c) end, {description = "swap with client to the right", group = "client"}),

    -- change layout scheme
    awful.key({MOD},            "[", function() awful.layout.inc(-1) end,                   {description = "select previous", group = "layout"}),
    awful.key({MOD},            "]", function() awful.layout.inc(1) end,                    {description = "select next", group = "layout"}),

    -- focus based on history
    awful.key({MOD},            "Tab", function() functions.history_focus() end,            {description = "go back", group = "client"}),

    -- Standard program
    awful.key({MOD, "Control"}, "r", awesome.restart,                                       {description = "reload awesome", group = "awesome"}),
    awful.key({MOD, "Shift"},   "q", awesome.quit,                                          {description = "quit awesome", group = "awesome"})
)

-- Client bindings
client_keys = gears.table.join(
    awful.key({MOD},            "f", function(c) functions.toggle_fullscreen(c) end,        {description = "toggle fullscreen", group = "client"}),
    awful.key({MOD},            "q", function(c) c:kill() end,                              {description = "close", group = "client"}),
    awful.key({MOD, "Control"}, "space", awful.client.floating.toggle,                      {description = "toggle floating", group = "client"}),
    awful.key({MOD},            "t", function(c) c.ontop = not c.ontop end,                 {description = "toggle keep on top", group = "client"})
)

-- Mouse bindings
client_buttons = gears.table.join(
    awful.button({},            1, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
    awful.button({MOD},         1, function(c) functions.mouse_move_client(c) end),
    awful.button({MOD},         3, function(c) functions.mouse_resize_client(c) end)
)

mouse_buttons = gears.table.join(
    awful.button({},            3, function() Mymainmenu:toggle() end),
    awful.button({},            4, awful.tag.viewnext),
    awful.button({},            5, awful.tag.viewprev)
)
-- make keybindings per screen
local function setup_keybindings()
    -- add bindings for each tag
    for i = 1, 9 do
        global_keys = gears.table.join(global_keys,
            awful.key({MOD},            "#" .. i + 9, function() functions.move_to_tag(i) end, { description = "view tag #" .. i,                   group = "tag" }),
            awful.key({MOD, "Shift"},   "#" .. i + 9, function() functions.send_to_tag(i) end, { description = "move focused client to tag #" .. i, group = "tag" })
        )
    end

    -- adding mouse bindings
    root.buttons(mouse_buttons)

    -- adding all keybindings
    root.keys(global_keys)
end

return {
    global_keys = global_keys,
    client_keys = client_keys,
    client_buttons = client_buttons,
    mouse_buttons = mouse_buttons,
    setup_keybindings = setup_keybindings
}
