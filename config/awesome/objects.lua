local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local dpi = beautiful.xresources.apply_dpi
local CONFDIR = awesome.conffile:match("(.*/)")
local naughty = require("naughty")
local CONST = require("constants")

-------------------------------------------------
--                  taglist                    --
-------------------------------------------------

Taglist = {
    {
        {
            {
                {
                    {
                        id = "index_role",
                        widget = wibox.widget.textbox
                    },
                    margins = 1,
                    widget = wibox.container.margin
                },
                bg = beautiful.color7,
                fg = beautiful.background,
                shape = gears.shape.square,
                widget = wibox.container.background
            },
            {
                id = "text_role",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal
        },
        right = 15,
        widget = wibox.container.margin
    },
    id = "background_role",
    widget = wibox.container.background,
    create_callback = function(self, c3, index, objects)
        self:get_children_by_id("index_role")[1].markup = "<b>  " .. index .. "  </b>"
    end
}

-------------------------------------------------
--                  buttons                    --
-------------------------------------------------
Titlebar_buttons = gears.table.join(
    awful.button({}, 1, function ()
        client.foccus = c
        c:raise()
        awful.mouse.client.move(c)
    end),

    awful.button({}, 3, function ()
        client.foccus = c
        c:raise()
        awful.mouse.client.resize(c)
    end)
)

Taglist_buttons = awful.button({}, 1, function (t)
    t:view_only()
end)

-------------------------------------------------
--                  widgets                    --
-------------------------------------------------

Myawesomemenu = {
    {
        "hotkeys",
        function ()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    {
        "manual",
        CONST.TERMINAL .. " -e man awesome",
    },
    {
        "edit config",
        CONST.EDITOR_CMD .. " " .. awesome.conffile,
    },
    {
        "quit",
        function ()
            awesome.quit()
        end
    }
}

Mymainmenu = awful.menu({
    items = {
        {
            "awesome",
            Myawesomemenu,
        },
        {
            "Start",
            CONST.SETUP,
        },
        {
            "Open terminal",
            CONST.TERMINAL
        }
    }
})

Mylauncher = awful.widget.launcher({
    menu = Mymainmenu
})

return {
    Taglist = Taglist,
    Taglist_buttons = Taglist_buttons,
    Titlebar_buttons = Titlebar_buttons,
    Myawesomemenu = Myawesomemenu,
    Mymainmenu = Mymainmenu,
    Mylauncher = Mylauncher
}
