timer = require( "classes/timer" )
strings = require( "static/strings" )
utils = require( "utils/utils" )

-- struct
local statsboard = {
    background_img = nil,
    runtime = nil, -- game runtime timer
    lastAction = nil -- last action recorded by the system
}

-- constructor
function statsboard:new( image )
    
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.background_img = image
    obj.runtime = timer:new( 0, true )
    obj.lastAction = strings.gameInit

    return obj
end

function statsboard:update( dt )
    self.runtime:update( dt )

end

-- draw the stats board
function statsboard:display(x, y) 
    love.graphics.draw(self.background_img, x, y)
    utils:setFontSize(14)

    love.graphics.print(
        self.lastAction,
        x + 10,
        y + 50
    )
end

return statsboard