-- utils.lua

local utils = {}

function utils:getTextPosition( xpos, ypos, w, h )
    local x = xpos + w / 2
    local y = ypos + h / 2

    return x, y
end

return utils