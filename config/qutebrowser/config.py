#! /bin/python3

#   @@@@@@    @@@  @@@  @@@@@@@  @@@@@@@@  @@@@@@@   @@@@@@@    @@@@@@   @@@  @@@  @@@   @@@@@@   @@@@@@@@  @@@@@@@
#  @ @@@@@@   @@@  @@@  @@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@   @@@@@@@@  @@@@@@@@
#  @@!  @@@   @@!  @@@    @@!    @@!       @@!  @@@  @@!  @@@  @@!  @@@  @@!  @@!  @@!  !@@       @@!       @@!  @@@
#  !@!  @!@   !@!  @!@    !@!    !@!       !@   @!@  !@!  @!@  !@!  @!@  !@!  !@!  !@!  !@!       !@!       !@!  @!@
#  @!@  !@!   @!@  !@!    @!!    @!!!:!    @!@!@!@   @!@!!@!   @!@  !@!  @!!  !!@  @!@  !!@@!!    @!!!:!    @!@!!@!
#  !@!  !!!   !@!  !!!    !!!    !!!!!:    !!!@!!!!  !!@!@!    !@!  !!!  !@!  !!!  !@!   !!@!!!   !!!!!:    !!@!@!
#  !!:!!:!:   !!:  !!!    !!:    !!:       !!:  !!!  !!: :!!   !!:  !!!  !!:  !!:  !!:       !:!  !!:       !!: :!!
#  :!: :!:    :!:  !:!    :!:    :!:       :!:  !:!  :!:  !:!  :!:  !:!  :!:  :!:  :!:      !:!   :!:       :!:  !:!
#  ::::: :!   ::::: ::     ::     :: ::::   :: ::::  ::   :::  ::::: ::   :::: :: :::   :::: ::    :: ::::  ::   :::
#   : :  :::   : :  :      :     : :: ::   :: : ::    :   : :   : :  :     :: :  : :    :: : :    : :: ::    :   : :


# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

import os
import sys

from qutebrowser.api import interceptor

# blocking websites
c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")

# blocking yt adds
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (url.host() == 'www.youtube.com' and url.path() == '/get_video_info' and '&adformat=' in url.query()):
        info.block()

interceptor.register(filter_yt)

## Colors
teal = "#00F2FF"
darkGray = "#282828"
lightGray = "#434745"

## Loading yml file
config.load_autoconfig()

## UI settings
c.colors.completion.item.selected.bg = teal
c.colors.completion.item.selected.border.top = teal
c.colors.completion.item.selected.border.bottom = teal
c.colors.completion.even.bg = darkGray
c.colors.completion.odd.bg = darkGray
c.colors.completion.scrollbar.bg = darkGray
c.colors.completion.scrollbar.fg = lightGray
c.colors.downloads.bar.bg = darkGray
c.colors.downloads.error.bg = darkGray
c.colors.downloads.start.bg = darkGray
c.colors.downloads.start.fg = lightGray
c.colors.downloads.stop.bg = lightGray
c.colors.downloads.stop.fg = teal
c.colors.hints.bg = darkGray
c.colors.hints.fg = teal
c.hints.border = "3px solid #515151"
c.fonts.hints = "12pt Unscii"
c.prompt.radius = 0
c.completion.shrink = True
c.colors.webpage.darkmode.enabled = True

## Features
c.scrolling.smooth = True

## Start page
c.url.start_pages = ["~/.homepage/home.html"]

## Search engines
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}",
                       "aw": "https://wiki.archlinux.org/?search={}",
                       "a": "https://www.amazon.co.uk/s?k={}",
                       "w": "https://en.wikipedia.org/wiki/{}",
                       "tr": "https://translate.google.com/?text={}",
                       "yt": "https://www.youtube.com/results?search_query={}",
                       "lv": "https://wiki.libvirt.org/page/{}",
                       "web": "https://developer.mozilla.org/en-US/search?q={}",
                       "tex": "https://latex.wikia.org/wiki/Special:Search?query={}",
                       "vi": "https://vim.fandom.com/wiki/Special:Search?query={}",
                       "g": "https://www.google.se/search?q={}",
                       "p": "https://www.pricerunner.com/results?q={}",
                       "b": "https://www.blocket.se/annonser/hela_sverige?q={}",
                       "m": "https://www.google.se/maps/place/{}"}


# keybindings,
c.bindings.commands["normal"] = {"Q": "hint images spawn -u qt-chap {hint-url}",
                                 "M": "hint links spawn mpv {hint-url}",
                                 "j": "scroll-px 0 40",
                                 "k": "scroll-px 0 -40",
                                 "gf": "open feber.se",
                                 "gd": "open discordapp.com/channels/@me",
                                 "gy": "open youtube.com",
                                 "gu": "open reddit.com/r/unixporn",
                                 "xb": "config-cycle statusbar.hide",
                                 "xt": "config-cycle tabs.show always switching",
                                 "ip": "open https://www.myip.com/"}
