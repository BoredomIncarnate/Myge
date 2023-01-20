-- footer.lua
utils = require( "utils/utils" )

local footer = {
    text = nil
}

function footer:new() 
    local obj = {}

    setmetatable( obj, { __index = self } )
    obj.text = strings.gameInit

    return obj

end

function footer:update( str )
   self.text = str

end

function footer:display()
    utils:setFontSize(14)
    love.graphics.print(
        self.text,
        250,
        580
    )

end

return footer