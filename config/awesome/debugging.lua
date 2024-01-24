local function dump_table(table)
    if type(table) == "table" then
        local s = '{'
        for k, v in pairs(table) do
            if type(k) ~= "number" then k = '"'..k..'"' end
            s = s .. k .. ' = ' .. dump_table(v) .. ', '
        end
        return s .. '}'
    else
        return tostring(table)
    end
end

return { dump_table = dump_table }
