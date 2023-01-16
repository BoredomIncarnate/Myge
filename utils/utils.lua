-- utils.lua

local utils = {}

function utils:getCenter( xpos, ypos, w, h )
    local x = xpos + w / 2
    local y = ypos + h / 2

    return x, y
end

return utils