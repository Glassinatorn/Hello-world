local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
-- local client = require("client")
local beautiful = require("beautiful")
local vars = require("my_variables")

local mysides = {
        widget = {
            {
                {
                    markup = "<b>Tasks</b>",
                    widget = wibox.widget.textbox,
                    align = "center",
                    bg = "#ececec",
                },
                layout = wibox.layout.fixed.vertical,
            },
            margins = 10,
            widget  = wibox.container.margin,
         },
    ontop = true,
    x = 10,
    y = 10,
    visible = false,
}
--
-- create buttons for the taglist
local taglist_buttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(t)
            t:view_only()
        end
    ),
    awful.button(
        {vars.MODKEY},
        1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button(
        {vars.MODKEY},
        3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button(
        {},
        4,
        function(t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button(
        {},
        5,
        function(t)
            awful.tag.viewprev(t.screen)
        end
    )
)

-- -- Create a taglist widget
-- local taglist =
--     awful.widget.taglist {
--     filter = awful.widget.taglist.filter.all,
--     buttons = taglist_buttons,
--     bg = "#000000",
--     --style = {
--     --    shape = gears.shape.square
--     --},
--     --layout = {
--     --    --spacing = -14,
--     --    spacing_widget = {
--     --        shape = gears.shape.square,
--     --        widget = wibox.widget.seperator,
--     --    },
--     --    layout = wibox.layout.fixed.horizontal
--     --},
--     widget_template = {
-- 	{
-- 	    {
-- 		{
-- 		    {
-- 			{
-- 			    id = "index_role",
-- 			    widget = wibox.widget.textbox
-- 			},
-- 			margins = 1,
-- 			widget = wibox.container.margin
-- 		    },
-- 		    bg = beautiful.bg_normal,--"#ececec",
-- 		    shape = gears.shape.square,
-- 		    widget = wibox.container.background
-- 		},
-- 		{
-- 		    id = "text_role",
-- 		    widget = wibox.widget.textbox
-- 		},
-- 		layout = wibox.layout.fixed.horizontal
-- 	    },
-- 	    right = 15,
-- 	    widget = wibox.container.margin
-- 	},
-- 	id = "background_role",
-- 	widget = wibox.container.background,
-- 	create_callback = function(self, c3, index, objects)
-- 	    self:get_children_by_id("index_role")[1].markup = "<b>  " .. index .. "  </b>"
-- 	end
--     }
--     --buttons = taglist_buttons
-- }



return { 
    mysides = mysides,
    -- taglist = taglist,
    taglist_buttons = taglist_buttons
}
