-- Mage.lua
-- the structure and functionality of a mage

typ = require( "classes/typ" )

-- struct
local mage = {
    img = nil,
    name = nil,
    spells = {}, -- empty list
    health = {
        max = nil,
        current = nil
    },
    typ = nil
}

-- constructor
function mage:new( img, name, spells, maxHealth, mtyp )
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.img = img or nil
    obj.name = name or "Mage"
    obj.spells = spells or {}
    obj.health = {
        max = maxHealth,
        current = maxHealth
    }
    obj.typ = mtyp or typ.FIRE
    print( obj.typ )
    return obj
end

-- draw the mage's avatar
function mage:display( x, y )
    love.graphics.draw( self.img, x, y )
end

return mage
