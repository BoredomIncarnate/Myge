--btlengine.lua

local btlengine = {
    turn = 0,
    plrKey = 1,
    emyKey = 2,
    plrEnd = false,
    emyEnd = false
}

function btlengine:new()
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.turn = 1
    obj.plrKey = 1
    obj.emyKey = 2
    obj.plrEnd = false
    obj.emyEnd = false

    return obj

end

function btlengine:submit( key, action )

end

function 

return btlengine
