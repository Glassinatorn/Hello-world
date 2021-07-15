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
--  screen [x]
--  widgets []

pcall(require, "luarocks.loader") -- luarocks

-- importing aweomsewm libraries
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/glass/theme.lua")

local vars = require("main.variables")      -- variables
local rules = require("main.rules")         -- rules
local layouts = require("main.layouts")     -- layouts
local bindings = require("bindings.bindings")                -- keybindings
local screen = require("bindings.screen")                  -- connecting tags to each screen
local signals = require("main.signals")     -- Signals

require("widgets.widgets")                  -- widgets


rules.setup()             -- rules
signals.setup(c)
layouts.setup(c)
bindings.setup()
screen.setup(s)
