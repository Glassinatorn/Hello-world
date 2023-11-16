local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local lain = require("lain")
local beautiful = require("beautiful")
local bindings = require("bindings.bindings")
mykeyboardlayout = awful.widget.keyboardlayout()


-- template for taglist in the wibox
local taglist_template = {
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

local function setup(s)
    -- connect tags and wibar for each screen
    awful.screen.connect_for_each_screen(
	function(s)
	-- each screen has its own tag table.
	awful.tag.add("   code", {
	    layout = lain.layout.centerwork,
	    master_fill_policy = "master_width_factor",
	    gap_single_client = true,
	    screen = s,
	    selected = true
	})
	awful.tag.add("   webb", {
	    master_fill_policy = "master_width_factor",
	    gap_single_client = true,
	    screen = s
	})
	awful.tag.add("   music", {
	    master_fill_policy = "master_width_factor",
	    gap_single_client = true,
	    screen = s
	})
	awful.tag.add("   extra", {
	    master_fill_policy = "master_width_factor",
	    gap_single_client = true,
	    screen = s
	})

	-- create a taglist widget
	s.mytaglist = awful.widget.taglist {
	    screen = s,
	    filter = awful.widget.taglist.filter.all,
	    buttons = bindings.taglist_buttons,
	    widget_template = taglist_template,
	}

	-- create the wibox
	s.mywibox = awful.wibar({ 
	    screen = s,
	    stretch = false,
	    height = beautiful.wibar_height,
	    width = beautiful.wibar_width,
	    bg = beautiful.transparent,
	    shape = gears.shape.rectangle,
	})

	-- add widgets to the wibox
	s.mywibox:setup {
	    layout = wibox.layout.align.horizontal,
	    {
		-- left widgets
		layout = wibox.layout.fixed.horizontal,
		s.mytaglist
	    }
	}
    end)
end

return { setup = setup }
