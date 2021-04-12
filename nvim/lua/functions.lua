local fig = function(arg)
    local to_insert = ""
    local banner = os.execute("~/freetime/figlet/poison.flf " .. {arg})
    vim.put(banner)

    if (vim.fileformat == "vim") then
	to_insert = '"'
    elif (vim.fileformat == "tex")
	to_insert = '%'
    elif (vim.fileformat == "sh")
	to_insert = '#'
    end

    for num = 10, 1, 1
    do
	cmd [[ norm! k>>0ito_insert ]]
    end
end

vim.cmd [[ command! -nargs=1 Fig :call fig(<f-args>) ]]
