-- actiongenerator.lua

action = require( "classes/action" )

local actiongenerator = {

}

function actiongenerator:new() 
    local obj = {}

    setmetatable( obj, { __index = self } )

    return obj;

end

function actiongenerator:generate( typ, level )
    local dmg =  math.floor( math.random( level, level*3 ) )
    local mod = math.random( level )

    local prefix = { "big", "odd", "cut" }
    local preLen = 3

    local base = { "bam", "tap", "jab" }
    local basLen = 3

    local pre = math.floor( math.random( preLen ) )
    local bas = math.floor( math.random( basLen ) )

    local name = prefix[pre].." "..base[bas]

    return action:new( name, dmg, typ, mod )

end

return actiongenerator