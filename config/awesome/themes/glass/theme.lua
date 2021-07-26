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
}

theme.transparent   = "#00000000"
--require("naughty").
theme.font          = "sans 8"

-- general background
theme.bg_normal     = theme.background
theme.bg_focus      = theme.color1
theme.bg_urgent     = theme.color11
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
theme.titlebar_bg   = theme.color8

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
theme.taglist_bg_focus      = theme.color8
theme.taglist_fg_occupied   = theme.foreground
theme.taglist_bg_occupied   = theme.background
theme.taglist_fg_empty      = theme.foreground
theme.taglist_bg_empty      = theme.background

-- clients

-- hotkeys popup
theme.hotkeys_bg = theme.background
theme.hotkeys_fg = theme.foreground
-- theme.hotkeys_bg	Hotkeys widget background color.
-- theme.hotkeys_fg	Hotkeys widget foreground color.
-- theme.hotkeys_border_width	Hotkeys widget border width.
-- theme.hotkeys_border_color	Hotkeys widget border color.
-- theme.hotkeys_shape	Hotkeys widget shape.
-- theme.hotkeys_modifiers_fg	Foreground color used for hotkey modifiers (Ctrl, Alt, Super, etc).
-- theme.hotkeys_label_bg	Background color used for miscellaneous labels of hotkeys widget.
-- theme.hotkeys_label_fg	Foreground color used for hotkey groups and other labels.
-- theme.hotkeys_font	Main hotkeys widget font.
-- theme.hotkeys_description_font	Font used for hotkeys' descriptions.
-- theme.hotkeys_group_margin	Margin between hotkeys groups.

--theme.wibar_=
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"


-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg1_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."glass/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
theme.menu_bg = xresources_colors.background
theme.menu_fg = xresources_colors.foreground

-- Define the image to load
theme.webb_icon = themes_path.."glass/taglist/squarefw.png"
theme.code_icon = themes_path.."glass/taglist/submenu.png"
theme.titlebar_close_button_normal = themes_path.."glass/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."glass/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."glass/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."glass/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."glass/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."glass/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."glass/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."glass/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."glass/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."glass/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."glass/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."glass/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."glass/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."glass/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."glass/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."glass/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."glass/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."glass/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."glass/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."glass/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."glass/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."glass/layouts/fairhw.png"
theme.layout_fairv = themes_path.."glass/layouts/fairvw.png"
theme.layout_floating  = themes_path.."glass/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."glass/layouts/magnifierw.png"
theme.layout_max = themes_path.."glass/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."glass/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."glass/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."glass/layouts/tileleftw.png"
theme.layout_tile = themes_path.."glass/layouts/tilew.png"
theme.layout_tiletop = themes_path.."glass/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."glass/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."glass/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."glass/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."glass/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."glass/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."glass/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
