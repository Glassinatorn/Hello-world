-- standard awesome module
local awful = require("awful")
local lain = require("lain")

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
    awful.layout.suit.floating,
    lain.layout.centerwork,
}

local function setup()
    awful.layout.layouts = layouts
end

return { setup = setup }
