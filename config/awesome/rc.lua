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
                                                                              

-- TODO:
--  rules [x]
--  signals [x]
--  layouts [x]
--  bindings [x]
--  screen [v]
--  widgets []

pcall(require, "luarocks.loader") -- luarocks

-- importing aweomsewm libraries
local awful = require("awful")
local menubar = require("menubar")

local vars = require("main.variables")      -- variables
local rules = require("main.rules")         -- rules
local layouts = require("main.layouts")     -- layouts

local beautiful = require("beautiful")
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/glass/theme.lua")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local bindings = require("bindings.bindings")                -- keybindings
require("bindings.screen")                  -- connecting tags to each screen
require("widgets.widgets")                  -- widgets
local signals = require("main.signals")     -- Signals

menubar.utils.terminal = vars.TERMINAL      -- terminal for menubar

Mykeyboardlayout = awful.widget.keyboardlayout() -- Keyboard map indicator and switcher

rules.setup()             -- rules
signals.setup(c)
layouts.setup(c)
bindings.setup()
