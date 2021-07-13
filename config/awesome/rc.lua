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
local awful = require("awful")
local menubar = require("menubar")

local vars = require("main.variables")      -- variables
local rules = require("main.rules")         -- rules

local beautiful = require("beautiful")
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/glass/theme.lua")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

require("bindings.bindings")                -- keybindings
require("bindings.screen")                  -- connecting tags to each screen
require("widgets.widgets")                  -- widgets
require("main.signals").setup(c)                     -- Signals

menubar.utils.terminal = vars.TERMINAL      -- terminal for menubar

Mykeyboardlayout = awful.widget.keyboardlayout() -- Keyboard map indicator and switcher

awful.rules.rules = rules.rules             -- rules
local layouts = require("main.layouts").setup()                     -- layouts
