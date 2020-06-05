---------------------------------------------------
-- Layout for a startpage on 4k
---------------------------------------------------

local wibox = require("wibox")
local awful = require("awful")
local keygrabber = require("awful.keygrabber")
local btext = require("util.mat-button")
local modal = require("util.modal")
local helpers = require("helpers")

-- keylogger
local exit_screen_grabber
function exit_screen_grabber
