-- importing installed modules
package.path = package.path .. ';/usr/share/lua/5.3/?.lua'

local wibox = require("wibox")

local create_empty_space = require("widgets.empty_space")

  local function centered_line(new_widget)
      local centered_line = wibox.widget {
          {
              create_empty_space(),
              new_widget,
              create_empty_space(),
              expand = "none",
              layout = wibox.layout.align.horizontal
          },
          widget = wibox.widget.background
      }

      return centered_line
  end

  return centered_line
