local debugging = require("debugging")
local helpful = require("helpful")
--local http = require("socket.http")

local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local lain = require("lain")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")

local objects = require("objects")
local info_panel = require("info_panel")


----------------------------------------------------------------------------------
--                                Functions                                     --
----------------------------------------------------------------------------------

-- wrapper for client focus
local function focus_tag_wrapper(direction)
    awful.client.focus.global_bydirection(direction)
end

-- wrapper for client swap
local function swap_tag_wrapper(direction, c)
    awful.client.swap.global_bydirection(direction, c, true)

    if client.focus then
        client.focus:raise()
    end
end

-- client focus based on history
local function history_focus()
    awful.client.focus.history.previous()

    if client.focus then
        client.focus:raise()
    end
end

-- toggle fullscreen for selected client
local function toggle_fullscreen(c)
    c.fullscreen = not
    c.fullscreen
    c:raise()
end

-- go to tag
local function move_to_tag(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i]

    if tag then
        tag:view_only()
    end
end

-- send client to tag
local function send_to_tag(i)
    if client.focus then
        local tag = client.focus.screen.tags[i]

        if tag then
            client.focus:move_to_tag(tag)
        end
    end
end

-- move client with mouse
local function mouse_move_client(client)
    client:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(client)
end

-- resize client with mouse
local function mouse_resize_client(client)
    client:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(client)
end

-- execute when a new client appears
local function ensure_placement(c)
    if awesome.startup and
    not c.size_hints.user_position and
    not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end

-- create titlebar
local function create_titlebar(c)
    awful.titlebar(c):setup {
        { -- left widgets
        },
        { -- middle widgets
        },
        { -- right widgets
        }
    }
end

local function execute_command(command)
    local handle = io.popen(command)
    handle:close()
end

local function fetch_economy_data()
    execute_command("/home/glass/.config/awesome/get_usa_cpi.sh")
    execute_command("/home/glass/.config/awesome/get_swedish_cpi.sh")
end

local function cmd_to_file(cmd, filename)
    awful.spawn.easy_async_with_shell(cmd .. " > " .. filename)
end

local function output_from_file(filename)
    local file = io.open(filename, "r")

    if file then
        local content = file:read("*a")

        file:close()

        return content
    else
        return "Failed to open the file."
    end
end

local function run_shell_script(cmd)
    local filename = "/var/tmp/tmp_stdout"

    cmd_to_file(cmd,filename)
    helpful.sleep(0.3)
    local output = output_from_file(filename)

    return output
end

local function get_used_ram()
    local cmd = "free -h | sed 's/Gi//' | awk '/Mem:/ {print ($3 / $2) * 100}' | sed 's/\\.[0-9]*//'"

    return tonumber(run_shell_script(cmd))
end

local function get_cpu_load()
    local cmd = "ps -eo %cpu | awk 'NR>1 {total =+ $1} END {print total}'"

    return tonumber(run_shell_script(cmd))
end

local function get_storage_utilization()
    local cmd = "df -h / | grep / | cut -d ' ' -f 10 | sed 's/%//'"

    return tonumber(run_shell_script(cmd))
end

local function get_battery_left()
    local cmd = "acpi -b | grep Discharging | cut -d ' ' -f 4 | sed 's/%,//'"

    return tonumber(run_shell_script(cmd))
end

local function setup_sidepanel(s)
    --fetch_economy_data()

    -- objects.HW_info_bars[1][2].value = get_battery_left()
    -- objects.HW_info_bars[1][3].markup = get_battery_left()
    -- objects.HW_info_bars[2][2].value = get_cpu_load()
    -- objects.HW_info_bars[2][3].markup = get_cpu_load()
    -- objects.HW_info_bars[3][2].value = get_storage_utilization()
    -- objects.HW_info_bars[3][3].markup = get_storage_utilization()
    -- objects.HW_info_bars[4][2].value = get_used_ram()
    -- objects.HW_info_bars[4][3].markup = get_used_ram()

    if s.index == 1 then
        Sidepanel = wibox {
            screen = s,
            width = s.geometry.width,
            height = s.geometry.height,
            visible = false,
            ontop = true,
            bg = beautiful.color8,
            x = dpi(0),
            y = dpi(0),
        }

        Sidepanel:setup {
            {
                {
                    objects.Nameplate,
                    objects.HW_info,
                    objects.USA_CPI,
                    objects.Swedish_CPI,
                    spacing = dpi(20),
                    layout = wibox.layout.fixed.vertical,
                },
                visible = true,
                bgimage = "/home/glass/freetime/pictures/ultra/zetong-li-hfTc0KN8v1s-unsplash.jpg",
                widget = wibox.container.background
            },
            margins = dpi(10),
            widget = wibox.container.margin,
        }


        Sidepanel:buttons(
            awful.util.table.join(
                awful.button( {}, 4,
                    function()
                        Marginbox.top = Marginbox.top + 5
                        Sidepanel:emit_signal("widget::layout_changed")
                    end
                ),
                awful.button( {}, 5,
                    function()
                        naughty.notify({text = "before"})
                        objects.Swedish_CPI = {
                            text = "testing",
                            widget = wibox.widget.textbox,
                        }
                        naughty.notify({text = "after"})
                        objects.Swedish_CPI:emit_signal("widget::redraw_needed")
                        Sidepanel:emit_signal("widget::redraw_needed")
                    end
                )
            )
        )
    end

end

local function toggle_visibility(object)
    object.visible = not object.visible
end

-- setup signals
local function setup_signals(c)
    -- make sure clients are placed correctly
    client.connect_signal("manage", function(c) ensure_placement(c) end)
    --client.connect_signal("manage", function(c) ensure_placement(c) end)
    client.connect_signal("request::titlebars", function(c) create_titlebar(c) end)
    --client.connect_signal("request::titlebars", function(c) create_titlebar(c) end)

    -- focus client on mouse enter
    client.connect_signal("focus", function(c) awful.titlebar.show(c) beautiful.titlebar_bg = beautiful.color8 end)
    --client.connect_signal("focus", function(c) awful.titlebar.show(c) beautiful.titlebar_bg = beautiful.color8 end)

    client.connect_signal("unfocus", function(c) beautiful.titlebar_bg = beautiful.color10 end)
    --client.connect_signal("unfocus", function(c) beautiful.titlebar_bg = beautiful.color10 end)
end

-- connect tags and wibar for each screen
local function setup_taglist(s)
    awful.screen.connect_for_each_screen(
        function(s)
            -- each screen has its own tag table.
            for i, tag in ipairs({"    code", "    webb", "    music", "    extra"}) do
                awful.tag.add(tag, {
                    layout = lain.layout.centerwork,
                    master_fill_policy = "master_width_factor",
                    gap_single_client = true,
                    screen = s,
                    selected = i == 1
                })
            end

            -- create a taglist widget
            s.mytaglist = awful.widget.taglist {
                screen = s,
                filter = awful.widget.taglist.filter.all,
                buttons = Taglist_buttons,
                widget_template = Taglist,
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

            if s.index == 1 then
                -- add info panel
                info_panel.setup(s)
            end
        end
    )
end



return {
    focus_tag_wrapper = focus_tag_wrapper,
    swap_tag_wrapper = swap_tag_wrapper,
    history_focus = history_focus,
    toggle_fullscreen = toggle_fullscreen,
    move_to_tag = move_to_tag,
    send_to_tag = send_to_tag,
    mouse_move_client = mouse_move_client,
    mouse_resize_client = mouse_resize_client,
    setup_taglist = setup_taglist,
    setup_signals = setup_signals,
    create_titlebar = create_titlebar,
    toggle_visibility = toggle_visibility,
    get_used_ram = get_used_ram,
    get_cpu_load = get_cpu_load,
    get_storage_utilization = get_storage_utilization,
    get_battery_left = get_battery_left,
}
