-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = Config.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Key bindings

function _M.get(global_keys)
  -- Bind all key numbers to tags.
  for i = 1, 9 do
    global_keys = gears.table.join(global_keys,
      -- View tag only.

      -- Toggle tag display.

      -- Move client to tag.
      
      -- Toggle tag on focused client.
    )
  end

  return global_keys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
