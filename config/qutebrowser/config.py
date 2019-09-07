#    8""""8
#    8    8 e   e eeeee eeee eeeee  eeeee  eeeee e   e  e eeeee eeee eeeee
#    8    8 8   8   8   8    8   8  8   8  8  88 8   8  8 8   " 8    8   8
#    8    8 8e  8   8e  8eee 8eee8e 8eee8e 8   8 8e  8  8 8eeee 8eee 8eee8e
#    8 ___8 88  8   88  88   88   8 88   8 8   8 88  8  8    88 88   88   8
#    8e8888 88ee8   88  88ee 88eee8 88   8 8eee8 88ee8ee8 8ee88 88ee 88   8

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
c.fonts.monospace = "DejaVu Sans Mono"
c.prompt.radius = 0
c.completion.shrink = True

## Features
c.scrolling.smooth = True

## Start page
c.url.start_pages = ["/home/glass/.homepage/home.html"]

## Search engines
c.url.searchengines = {"DEFAULT": "https://qwant.com/?l=en&q={}&",
                        "aw": "https://wiki.archlinux.org/?search={}",
                        "duck": "https://duckduckgo.com/?q={}",
                        "w": "https://en.wikipedia.org/wiki/{}",
                        "tra": "https://translate.google.com/?text={}",
                        "yt": "https://www.youtube.com/results?search_query={}",
                        "lv": "https://wiki.libvirt.org/page/{}",
                        "web": "https://developer.mozilla.org/en-US/search?q={}",
                        "tex": "https://ctan.org/search?phrase={}",
                        "vi": "https://vim.fandom.com/wiki/Special:Search?query={}",
                        "g": "https://www.google.se/search?q={}",
                        "m": "https://www.google.co.uk/maps/place/{}"}


## Keybindings
config.bind('Q', 'hint images spawn -u qt-chap {hint-url}')