-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local lain = require("lain")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
-- replacing naughty with dunst
-- local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Variable definitions
beautiful.init(os.getenv("HOME").."/.config/awesome/themes/glass/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "st"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    -- replacing neughty with dunst
    --naughty.notify({
    --    preset = naughty.config.presets.critical,
    --    title = "Oops, there were errors during startup!",
    --    text = awesome.startup_errors
    --})
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then
            return end
        in_error = true

        -- replacing naughty with dunst
       -- naughty.notify({
       --     preset = naughty.config.presets.critical,
       --     title = "Oops, an error happened!",
       --     text = tostring(err)
       -- })
        in_error = false
    end)
end
-- }}}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    lain.layout.centerwork,
    awful.layout.suit.fair.horizontal,
    -- available layouts:.tile.left, .tile.bottom, .tile.top, .fair,
    -- .fair.horizontal, .spiral, .spiral.dwindle, .max, .max.fullscreen,
    -- .magnifier, .corner.nw, .corner.ne, .corner.sw, .corner.se,
}
-- }}}


-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        { "open terminal", terminal }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
        awful.button({ }, 1, function(t)
                t:view_only()
            end),
        awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
        awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
    )

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true}
                )
            end
        end),
    awful.button({ }, 3, function()
            awful.menu.client_list({ theme = { width = 250 } })
        end),
    awful.button({ }, 4, function ()
            awful.client.focus.byidx(1)
        end),
    awful.button({ }, 5, function ()
            awful.client.focus.byidx(-1)
        end))

awful.screen.connect_for_each_screen(function(s)
    awful.tag.add("   code", {
        layout = lain.layout.centerwork,
        master_fill_policy = "master_width_factor",
        gap_single_client = true,
        screen = s,
        selected = true,
    })
    awful.tag.add("   webb", {
        master_fill_policy = "master_width_factor",
        gap_single_client = true,
        screen = s,
    })
    awful.tag.add("   music", {
        master_fill_policy = "master_width_factor",
        gap_single_client = true,
        screen = s,
    })


    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        bg = "#000000",

        --style = {
        --    shape = gears.shape.square
        --},
        --layout = {
        --    --spacing = -14,
        --    spacing_widget = {
        --        shape = gears.shape.square,
        --        widget = wibox.widget.seperator,
        --    },
        --    layout = wibox.layout.fixed.horizontal
        --},
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = "index_role",
                                widget = wibox.widget.textbox,
                            },
                            margins = 1,
                            widget = wibox.container.margin,
                        },
                        bg = "#ececec",
                        shape = gears.shape.square,
                        widget = wibox.container.background,
                    },
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                right = 15,
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                self:get_children_by_id("index_role")[1].markup = "<b>  "..index.."  </b>"
            end,
        },
        --buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        screen = s,
        stretch = false,
        height = beautiful.wibar_height,
        width = beautiful.wibar_width,
        bg = beautiful.transparent,
        border_color = "#00000000",
        border_width = 10
    })


    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --mylauncher,
            s.mytaglist,
            --s.mypromptbox,
        },
--         s.mytasklist, -- Middle widget
--         { -- Right widgets
--             layout = wibox.layout.fixed.horizontal,
--             mykeyboardlayout,
--             wibox.widget.systray(),
--             mytextclock,
--             s.mylayoutbox,
--         },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

        -- client focus
    awful.key({ modkey }, "h", function ()
            awful.client.focus.bydirection("left")
        end,
        {description = "focus client to the left", group = "client"}),
    awful.key({ modkey }, "j", function ()
            awful.client.focus.bydirection("down")
        end,
        {description = "focus client below", group = "client"}),
    awful.key({ modkey }, "k", function ()
            awful.client.focus.bydirection("up")
        end,
        {description = "focus client above", group = "client"}),
    awful.key({ modkey }, "l", function ()
            awful.client.focus.bydirection("right")
        end,
        {description = "focus client to the right", group = "client"}),

    -- local layout
    awful.key({ modkey, "Shift" }, "h", function (c)
            awful.client.swap.bydirection("left", c, true)
            if client.focus then client.focus:raise() end
        end,
        {description = "swap with client to the left", group = "client"}),
    awful.key({ modkey, "Shift" }, "j", function ()
            awful.client.swap.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "swap with client below", group = "client"}),
    awful.key({ modkey, "Shift" }, "k", function ()
            awful.client.swap.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "swap with client above", group = "client"}),
    awful.key({ modkey, "Shift" }, "l", function ()
            awful.client.swap.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "swap with client to the right", group = "client"}),
    awful.key({ modkey }, "[", function ()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}),
    awful.key({ modkey }, "]", function ()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}),

    -- global layout
    awful.key({ modkey, "Control" }, "h", function ()
            awful.screen.focus_relative(1)
        end,
        {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "l", function ()
            awful.screen.focus_relative(-1)
        end,
        {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey }, "Tab", function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"})
)

clientkeys = gears.table.join(
     awful.key({ modkey }, "f", function (c)
             c.fullscreen = not c.fullscreen
             c:raise()
         end,
         {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey}, "q", function (c)
            c:kill()
        end,
        {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
        {description = "toggle floating", group = "client"}),
    awful.key({ modkey }, "t", function (t)
            c.ontop = not c.ontop
        end,
        {description = "toggle keep on top", group = "client"})

)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9, function ()
                  local screen = awful.screen.focused()
                  local tag = screen.tags[i]
                  if tag then
                     tag:view_only()
                  end
            end,
            {description = "view tag #"..i, group = "tag"}),
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
               end
            end,
            {description = "move focused client to tag #"..i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click",
                          {raise = true})
        end),
    awful.button({ modkey }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click",
                          {raise = true})
            awful.mouse.client.move(c)
        end),
    awful.button({ modkey }, 3, function (c)
            c:emit_signal("request::activate", "mouse_click",
                          {raise = true})
            awful.mouse.client.resize(c)
        end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    -- Floating clients.
    { rule_any =
        {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            },
            role = {
                "AlarmWindow",  -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
        }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
        }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
                c:emit_signal("request::activate", "titlebar",
                              {raise = true})
                awful.mouse.client.move(c)
            end),
        awful.button({ }, 3, function()
                c:emit_signal("request::activate", "titlebar",
                              {raise = true})
                awful.mouse.client.resize(c)
            end)
    )

  awful.titlebar(c) : setup {
      { -- Left
          --awful.titlebar.widget.iconwidget(c),
          buttons = buttons,
          layout  = wibox.layout.fixed.horizontal
      },
     -- { -- Middle
     --     { -- Title
     --         align  = "center",
     --         widget = awful.titlebar.widget.titlewidget(c)
     --     },
     --     buttons = buttons,
     --     layout  = wibox.layout.flex.horizontal
     -- },
      { -- Right
          --awful.titlebar.widget.floatingbutton (c),
          --awful.titlebar.widget.maximizedbutton(c),
          --awful.titlebar.widget.stickybutton   (c),
          --awful.titlebar.widget.ontopbutton    (c),
          --awful.titlebar.widget.closebutton    (c),
          layout = wibox.layout.fixed.horizontal()
      },
      layout = wibox.layout.align.horizontal
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
        c:emit_signal("request::activate", "mouse_enter", {raise = false})
    end)
client.connect_signal("focus", function(c)
        --c.border_color = beautiful.border_focus
        awful.titlebar.toggle(c)
    end)
client.connect_signal("unfocus", function(c)
        --c.border_color = beautiful.border_normal
        awful.titlebar.toggle(c)
    end)
-- }}}
