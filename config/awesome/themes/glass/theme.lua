---------------------------
--   Own awesome theme   --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local shape = require("gears.shape")
local cairo = require("lgi").cairo
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.transparent        = "#00000000"
theme.font          = "sans 8"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#002f3f"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(30)
theme.border_width  = dpi(0)
theme.border_normal = "#000000"
theme.border_focus  = "#05E3E3"
theme.border_marked = "#91231c"

theme.titlebar_bg        = "#05E3E3"

theme.wibar_height         = 20
theme.wibar_width          = 270

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

-- Generate taglist squares:

theme.taglist_border = 15
theme.taglist_spacing = 15
theme.taglist_shape = shape.rectangle
theme.taglist_bg_focus = theme.border_focus
theme.taglist_fg_focus = theme.fg_focus
theme.taglist_fg_occupied = theme.fg_minimize
theme.taglist_bg_occupied = theme.bg_minimize
theme.taglist_fg_empty = theme.fg_minimize
theme.taglist_bg_empty = theme.bg_minimize

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
