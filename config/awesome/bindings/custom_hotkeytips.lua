local hotkeys_popup = require("awful.hotkeys_popup.widget")

local st_keys = {
    ["ST"] = {
        rule_any = { class = {"st", "St"}},
        modifiers = { "Shift" },
        keys = {
            right = "Increase font",
            left = "Decrease font",
            down = "Move one page down",
            up = "Move one page up"
        }
    }
}

hotkeys_popup.add_hotkeys(st_keys)
