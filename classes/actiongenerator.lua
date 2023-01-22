-- actiongenerator.lua

action = require( "classes/action" )
utils = require( "utils/utils" )

local actiongenerator = {

}

function actiongenerator:new() 
    local obj = {}

    setmetatable( obj, { __index = self } )

    return obj;

end

function actiongenerator:generate( typ, level )
    local dmgMax = math.random( level, level*3 )
    local dmg =  math.random( level, dmgMax)
    local mod = math.random( dmgMax ) / 2

    local prefix = { 
        "big", "odd", "fab", "zen", "two", 
        "ten", "old", "hot", "no.", "sml",
        "dmg", "pwr", "pnk", "blk", "blu" 
    }
    local preLen = 15

    local base = { 
        "bam", "tap", "jab", "sun", "gas", 
        "top", "sea", "bee", "tea", "cat" 
    }
    local basLen = 10

    local pre = math.random( 1, preLen )
    local bas = math.random( 1, basLen )
    print(pre.." "..bas)

    local name = prefix[pre].." "..base[bas]

    return action:new( name, dmg, typ, mod )

end

return actiongenerator
