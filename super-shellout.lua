-- SPDX-License-Identifier: AGPL-3.0+
-- based on vis-fzf-open by Guillaume Chérel
-- https://github.com/guillaumecherel/vis-fzf-open

vis:command_register("R", function(argv, force, win, selection, range)
    local command = table.concat(argv, " ")

    local file = io.popen(command)
    local output = file:read("*all")
    local success, msg, status = file:close()

    if status == 0 then 
        if output then
            if string.sub(output, -1, -1) == "\n" then
                -- remove trailing newline
                output = string.sub(output, 0, -2)
            end
            vis:insert(output)
        else
            vis:info("No output")
        end
    else
        vis:info(string.format("exit code %i", status))
    end

    vis:feedkeys("<vis-redraw>")

    return true;
end)
