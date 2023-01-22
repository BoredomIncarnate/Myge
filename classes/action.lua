-- action.lua

local action = {
    name = "",
    dmg = 0,
    typ = nil,
    mod = 0
}

function action:new( name, damage, magic_type, modifier ) 
    local obj = {}

    print( magic_type )

    setmetatable( obj, { __index = self } )
    obj.name = name
    obj.dmg = damage
    obj.typ = magic_type
    obj.mod = modifier

    return obj

end

function action:basedmg()
    return self.dmg + ( self.dmg * self.mod ) / 2

end

function action:info()
    return "DMG: "..self.dmg.."\tMOD: "..self.mod.."\n\nTYP: "..self.typ

end

return action