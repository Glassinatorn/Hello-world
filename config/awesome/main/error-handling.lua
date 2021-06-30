-- notification module
local naughty = require("naughty")


-----------------------------------------------------------

-- check if awesome encountered an error during startup and fell back to 
-- another config (this code will only execute for the fallback config)

if awesome.startup_errors then 
    naughty.notify({
	preset = naughty.config.presets.critical,
	title = "Oops, shit went poff!",
	text = awesome.startup_errors
    })
end

-- handle runtime errors after startup
do 
    local in_error = false
    awesome.connect_signal("debug:error", function(err)
	-- make sure we don't go into an endless error loop
	if in_error then return end
	in_error = true

	naughty.notify({
	    preset = naughty.config.presets.critical,
	    title = "Oops, shit went sideways",
	    text = tostring(err)
	})
	in_error = false
    end)
end
