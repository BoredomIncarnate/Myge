-- action.lua

local action = {
    name = "",
    dmg = 0,
    typ = nil,
    mod = 0
}

function action:new( name, damage, magic_type, modifier ) 
    local obj = {}

    setmetatable( obj, { __index = self } )
    obj.name = name
    obj.dmg = damage
    obj.typ = magic_type
    obj.mod = modifier

    return obj

end

function action:basedmg( caster_magic_type )
    local dmg = self.dmg

    if ( caster_magic_type == self.typ ) then
        dmg = dmg * mod
    else
        dmg = dmg * ( mod / 2 )
    end

    return dmg

end

return action