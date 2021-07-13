--  @@@@@@   @@@  @@@  @@@  @@@@@@@@   @@@@@@    @@@@@@   @@@@@@@@@@   @@@@@@@@  
-- @@@@@@@@  @@@  @@@  @@@  @@@@@@@@  @@@@@@@   @@@@@@@@  @@@@@@@@@@@  @@@@@@@@  
-- @@!  @@@  @@!  @@!  @@!  @@!       !@@       @@!  @@@  @@! @@! @@!  @@!       
-- !@!  @!@  !@!  !@!  !@!  !@!       !@!       !@!  @!@  !@! !@! !@!  !@!       
-- @!@!@!@!  @!!  !!@  @!@  @!!!:!    !!@@!!    @!@  !@!  @!! !!@ @!@  @!!!:!    
-- !!!@!!!!  !@!  !!!  !@!  !!!!!:     !!@!!!   !@!  !!!  !@!   ! !@!  !!!!!:    
-- !!:  !!!  !!:  !!:  !!:  !!:            !:!  !!:  !!!  !!:     !!:  !!:       
-- :!:  !:!  :!:  :!:  :!:  :!:           !:!   :!:  !:!  :!:     :!:  :!:       
-- ::   :::   :::: :: :::    :: ::::  :::: ::   ::::: ::  :::     ::    :: ::::  
--  :   : :    :: :  : :    : :: ::   :: : :     : :  :    :      :    : :: ::   
                                                                              

pcall(require, "luarocks.loader") -- luarocks

-- importing aweomsewm libraries
local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local cairo = require("lgi").cairo
local wibox = require("wibox")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- theming definitions
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/glass/theme.lua")

local vars = require("main.variables")      -- variables
local bindings = require("bindings.bindings")   -- keybindings
require("bindings.screen")                      -- connecting tags to each screen
local rules = require("main.rules")         -- rules
local widgets = require("widgets.widgets")     -- widgets

require("main.layouts")                     -- layouts

menubar.utils.terminal = vars.TERMINAL      -- terminal for menubar

-- Keyboard map indicator and switcher
Mykeyboardlayout = awful.widget.keyboardlayout()

awful.rules.rules = rules.rules             -- rules


require("main.signals")                     -- Signals
