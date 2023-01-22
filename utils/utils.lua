-- utils.lua

local utils = {}

function utils:getCenter( xpos, ypos, w, h )
    local x = xpos + w / 2
    local y = ypos + h / 2

    return x, y
end

function utils:setFontSize( size )
    if size ~= 0
    and size ~= nil then
        love.graphics.setNewFont( "assets/retrofont/retrofont.ttf", size)
    end
    
end

function utils:resetRandom()
    math.randomseed(os.time())
    math.random()

end

return utils
