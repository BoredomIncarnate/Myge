--button.lua
utils = require( 'utils/utils' )

local button = {
    img = nil,
    text = nil
}

function button:new( img, text, x, y )
    local obj = {}

    setmetatable( obj, { __index = self } )
    obj.img = img or nil
    obj.text = text or "button"
    obj.x = x or 0
    obj.y = y or 0

    return obj;

end

function button:draw()
    love.graphics.draw( self.img, self.x, self.y )

    local text_x, text_y = utils:getTextPosition(
        self.x,
        self.y,
        self.img:getWidth(),
        self.img:getHeight()
    )

    love.graphics.print(
        self.text,
        text_x,
        text_y
    )

end



return button