local io = require("io")
local awful = require("awful")

function deep_copy(original)
    if type(original) ~= "table" then
        return original
    end
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = deep_copy(value)
    end
    return copy
end

function sleep(time)
    local timer = io.popen("sleep " .. time)
    timer:close()
end

local function cmd_to_file(cmd, filename)
    awful.spawn.easy_async_with_shell(cmd .. " > " .. filename)
end

local function output_from_file(filename)
    local file = io.open(filename, "r")

    if file then
        local content = file:read("*a")

        file:close()

        return content
    else
        return "Failed to open the file."
    end
end

local function run_shell_script(cmd)
    local filename = "/var/tmp/tmp_stdout"

    cmd_to_file(cmd,filename)
    sleep(1)
    local output = output_from_file(filename)

    return output
end

local function split_string(input_string)
    local words = {}
    for word in string.gmatch(input_string, "%S+") do
        table.insert(words, word)
    end
    
    return words
end

return {
    deep_copy = deep_copy,
    sleep = sleep,
    run_shell_script = run_shell_script,
    split_string = split_string,
}
