local io = require("io")
local awful = require("awful")
local naughty = require("naughty")

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

local function cmd_get_output(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()

    return result
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

local function read_file(filename)
    local file = io.open(filename, "rb") -- r read mode and b binary mode

    if not file then return nil end

    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()

    return content
end

local function round(number, nr_of_decimals)
  local mult = 10^(nr_of_decimals or 0)

  return math.floor(number * mult + 0.5) / mult
end

local function num_to_words(number)
    if tonumber(number) > 1000000000000 then
        return tostring(round(number / 1000000000000)) .. " T"
    elseif tonumber(number) > 1000000000 then
        return tostring(round(number / 1000000000)) .. " B"
    elseif tonumber(number) > 1000000  then
        return tostring(round(number / 1000000)) .. " M"
    end

    return number
end


return {
    deep_copy = deep_copy,
    sleep = sleep,
    run_shell_script = run_shell_script,
    cmd_get_output = cmd_get_output,
    split_string = split_string,
    read_file = read_file,
    round = round,
    num_to_words = num_to_words,
}
