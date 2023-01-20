local timer = {
    ms = 0,
    isActive = true,
}

function timer:new( seconds, isActive )
    local obj = {}
    
    setmetatable(obj, { __index = self } )
    obj.ms = ms or 0
    obj.isActive = isActive or true

    return obj
end


function timer:update( dt ) 
    if self.isActive then
        self.ms = self.ms + dt
    end

end

function timer:seconds()
    return math.floor( math.abs( self.ms ) )
end

return timer
