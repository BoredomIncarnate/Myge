--button.lua
utils = require( 'utils/utils' )

local button = {
    img = nil,
    text = nil,
    func = nil
}

function button:new( img, text, info, x, y, func )
    local obj = {}

    setmetatable( obj, { __index = self } )
    obj.img = img or nil
    obj.text = text or "button"
    obj.x = x or 0
    obj.y = y or 0
    obj.func = func or function() 
        print( obj.text.." has been clicked." )
    end
    obj.info = info or "info"

    return obj;

end

function button:display()
    love.graphics.draw( self.img, self.x, self.y )

    local cent_x, cent_y = utils:getCenter(
        self.x,
        self.y,
        self.img:getWidth(),
        self.img:getHeight()
    )


    utils:setFontSize( 22 )
    -- TODO: change how we adjust from center for text length
    love.graphics.print(
        self.text,
        cent_x - 70,
        cent_y - 10
    )

end

return button