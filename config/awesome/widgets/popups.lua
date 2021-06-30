wibox = require('wibox')
local mysides = {
    widget = {
        {
            {
                markup = "<b>Tasks</b>",
                widget = wibox.widget.textbox,
                align = "center",
                bg = "#ececec",
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = 10,
        widget  = wibox.container.margin,
    },
    ontop = true,
    x = 10,
    y = 10,
    visible = false,
}

return {mysides = mysides}
