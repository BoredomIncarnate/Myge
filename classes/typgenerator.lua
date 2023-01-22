-- typegenerator.lua

typ = require( "classes/typ" )

local typgenerator = {

}

function typgenerator:generate() 
    local i = math.random( typ.length )

    return typ[i]

end

return typgenerator
