-- standard awesome module
local awful = require("awful")
local lain = require("lain")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    lain.layout.centerwork,
}
