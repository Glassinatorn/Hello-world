-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")
local beautiful = require("beautiful")
local CONFDIR = awesome.conffile:match("(.*/)")
local dpi = beautiful.xresources.apply_dpi
local awful = require("awful")
local MOD = require("constants").MODKEY
local gears = require("gears")
local helpful_functions = require("helpful")
local naughty = require("naughty")

local function create_underlined_text(text, color, size)
    local underlined_text = wibox.widget {
        {
            {
                {
                    markup = text,
                    font = "monospace bold " .. (tostring(size) or "10"),
                    id = "text",
                    widget = wibox.widget.textbox,
                },
                bg = beautiful.transparent,
                widget = wibox.container.background,
            },
            color = color or beautiful.color4,
            bottom = dpi(5),
            id = "underline",
            widget = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal
    }

    return underlined_text
end


local function create_generic_box(widget, margins, width, height)
    local generic_box = wibox.widget {
        {
            {
                {
                    {
                        widget,
                        bg = beautiful.background,
                        widget = wibox.container.background,
                    },
                    color = beautiful.background,
                    margins = margins,
                    widget = wibox.container.margin,
                },
                color = beautiful.color0,
                margins = dpi(5),
                widget = wibox.container.margin,
            },
            bg = beautiful.background,
            forced_height = height,
            forced_width = width,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal
    }

    return generic_box
end

local function create_generic_button(text, size)
    local text = wibox.widget {
        {
            {
                markup = text,
                font = "monospace bold " .. tostring(size),
                widget = wibox.widget.textbox,
            },
            bg = beautiful.transparent,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal
    }

    local button = create_generic_box(text, 0, size + dpi(100), size + dpi(50))

    return button
end

local function create_empty_space()
    local widget = {
        markup = "", forced_width = dpi(1), widget = wibox.widget.textbox
    }
    return widget
end

local function create_centered_line(widget)
    local centered_line = wibox.widget {
        {
            create_empty_space(),
            widget,
            create_empty_space(),
            expand = "none",
            layout = wibox.layout.align.horizontal
        },
        widget = wibox.widget.background
    }

    return centered_line
end

local function create_centered_column(widget)
    local centered_column = wibox.widget {
        {
            create_empty_space(),
            widget,
            create_empty_space(),
            expand = "none",
            layout = wibox.layout.align.vertical
        },
        widget = wibox.widget.background
    }

    return centered_column
end

local function create_centered_box(widgets, margins, spacing, width, height)
    local centered_box = wibox.layout.flex.vertical()
    centered_box.spacing = spacing
    centered_box.expand = "none"

    if width ~= nil then
        centered_box.forced_width = width
    end

    if height ~= nil then
        centered_box.forced_width = width
    end

    for i=1,#widgets do
        local centered_line = create_centered_line(widgets[i])
        centered_box:add(centered_line)
    end

    centered_box = create_generic_box(centered_box, margins, width, height)
    return centered_box
end

local function create_hw_bar(image, fill_color)
    local bar = wibox.widget { -- battery
        {
            image = image,
            resize = true,
            forced_height = dpi(20),
            forced_width = dpi(22),
            widget = wibox.widget.imagebox
        },
        {
            id = "value",
            max_value       = 100,
            value           = 20,
            shape           = gears.shape.rectangle,
            color           = fill_color,
            background_color = beautiful.color4,
            border_width    = dpi(4),
            border_color    = beautiful.color8,
            border          = dpi(2),
            widget          = wibox.widget.progressbar,
        },
        {
            id = "text",
            markup = "",
            widget = wibox.widget.textbox,
        },
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal,
    }

    return bar
end

local function create_uncentered_list(title)
    local list = wibox.widget {
        {
            {
                markup = "  " .. title .. "  ",
                forced_width = dpi(175),
                widget = wibox.widget.textbox,
            },
            color = beautiful.color4,
            bottom = dpi(3),
            widget = wibox.container.margin,
        },
        {
            id = "list",
            markup = "",
            widget = wibox.widget.textbox,
        },
        layout = wibox.layout.fixed.vertical
    }

    return list
end

local function create_seperator()
    local seperator = {
        {
            markup = "",
            forced_width = dpi(1),
            widget = wibox.widget.textbox,
        },
        color = beautiful.color4,
        right = dpi(4),
        widget = wibox.container.margin,
    }

    return seperator
end

local function get_wallpaper(screen)
    if screen.geometry.width == 1920 then
        return CONFDIR .. "pictures/" .. "info_panel_1920.png"
    else
        return CONFDIR .. "pictures/" .. "info_panel_3440.png"
    end
end

local nameplate = create_underlined_text("Archbox", beautiful.color4, 23)
local date_text = helpful_functions.split_string(helpful_functions.cmd_get_output("date"))
local weekday = "<span size='100%'>" .. date_text[1] .. "</span>"
local day_number = "<span size='350%'>" .. date_text[2] .. "</span>"
local month = "<span size='150%'>" .. date_text[3] .. "</span>"
local year = "<span size='100%'>" .. date_text[6] .. "</span>"

local date_box = create_centered_box({wibox.widget.textbox(weekday),
                        wibox.widget.textbox(day_number),
                        wibox.widget.textbox(month),
                        wibox.widget.textbox(year)},
                        dpi(10), dpi(0), dpi(150), dpi(150))

local battery_bar = create_hw_bar(beautiful.battery_icon, beautiful.color1)
local cpu_bar = create_hw_bar(beautiful.cpu_icon, beautiful.color9)
local storage_bar = create_hw_bar(beautiful.harddrive_icon, beautiful.color2)
local ram_bar = create_hw_bar(beautiful.ram_icon, beautiful.color5)

HW_info_bars = create_centered_box({battery_bar,
                                    cpu_bar,
                                    storage_bar,
                                    ram_bar},
                                    dpi(10), dpi(10), dpi(400), dpi(150))


local electricity_price_text = helpful_functions.read_file(CONFDIR .. "data/electricity_price.txt")
local electricity_price_text = wibox.widget.textbox("<span size='300%'> " .. electricity_price_text .. "</span>")

local electricity_box = create_centered_box({electricity_price_text,
                                            wibox.widget.textbox("Öre/Kwh")},
                                            dpi(10), dpi(0), dpi(150), dpi(150))

local docker_title = create_centered_line(create_underlined_text("Docker"))
local docker_not_running_list = create_uncentered_list("Available")
local docker_running_list = create_uncentered_list("Running")
local docker_lists = {
    docker_not_running_list,
    create_seperator(),
    docker_running_list,
    spacing = dpi(20),
    layout = wibox.layout.fixed.horizontal,
}

local docker_box = {
    docker_title,
    create_generic_box(docker_lists, dpi(10), dpi(430), dpi(200)),
    spacing = dpi(10),
    layout = wibox.layout.fixed.vertical,
}

local vm_title = create_centered_line(create_underlined_text("Virtual Machines"))
local vm_not_running_list = create_uncentered_list("Available")
local vm_running_list = create_uncentered_list("Running")

local vm_lists = create_generic_box({
    vm_not_running_list,
    create_seperator(),
    vm_running_list,
    spacing = dpi(20),
    layout = wibox.layout.fixed.horizontal,
}, dpi(10), dpi(430), dpi(200))

local vm_box = {
    vm_title,
    vm_lists,
    spacing = dpi(10),
    layout = wibox.layout.fixed.vertical,
}

local economy_panel_link = create_centered_line(create_underlined_text("Economy panel"))

-- function that binds a info panel to primary screen
local function setup(s)
    -- info panel
    docker_not_running_list["list"]:set_markup(helpful_functions.cmd_get_output("docker ps -a --filter 'status=exited' --format 'table {{.Names}}'")) 
    docker_running_list["list"]:set_markup(helpful_functions.cmd_get_output("docker ps --format 'table {{.Names}}'"))
    vm_not_running_list["list"]:set_markup(helpful_functions.cmd_get_output("virsh list -all --name"))
    vm_running_list["list"]:set_markup(helpful_functions.cmd_get_output("virsh list --name"))

    battery_bar:get_children_by_id("value")[1].value = tonumber(helpful_functions.cmd_get_output("acpi -b | grep Discharging | cut -d ' ' -f 4 | sed 's/%,//'")) -- battery left
    cpu_bar:get_children_by_id("value")[1].value = tonumber(helpful_functions.cmd_get_output("top -b -n1 | grep Cpu | tail -n 1 | awk '{print $3 + $4}'")) -- cpu load
    storage_bar:get_children_by_id("value")[1].value = tonumber(helpful_functions.cmd_get_output("df -h | grep /dev/sda1 | awk '{print $5}' | sed 's/%//'")) -- storage left
    ram_bar:get_children_by_id("value")[1].value = tonumber(helpful_functions.cmd_get_output("free | grep Mem | awk '{print $3/$2 * 100.0}'")) -- ram left

    Info_panel = wibox {
        screen = s,
        width = s.geometry.width,
        height = s.geometry.height,
        x = dpi(0),
        y = dpi(0),
        visible = false,
        ontop = true,
        bg = beautiful.color8,
    }

    local date_hw_electricity_line = create_centered_line({
        date_box,
        HW_info_bars,
        electricity_box,
        spacing = dpi(40),
        layout = wibox.layout.fixed.horizontal,
    })
    local docker_vm_line = create_centered_line({
        docker_box,
        vm_box,
        spacing = dpi(40),
        layout = wibox.layout.fixed.horizontal,
    })
    -- putting widgets into place
    Info_panel:setup {
        {
            create_empty_space(),
            {
                create_empty_space(),
                {
                    create_centered_line(nameplate),
                    date_hw_electricity_line,
                    docker_vm_line,
                    create_centered_line(economy_panel_link),
                    spacing = dpi(40),
                    layout = wibox.layout.fixed.vertical,
                },
                create_empty_space(),
                expand = "outside",
                layout = wibox.layout.align.horizontal,
            },
            create_empty_space(),
            expand = "outside",
            layout = wibox.layout.align.vertical,
        },
        bgimage = get_wallpaper(s),
        widget = wibox.container.background
    }



    Economy_panel = wibox {
        screen = s,
        width = s.geometry.width,
        height = s.geometry.height,
        x = dpi(0),
        y = dpi(0),
        visible = false,
        ontop = true,
        bg = beautiful.color8,
    }

    local function create_shaped_box(widget, height, width, shape)
        local shaped_box = wibox.widget {
            {
                    widget,
                    bg = beautiful.background,
                    shape = shape or gears.shape.rounded_rect,
                    forced_width = height or dpi(100),
                    forced_height = width or dpi(100),
                    widget = wibox.container.background,
            },
            layout = wibox.layout.fixed.horizontal,
        }

        return shaped_box
    end

    local population_graph = {
        id = "top_graph",
        image = gears.surface.load_uncached(CONFDIR .. "pictures/tmp.png"),
        widget = wibox.widget.imagebox
    }

    local population_box = create_generic_box(population_graph)

    local function num_to_words(number)
        if tonumber(number) > 1000000000000 then
            return tostring(helpful_functions.round(number / 1000000000000)) .. " T"
        elseif tonumber(number) > 1000000000 then
            return tostring(helpful_functions.round(number / 1000000000)) .. " B"
        elseif tonumber(number) > 1000000  then
            return tostring(helpful_functions.round(number / 1000000)) .. " M"
        end

        return number
    end

    local function get_economic_data(title, filename)
        local non_formated_data = helpful_functions.read_file(filename)
        non_formated_data = helpful_functions.split_string(non_formated_data)

        local first_line = create_centered_line(wibox.widget.textbox(title))
        local second_line = create_centered_line(wibox.widget.textbox(tostring(non_formated_data[1])))
        local third_line = create_centered_line(wibox.widget ({
            markup = num_to_words(helpful_functions.round(non_formated_data[2], 2)),
            font = "monospace bold " .. dpi(9),
            widget = wibox.widget.textbox,
        }))

        local list = wibox.widget {
            create_empty_space(),
            first_line,
            second_line,
            third_line,
            create_empty_space(),
            spacing = dpi(20),
            layout = wibox.layout.fixed.vertical
        }

        return list
    end

    local economy_grid = wibox.widget {
        homogeneous = true,
        spacing = dpi(20),
        min_cols_size = 4,
        min_rows_size = 4,
        forced_height = dpi(700),
        layout = wibox.layout.grid
    }

    local sweden_line = create_underlined_text("Sweden", beautiful.transparent)
    local germany_line = create_underlined_text("Germany", beautiful.transparent)
    local china_line = create_underlined_text("China", beautiful.transparent)
    local usa_line = create_underlined_text("USA", beautiful.color4)

    local country_list = wibox.widget ({
        sweden_line,
        germany_line,
        china_line,
        usa_line,
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal,
    })

    local centered_country_list = create_centered_line(country_list)

    local function place_economy_boxes(country_code)
        economy_grid:reset()

        economy_grid:add_widget_at(population_box, 1, 1, 5, 3)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("GDP ($)", CONFDIR .. "data/" .. country_code .. "_gdp.txt")), 1, 4)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("GDP Cap ($)", CONFDIR .. "data/" .. country_code .. "_gdp_capita.txt")), 1, 5)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Inflation (%)", CONFDIR .. "data/" .. country_code .. "_inflation.txt")), 1, 6)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Gini", CONFDIR .. "data/" .. country_code .. "_gini.txt")), 1, 7)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Outer inv", CONFDIR .. "data/" .. country_code .. "_foreign_investments.txt")), 2, 4)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Edu cost (% GDP)", CONFDIR .. "data/" .. country_code .. "_education_expenditure.txt")), 2, 5)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Unemplotment (%)", CONFDIR .. "data/" .. country_code .. "_unemployment_rate.txt")), 2, 6)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Poverty (%)", CONFDIR .. "data/" .. country_code .. "_poverty.txt")), 2, 7)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Population", CONFDIR .. "data/" .. country_code .. "_population.txt")), 3, 4)
        economy_grid:add_widget_at(create_shaped_box(get_economic_data("Net Migration", CONFDIR .. "data/" .. country_code .. "_net_migration.txt")), 3, 5)
    end

    place_economy_boxes("US")

    sweden_line:connect_signal("button::press", function ()
        place_economy_boxes("SE")
        sweden_line["underline"]:set_color(beautiful.color4)
        germany_line["underline"]:set_color(beautiful.transparent)
        china_line["underline"]:set_color(beautiful.transparent)
        usa_line["underline"]:set_color(beautiful.transparent)
    end)
    germany_line:connect_signal("button::press", function ()
        place_economy_boxes("DE")
        sweden_line["underline"]:set_color(beautiful.transparent)
        germany_line["underline"]:set_color(beautiful.color4)
        china_line["underline"]:set_color(beautiful.transparent)
        usa_line["underline"]:set_color(beautiful.transparent)
    end)
    china_line:connect_signal("button::press", function ()
        place_economy_boxes("CN")
        sweden_line["underline"]:set_color(beautiful.transparent)
        germany_line["underline"]:set_color(beautiful.transparent)
        china_line["underline"]:set_color(beautiful.color4)
        usa_line["underline"]:set_color(beautiful.transparent)
    end)
    usa_line:connect_signal("button::press", function ()
        place_economy_boxes("US")
        sweden_line["underline"]:set_color(beautiful.transparent)
        germany_line["underline"]:set_color(beautiful.transparent)
        china_line["underline"]:set_color(beautiful.transparent)
        usa_line["underline"]:set_color(beautiful.color4)
    end)
    local box = create_centered_line(economy_grid)

    Economy_panel:setup {
        {
            create_empty_space(),
                {
                    centered_country_list,
                    box,
                    spacing = dpi(30),
                    layout = wibox.layout.fixed.vertical,
            },
            create_empty_space(),
            expand = "outside",
            layout = wibox.layout.align.vertical,
        },
        bgimage = get_wallpaper(s),
        widget = wibox.container.background
    }


    ---- keybindings
    economy_panel_link:connect_signal("button::press", function()
        Economy_panel.visible = true
    end)

    -- keybinding to show the info panel
    global_keys = gears.table.join(global_keys, awful.key({MOD}, "i", function()
            Info_panel.visible = not Info_panel.visible
            Economy_panel.visible = false
        end,
        {description = "toggle info panel and hide economy panel", group = "awesome"}))
end

return {
    Info_panel = Info_panel,
    setup = setup,
}
