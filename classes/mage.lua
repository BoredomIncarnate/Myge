-- Mage.lua
-- the structure and functionality of a mage

-- struct
local mage = {
    img = nil,
    name = nil,
    spells = {} -- empty list
}

-- constructor
function mage:new( img, name, spells )
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.img = img or nil
    obj.name = name or "Mage"
    obj.spells = spells or {}

    return obj
end

-- cast the spell of the given spells-list-index
function mage:cast( spellIndex )

end

-- draw the mage's avatar
function mage:display( x, y )
    love.graphics.draw( self.img, x, y )
end

return mage