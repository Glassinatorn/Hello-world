-- standard awesome library
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local vars = require("main.variables")


-- Submenu
Myawesomemenu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    {"manual", vars.TERMINAL .. " -e man awesome"},
    {"edit config", vars.EDITOR_CMD .. " " .. awesome.conffile},
    {
        "quit",
        function()
            awesome.quit()
        end
    }
}

-- Main menu
Mymainmenu =
    awful.menu(
    {
        items = {
            {"Awesome", Myawesomemenu, beautiful.awesome_icon},
            {"Open terminal", vars.TERMINAL},
            {"Open sidebar", function () end}
        }
    }
)

-- Launcher
Mylauncher =
    awful.widget.launcher(
    {
        image = beautiful.awesome_icon,
        menu = Mymainmenu
    }
)

return {
    Myawesomemenu = Myawesomemenu,
    Mymainmenu = Mymainmenu,
    Mylauncher = Mylauncher
}
