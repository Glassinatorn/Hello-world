local beautiful = require("beautiful")
local awful = require("awful")
local keys = require("keys")

local rules = {
   -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.client_keys,
            buttons = keys.client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "copyq", -- Includes session name in class.
            },
            class = {
                "Arandr",
                "Tor BROWSER" -- Needs a fixed window size to avoid fingerprinting by screen size.
            },
            name = {
                "Event Tester" -- xev.
            },
            role = {
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },
    -- Add titlebars to normal clients and dialogs
    {
        rule_any = {
            type = { "normal", "dialog" }
        },
        properties = { titlebars_enabled = false }
    }
}

-- setup rules
local function setup_rules()
    awful.rules.rules = rules
end

return { setup_rules = setup_rules }
