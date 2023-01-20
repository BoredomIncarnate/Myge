--button.lua
utils = require( 'utils/utils' )
action = require( 'classes/action' )

local button = {
    img = nil,
    text = "",
    info = "",
    x = 0,
    y = 0,
    action = {},
    func = nil
}

function button:new( img, text, x, y, act, func )
    local obj = {}

    setmetatable( obj, { __index = self } )
    obj.img = img or nil
    obj.text = text or "button"
    obj.x = x or 0
    obj.y = y or 0
    obj.action = act or action:new(
        obj.text,
        3, 
        "fire",
        1
    )
    obj.func = func or function() 
        print( obj.text.." has been clicked." )
    end

    return obj;

end

function button:info() 
    return "DMG: "..self.action.dmg.."    MOD: "..self.action.mod.."\n\nTYP: "..self.action.typ
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
