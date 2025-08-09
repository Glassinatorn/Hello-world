-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

-- core modules
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local helpful_functions = require("helpful")
local naughty = require("naughty")

-- helpful variables
local CONFDIR = awesome.conffile:match("(.*/)")
local dpi = beautiful.xresources.apply_dpi
local MOD = require("constants").MODKEY

-- own widgets
local create_underlined_text = require("widgets.underlined_text")
local create_generic_box = require("widgets.generic_box")
local create_generic_button = require("widgets.generic_button")
local create_empty_space = require("widgets.empty_space")
local create_centered_line = require("widgets.centered_line")
local create_centered_column = require("widgets.centered_column")
local create_centered_box = require("widgets.centered_box")
local create_hw_bar = require("widgets.hardware_bar")
local create_uncentered_list = require("widgets.uncentered_list")
local create_seperator = require("widgets.seperator")


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

HW_info_bars = create_centered_box({battery_bar, cpu_bar, storage_bar, ram_bar},
                                    dpi(10), dpi(10), dpi(400), dpi(150))


local electricity_price_text = helpful_functions.read_file(CONFDIR .. 
                                                           "data/electricity_price.txt")
local electricity_price_text = wibox.widget.textbox("<span size='300%'> " .. 
                                                    electricity_price_text .. "</span>")

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

-- info panel
local function setup(s)
    local docker_not = helpful_functions.cmd_get_output("docker ps -a --filter 'status=exited'" ..
                                                        " --format 'table {{.Names}}'")
    local docker_run = helpful_functions.cmd_get_output("docker ps" .. 
                                                        " --format 'table {{.Names}}'")
    local vm_not = helpful_functions.cmd_get_output("virsh list -all --name")
    local vm_run = helpful_functions.cmd_get_output("virsh list --name")
    docker_not_running_list["list"]:set_markup(docker_not)
    docker_running_list["list"]:set_markup(docker_run)
    vm_not_running_list["list"]:set_markup(vm_not)
    vm_running_list["list"]:set_markup(vm_run)

    local battery_left = tonumber(helpful_functions.cmd_get_output("acpi -b |" ..
                                                           " grep Discharging |" ..
                                                           " cut -d ' ' -f 4 |" ..
                                                           " sed 's/%,//'"))
    local cpu_util = tonumber(helpful_functions.cmd_get_output("top -b -n1 |" ..
                                                         " grep Cpu |" ..
                                                         " tail -n 1 |" .. 
                                                         " awk '{print $2 + $4}'"))
    local storage_used = tonumber(helpful_functions.cmd_get_output("df -h |" ..
                                                            " grep /dev/nvme0n1p1 |" ..
                                                            " awk '{print $5}' |" ..
                                                            " sed 's/%//'"))
    local ram_used = tonumber(helpful_functions.cmd_get_output("free |" ..
                                                         " grep Mem |" ..
                                                         " awk '{print $3/$2 * 100.0}'"))
    battery_bar:get_children_by_id("value")[1].value = battery_left
    cpu_bar:get_children_by_id("value")[1].value = cpu_util
    storage_bar:get_children_by_id("value")[1].value = storage_used
    ram_bar:get_children_by_id("value")[1].value = ram_used

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

    -- TODO: move this into a widget
    local function create_shaped_box(widget, height, width, shape)
        local shaped_box = wibox.widget {
            {
                {
                    {
                        widget,
                        bg = beautiful.background,
                        shape = shape or gears.shape.rectangle,
                        forced_width = height or dpi(100),
                        forced_height = width or dpi(100),
                        widget = wibox.container.background,
                    },
                    color = beautiful.color0,
                    margins = dpi(5),
                    widget = wibox.container.margin,
                },
                widget = wibox.container.background,
                bg = beautiful.background,
                left = dpi(10),
                right = dpi(10),
                top = dpi(10),
                bottom = dpi(10),
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
        local data = helpful_functions.read_file(filename)
        if data == "" then
            data = "0.0 0.0"
        end

        data = helpful_functions.split_string(data)

        local first_line = create_centered_line(wibox.widget.textbox(title))
        local second_line = create_centered_line(wibox.widget.textbox(tostring(data[1])))
        local third_line = create_centered_line(wibox.widget ({
            markup = num_to_words(helpful_functions.round(data[2], 2)),
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

        local gdp_data = get_economic_data("GDP ($)", CONFDIR ..
                                           "data/" .. country_code ..
                                           "_gdp.txt")
        local gdp_capita_data = get_economic_data("GDP Cap ($)", CONFDIR ..
                                                  "data/" .. country_code ..
                                                  "_gdp_capita.txt")
        local inflation_data = get_economic_data("Inflation (%)", CONFDIR ..
                                                 "data/" .. country_code ..
                                                 "_inflation.txt")
        local gini_data = get_economic_data("Gini", CONFDIR ..
                                            "data/" .. country_code ..
                                            "_gini.txt")
        local foreign_investments_data = get_economic_data("Outer inv", CONFDIR ..
                                                           "data/" .. country_code ..
                                                           "_foreign_investments.txt")
        local education_spending_data = get_economic_data("Edu cost (% GDP)", CONFDIR ..
                                                          "data/" .. country_code ..
                                                          "_education_expenditure.txt")
        local unemployment_data = get_economic_data("Unemployment (%)", CONFDIR ..
                                                    "data/" .. country_code ..
                                                    "_unemployment_rate.txt")
        local poverty_data = get_economic_data("Poverty (%)", CONFDIR ..
                                               "data/" .. country_code ..
                                               "_poverty.txt")
        local population_data = get_economic_data("Population", CONFDIR ..
                                                  "data/" .. country_code ..
                                                  "_population.txt")
        local net_migration_data = get_economic_data("Net migration", CONFDIR ..
                                                     "data/" .. country_code ..
                                                     "_net_migration.txt")
        economy_grid:add_widget_at(population_box, 1, 1, 5, 3)
        economy_grid:add_widget_at(create_shaped_box(gdp_data), 1, 4)
        economy_grid:add_widget_at(create_shaped_box(gdp_capita_data), 1, 5)
        economy_grid:add_widget_at(create_shaped_box(inflation_data), 1, 6)
        economy_grid:add_widget_at(create_shaped_box(gini_data), 1, 7)
        economy_grid:add_widget_at(create_shaped_box(foreign_investments_data), 2, 4)
        economy_grid:add_widget_at(create_shaped_box(education_spending_data), 2, 5)
        economy_grid:add_widget_at(create_shaped_box(unemployment_data), 2, 6)
        economy_grid:add_widget_at(create_shaped_box(poverty_data), 2, 7)
        economy_grid:add_widget_at(create_shaped_box(population_data), 3, 4)
        economy_grid:add_widget_at(create_shaped_box(net_migration_data), 3, 5)
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

    global_keys = gears.table.join(global_keys, awful.key({MOD}, "i", function()

    local updated_battery_left = tonumber(helpful_functions.cmd_get_output("acpi -b |" ..
                                                           " grep Discharging |" ..
                                                           " cut -d ' ' -f 4 |" ..
                                                           " sed 's/%,//'"))
    local updated_ram_used = tonumber(helpful_functions.cmd_get_output("free |" ..
                                                         " grep Mem |" ..
                                                         " awk '{print $3/$2 * 100.0}'"))
    local updated_cpu_util = tonumber(helpful_functions.cmd_get_output("top -b -n1 |" ..
                                                         " grep Cpu |" ..
                                                         " tail -n 1 |" .. 
                                                         " awk '{print $2 + $4}'"))
            Info_panel.visible = not Info_panel.visible
            Economy_panel.visible = false

            battery_bar:get_children_by_id("value")[1].value = updated_battery_left
            cpu_bar:get_children_by_id("value")[1].value = updated_cpu_util
            ram_bar:get_children_by_id("value")[1].value = updated_ram_used
        end,
        {description = "toggle info panel and hide economy panel", group = "awesome"}))
end

return {
    Info_panel = Info_panel,
    setup = setup,
}
