---------------------------
--   Own awesome theme   --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xresources_colors = xresources.get_current_theme()

local gfs = require("gears.filesystem")
local shape = require("gears.shape")
local cairo = require("lgi").cairo
local themes_path = gfs.get_themes_dir()

local theme = {
    -- loading colors
    color0 = xresources_colors.color0,
    color1 = xresources_colors.color1,
    color2 = xresources_colors.color2,
    color3 = xresources_colors.color3,
    color4 = xresources_colors.color4,
    color5 = xresources_colors.color5,
    color6 = xresources_colors.color6,
    color7 = xresources_colors.color7,
    color8 = xresources_colors.color8,
    color9 = xresources_colors.color9,
    color10 = xresources_colors.color10,
    color11 = xresources_colors.color11,
    color12 = xresources_colors.color12,
    color13 = xresources_colors.color13,
    color14 = xresources_colors.color14,
    color15 = xresources_colors.color15,
    foreground = xresources_colors.foreground,
    background = xresources_colors.background,
    font = xresources.font
}

theme.transparent   = "#00000000"

-- general background
theme.bg_normal     = theme.background
theme.bg_focus      = theme.color7
theme.bg_urgent     = theme.color1
theme.bg_minimize   = theme.background
theme.bg_systray    = theme.background

-- general foreground
theme.fg_normal     = theme.foreground
theme.fg_focus      = theme.background
theme.fg_urgent     = theme.background
theme.fg_minimize   = theme.background

-- general borders
theme.useless_gap   = dpi(30)
theme.border_width  = dpi(0)
theme.border_normal = theme.background
theme.border_focus  = theme.foreground
theme.border_marked = theme.color6

-- titlebar
theme.titlebar_bg   = theme.color10

-- wibar
theme.wibar_height      = dpi(20)
theme.wibar_width       = dpi(210)
theme.wibar_normal_bg   = theme.color4
theme.wibar_normal_fg   = theme.color3
theme.wibar_bg          = theme.color4
theme.wibar_fg          = theme.color3

-- taglist
theme.taglist_border        = dpi(10)
theme.taglist_spacing       = dpi(10)
theme.taglist_shape         = shape.rectangle
theme.taglist_fg_focus      = theme.background
theme.taglist_bg_focus      = theme.color10
theme.taglist_fg_occupied   = theme.foreground
theme.taglist_bg_occupied   = theme.background
theme.taglist_fg_empty      = theme.foreground
theme.taglist_bg_empty      = theme.background

-- hotkeys popup
theme.hotkeys_font = theme.font
theme.hotkeys_border_width = dpi(10)
theme.hotkeys_border_color = theme.color8
theme.hotkeys_bg = theme.background
theme.hotkeys_fg = theme.foreground
theme.hotkeys_label_fg = theme.background
theme.hotkeys_modifiers_fg = theme.color4

-- menu
theme.menu_submenu_icon = themes_path.."glass/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
theme.menu_bg = xresources_colors.background
theme.menu_fg = xresources_colors.foreground
theme.menu_border_color = theme.color0
theme.menu_border_width = dpi(5)

-- Define the image to load
theme.webb_icon = themes_path.."glass/taglist/squarefw.png"
theme.code_icon = themes_path.."glass/taglist/submenu.png"
theme.titlebar_close_button_normal = themes_path.."glass/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."glass/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."glass/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."glass/titlebar/minimize_focus.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."glass/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."glass/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."glass/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."glass/titlebar/maximized_focus_active.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
