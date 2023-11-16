local awful = require("awful")
local lain = require("lain")

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
    awful.layout.suit.floating,
    lain.layout.centerwork,
}

-- setup layouts
local function setup_layouts()
    awful.layout.layouts = layouts
end

return { setup_layouts = setup_layouts }
