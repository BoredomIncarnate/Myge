-- main.lua
-- entry point for love2d

-- import overseer class
overseer = require( "classes/overseer" )

-- overseer instance to be used
local overseerObj = nil

-- load
function love.load( arg )
    -- init overseer
    overseerObj = overseer:new()

end

-- update
function love.update( dt )
    if ( overseerObj ~= 0 ) then
        overseerObj:update( dt )
    end

end

-- draw
function love.draw( dt )
    if ( overseerObj ~= 0 ) then
        overseerObj:display()
    end
    
end


