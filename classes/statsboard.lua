-- struct
local statsboard = {
    background_img = nil,
    score = 0,
    level = 0,
    xp = 0
}

-- constructor
function statsboard:new( image )
    
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.background_img = image
    obj.score = 0
    obj.level = 0
    obj.xp = 0

    return obj
end

-- draw the stats board
function statsboard:display(x, y) 
    love.graphics.draw(self.background_img, x, y)
end

return statsboard