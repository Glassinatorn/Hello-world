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
                                                                              

-- importing libraries
pcall(require, "luarocks.loader") -- luarocks

-- importing aweomsewm libraries
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
local awful = require("awful")
local beautiful = require("beautiful")
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/glass/theme.lua")

local functions = require("functions")  -- functions to manage clients
local rules = require("rules")          -- tags
local layouts = require("layouts")      -- layouts for clients
local info_panel = require("info_panel") -- info panel
local keys = require("keys")            -- keybindings

-- setups
functions.setup_signals(c)
functions.setup_taglist(s)
rules.setup_rules()
layouts.setup_layouts()
-- info_panel.setup(s)
keys.setup_keybindings()

-- autostart applications
awful.spawn.with_shell("$HOME/.local/bin/own/fix.sh") -- fix screens, wallpaper, etc
awful.spawn.with_shell("$HOME/.local/bin/own/autostart.sh") -- autostart applications
