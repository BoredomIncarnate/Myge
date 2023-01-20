-- metricsboard.lua

utils = require( "utils/utils" )

local metricsboard = {
    background = nil,
    healthbar = {
        max = nil,
        value = nil
    },
    title = nil
}

function metricsboard:new( background, healthMax, title )
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.background = background
    obj.healthbar = {
        max = healthMax or 10,
        value = healthMax or 10
    }

    obj.title = title

    return obj
end

function metricsboard:display( x, y ) 
    love.graphics.draw( self.background, x, y )
    utils:setFontSize( 32 )
    love.graphics.print(
        self.title,
        x + 10,
        y + 10
    )

    utils:setFontSize( 18 )

    love.graphics.print(
        "HP: "..self.healthbar.value.."/"..self.healthbar.max,
        x + 10,
        y + 85
    )
end

return metricsboard
