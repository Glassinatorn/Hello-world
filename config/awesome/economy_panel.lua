local wibox = require("wibox")
local beautiful = require("beautiful")
local CONFDIR = awesome.conffile:match("(.*/)")
local dpi = beautiful.xresources.apply_dpi
local awful = require("awful")
local MOD = require("constants").MODKEY
local gears = require("gears")
local naughty = require("naughty")

local swedish_CPI = {
    {
        bg = beautiful.color4,
        widget = wibox.container.background
    },
    color = beautiful.color0,
    forced_height = dpi(270),
    left = dpi(5),
    bottom = dpi(5),
    right = dpi(5),
    top = dpi(5),
    widget = wibox.container.margin,
}

local usa_CPI = {
    {
        {
            image = CONFDIR .. "data/pictures/usa_cpi.png",
            resize = true,
            forced_width = dpi(380),
            forced_height = dpi(200),
            widget = wibox.widget.imagebox,
        },
        bg = beautiful.color4,
        widget = wibox.container.background
    },
    color = beautiful.color0,
    left = dpi(5),
    bottom = dpi(5),
    right = dpi(5),
    top = dpi(5),
    widget = wibox.container.margin,
}


local electricity_price_button = {
    {
        {
            markup = "Electricity price",
            font = "Monospace bold 23",
            fg = beautiful.color1,
            bg = beautiful.color8,
            valign = "center",
            halign = "center",
            widget = wibox.widget.textbox,
        },
        bg = beautiful.transparent,
        widget = wibox.container.background
    },
    color = beautiful.color4,
    bottom = dpi(5),
    widget = wibox.container.margin,
}

local electricity_price = {
    {
        {
            image = CONFDIR .. "data/pictures/electricity_price.png",
            resize = true,
            widget = wibox.widget.imagebox,
        },
        bg = beautiful.color4,
        widget = wibox.container.background
    },
    color = beautiful.color0,
    forced_height = dpi(270),
    left = dpi(5),
    bottom = dpi(5),
    right = dpi(5),
    top = dpi(5),
    widget = wibox.container.margin,
}

local CPI_button = {
    {
        {
            markup = "CPI",
            font = "Monospace bold 23",
            fg = beautiful.color1,
            bg = beautiful.color8,
            valign = "center",
            halign = "center",
            widget = wibox.widget.textbox,
        },
        bg = beautiful.transparent,
        widget = wibox.container.background,
    },
    color = beautiful.color4,
    bottom = dpi(4),
    widget = wibox.container.margin,
}

-- function that binds a info panel to primary screen
local function setup(s)
    -- panel to show all information for the system and link to 
    -- economy data and other things
    Economy_panel = wibox {
        screen = s,
        width = s.geometry.width,
        height = s.geometry.height,
        x = dpi(0),
        y = dpi(0),
        visible = true,
        ontop = true,
        bg = beautiful.color8,
    }

    -- putting widgets into place
    Economy_panel:setup {
        {
            {
                {
                    {
                        left = s.geometry.width * 0.45,
                        widget = wibox.container.margin,
                    },
                    CPI_button,
                    {
                        left = s.geometry.width * 0.4,
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                swedish_CPI,
                {
                    {
                        left = s.geometry.width * 0.37,
                        widget = wibox.container.margin,
                    },
                    electricity_price_button,
                    {
                        left = s.geometry.width * 0.4,
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                electricity_price,
                spacing = dpi(20),
                layout = wibox.layout.fixed.vertical,
            },
            margins = dpi(50),
            widget = wibox.container.margin,
        },
        bgimage = CONFDIR .. "info_panel_wallpaper.png",
        widget = wibox.container.background
    }

    -- keybinding to show the info panel
    -- global_keys = gears.table.join(global_keys, awful.key({MOD}, "i", function()
        -- Economy_panel.visible = not Economy_panel.visible end,
        -- {description = "toggle info panel", group = "awesome"}))

    return Economy_panel
end


return {
    setup = setup,
}
