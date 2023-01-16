-- footer.lua

timer = require( "classes/timer" )
strings = require( "static/strings" )

local footer = {
    runtime = nil, -- game runtime timer
    lastAction = nil -- last action recorded by the system
}

function footer:new() 
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.runtime = timer:new( 0, true )
    obj.lastAction = strings.gameInit

    return obj

end

function footer:update( dt )
    self.runtime:update( dt )

end

function footer:display()
    love.graphics.setNewFont( "assets/retrofont/retrofont.ttf", 16)
    love.graphics.print(
        "Current runtime: "..self.runtime:seconds(),
        250,
        580
    )

    love.graphics.print(
        self.lastAction,
        250,
        600
    )

end

return footer