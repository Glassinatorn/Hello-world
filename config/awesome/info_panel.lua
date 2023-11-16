local wibox = require("wibox")
local beautiful = require("beautiful")
local CONFDIR = awesome.conffile:match("(.*/)")
local dpi = beautiful.xresources.apply_dpi
local awful = require("awful")
local MOD = require("constants").MODKEY
local gears = require("gears")
local helpful_functions = require("helpful")
local naughty = require("naughty")

local function create_underlined_text(text, size)
    local underlined_text = wibox.widget {
        {
            {
                {
                    markup = text,
                    font = "monospace bold " .. tostring(size),
                    widget = wibox.widget.textbox,
                },
                bg = beautiful.transparent,
                widget = wibox.container.background,
            },
            color = beautiful.color4,
            bottom = dpi(5),
            widget = wibox.container.margin,
        },
        layout = wibox.layout.fixed.horizontal
    }

    return underlined_text
end

local function create_generic_box(widget, margins, width, height)
    local generic_box = {
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
    }

    return generic_box
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

    return centered_line
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
    local bar = { -- battery
        {
            image = image,
            resize = true,
            forced_height = dpi(20),
            forced_width = dpi(22),
            widget = wibox.widget.imagebox
        },
        wibox.widget {
            id = "value",
            max_value       = 100,
            value           = 20,
            --forced_height   = dpi(20),
            --forced_width    = dpi(350),
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
        return CONFDIR .. "info_panel_1920.png"
    else
        return CONFDIR .. "info_panel_3440.png"
    end
end

local nameplate = create_underlined_text("Archbox", 23)
local date_text = helpful_functions.run_shell_script("date")
local date_text = helpful_functions.split_string(date_text)
local weekday = "<span size='100%'>" .. date_text[1] .. "</span>"
local day_number = "<span size='350%'>" .. date_text[2] .. "</span>"
local month = "<span size='150%'>" .. date_text[3] .. "</span>"
local year = "<span size='100%'>" .. date_text[6] .. "</span>"

local date_box = create_centered_box({wibox.widget.textbox(weekday),
                        wibox.widget.textbox(day_number),
                        wibox.widget.textbox(month),
                        wibox.widget.textbox(year)},
                        dpi(10), dpi(10), dpi(150), dpi(150))


local battery_bar = create_hw_bar(beautiful.battery_icon, beautiful.color1)
local cpu_bar = create_hw_bar(beautiful.cpu_icon, beautiful.color9)
local storage_bar = create_hw_bar(beautiful.harddrive_icon, beautiful.color2)
local ram_bar = create_hw_bar(beautiful.ram_icon, beautiful.color5)

HW_info_bars = create_centered_box({battery_bar,
                                    cpu_bar,
                                    storage_bar,
                                    ram_bar},
                                    dpi(10), dpi(10), dpi(400), dpi(150))

local electricity_price_text = helpful_functions.run_shell_script("python " .. CONFDIR .. "scripts/get_electricity_price.py")
local electricity_price_text = wibox.widget.textbox("<span size='300%'> " .. electricity_price_text .. "</span>")

local electricity_box = create_centered_box({electricity_price_text, 
                                            wibox.widget.textbox("Öre/Kwh")},
                                            dpi(20), dpi(10), dpi(150), dpi(150))


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
    ----- info panel
    -- fetching information
    -- date_box_text.markup = "" ..
    -- "<span size='100%'>" .. helpful_functions.run_shell_script("date | cut -d ' ' -f 1") .. "</span>" ..
    -- "<span size='200%'>" .. helpful_functions.run_shell_script("date | cut -d ' ' -f 2") .. "</span>" ..
    -- "<span size='200%'>" .. helpful_functions.run_shell_script("date | cut -d ' ' -f 3") .. "</span>" ..
    -- "<span size='100%'>" .. helpful_functions.run_shell_script("date | cut -d ' ' -f 6") .. "</span>"
    -- electricity_price[1][1][1][1].markup = "" ..
    --     "<span size='300%'>" .. helpful_functions.run_shell_script("python " .. CONFDIR .. "scripts/get_electricity_price.py") .. "</span>" .. "     Öre/kwh"

    docker_not_running_list["list"]:set_markup(helpful_functions.run_shell_script("docker ps -a --filter 'status=exited' --format 'table {{.Names}}'")) 
    docker_running_list["list"]:set_markup(helpful_functions.run_shell_script("docker ps --format 'table {{.Names}}'"))
    vm_not_running_list["list"]:set_markup(helpful_functions.run_shell_script("virsh list -all --name"))
    vm_running_list["list"]:set_markup(helpful_functions.run_shell_script("virsh list --name"))


    -- TODO: find a way to update the values
    -- HW_info_bars[1][1][1][1][2].value = tonumber(helpful_functions.run_shell_script("acpi -b | grep Discharging | cut -d ' ' -f 4 | sed 's/%,//'")) -- battery left
    -- HW_info_bars[1][1][1][1][3].markup = tonumber(helpful_functions.run_shell_script("acpi -b | grep Discharging | cut -d ' ' -f 4 | sed 's/%,//'")) -- battery left
    -- HW_info_bars[1][1][1][2][2].value = tonumber(helpful_functions.run_shell_script("top -b -n1 | grep Cpu | tail -n 1 | awk '{print $3 + $4}'")) -- cpu load
    -- HW_info_bars[1][1][1][2][3].markup = tonumber(helpful_functions.run_shell_script("top -b -n1 | grep Cpu | tail -n 1 | awk '{print $3 + $4}'")) -- cpu load
    -- HW_info_bars[1][1][1][3][2].value = tonumber(helpful_functions.run_shell_script("df -h / | grep / | cut -d ' ' -f 9 | sed 's/%//'")) -- storage utilization
    -- HW_info_bars[1][1][1][3][3].markup = tonumber(helpful_functions.run_shell_script("df -h / | grep / | cut -d ' ' -f 9 | sed 's/%//'")) -- storage utilization
    -- HW_info_bars[1][1][1][4][2].value = tonumber(helpful_functions.run_shell_script("free -h | sed 's/Gi//' | awk '/Mem:/ {print ($3 / $2) * 100}' | sed 's/\\.[0-9]*//'")) -- used ram
    -- HW_info_bars[1][1][1][4][3].markup = tonumber(helpful_functions.run_shell_script("free -h | sed 's/Gi//' | awk '/Mem:/ {print ($3 / $2) * 100}' | sed 's/\\.[0-9]*//'")) -- used ram

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

    ---- end of info panel




    ------ economu panel


    local indicators = {
        inflation = { indicator = "FP.CPI.TOTL.ZG", picture = "cpi.png" },
        gdp = { indicator =  "NY.GDP.MKTP.CD", picture = "gdp.png" },
        gdp_per_capita = { indicator =  "NY.GDP.PCAP.CD", picture = "gdp_per_capita.png" },
        foreign_investments = { indicator =  "BX.KLT.DINV.WD.GD.ZS", picture = "foreign_investments.png" },
        education_expenditure = { indicator =  "SE.XPD.TOTL.GD.ZS", picture = "education_expenditure.png" },
        interest_rates = { indicator =  "FR.INR.RINR", picture = "interest_rates.png" },
        cpi = { indicator =  "FP.CPI.TOTL", picture = "cpi.png" },
        unemployment_rate = { indicator =  "SL.UEM.TOTL.ZS", picture = "unemployment_rate.png" },
        gini_coefficient = { indicator =  "SI.POV.GINI", picture = "gini_coefficient.png" },
        poverty = { indicator =  "SI.POV.DDAY", picture = "poverty.png" },
        population = { indicator =  "SP.POP.TOTL", picture = "population.png" },
        net_migration = { indicator =  "SM.POP.NETM", picture = "net_migration.png" },
    }


    for key, values in pairs(indicators) do
        --helpful_functions.run_shell_script(CONFDIR .. "scripts/tmp.sh" .. " " .. 
                                            --dpi(2000) .. " " .. dpi(500) .. " " .. 
                                            --values.indicator .. " " .. 
                                            --CONFDIR .. "scripts/" .. values.picture)
    end



    local top_graph_image = {
        id = "top_graph",
        image = gears.surface.load_uncached(CONFDIR .. "scripts/gdp.png"),
        widget = wibox.widget.imagebox
    }
    local top_graph_box = create_generic_box(top_graph_image, 0, dpi(500), dpi(250))

    local bottom_graph_image = {
        id = "bottom_graph",
        image = gears.surface.load_uncached(CONFDIR .. "scripts/gdp.png"),
        widget = wibox.widget.imagebox
    }
    local bottom_graph_box = create_generic_box(bottom_graph_image, 0, dpi(500), dpi(250))

    local top_buttons = {
        inflation_button = create_underlined_text("Inflation", 10),
        GDP_button = create_underlined_text("GDP", 10),
        gdp_per_capita_button = create_underlined_text("GDP per capita", 10),
        foreign_investments_button = create_underlined_text("Foreign investments", 10),
        education_expenditure_button = create_underlined_text("Education", 10),
        interest_rates_button = create_underlined_text("Interest rates", 10),
        cpi_button = create_underlined_text("CPI", 10),
    }
    local top_buttons_bindings = {
        inflation_button = CONFDIR .. "scripts/inflation.png",
        gdp_button = CONFDIR .. "scripts/gdp.png",
        gdp_per_capita_button = CONFDIR .. "scripts/gdp_per_capita.png",
        education_expenditure_button = CONFDIR .. "scripts/education_expenditure.png",
        interest_rates_button = CONFDIR .. "scripts/interest_rates.png",
        foreign_investments_button = CONFDIR .. "scripts/foreign_direct_investments.png",
        cpi_button = CONFDIR .. "scripts/cpi.png",
    }

    local bottom_buttons = {
        unemployement_rate_button = create_underlined_text("Unemployment", 10),
        gini_coefficient_button = create_underlined_text("Gini", 10),
        poverty_button = create_underlined_text("Poverty", 10),
        population_button = create_underlined_text("Population", 10),
        net_migration_button = create_underlined_text("Net migration", 10),
    }
    local bottom_buttons_bindings = {
        unemployement_rate_button = CONFDIR .. "scripts/unemployment_rate.png",
        gini_coefficient_button = CONFDIR .. "scripts/gini_coefficient.png",
        poverty_button = CONFDIR .. "scripts/poverty.png",
        population_button = CONFDIR .. "scripts/population.png",
        net_migration_button = CONFDIR .. "scripts/net_migration.png"
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

    local top_buttons_list = {
        top_buttons.inflation_button,
        top_buttons.GDP_button,
        top_buttons.gdp_per_capita_button,
        top_buttons.foreign_investments_button,
        top_buttons.education_expenditure_button,
        top_buttons.interest_rates_button,
        top_buttons.cpi_button,
        spacing = dpi(50),
        layout = wibox.layout.flex.horizontal
    }
    local bottom_buttons_list = {
        bottom_buttons.unemployement_rate_button,
        bottom_buttons.gini_coefficient_button,
        bottom_buttons.poverty_button,
        bottom_buttons.population_button,
        bottom_buttons.net_migration_button,
        spacing = dpi(50),
        layout = wibox.layout.flex.horizontal,
    }

    -- putting widgets into place
    Economy_panel:setup {
        {
            create_empty_space(),
            {
                create_empty_space(),
                {
                    top_buttons_list,
                    top_graph_box,
                    bottom_buttons_list,
                    bottom_graph_box,
                    spacing = dpi(20),
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

    -- binding buttons
    for key, button in pairs(top_buttons) do
        button:connect_signal("button::press", function ()
            local image = gears.surface.load_uncached(top_buttons_bindings[key])
            Economy_panel:get_children_by_id("top_graph")[1].image = image
        end)
    end
    for key, button in pairs(bottom_buttons) do
        button:connect_signal("button::press", function ()
            local image = gears.surface.load_uncached(bottom_buttons_bindings[key])
            Economy_panel:get_children_by_id("bottom_graph")[1].image = image
        end)
    end


    ------ end of economu panel





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
