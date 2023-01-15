-- oversees the entire game
-- is the main entry point and communicator to the main.lua

mage = require( "classes/mage" )
statsboard = require( "classes/statsboard" )
timer = require( "classes/timer" )
button = require( "classes/button" )

-- struct
local overseer = {
    playerObj = nil,
    enemyObj = nil,
    statsObj = nil,
    game_timerObj = nil,
    spellBtnObjs = {} -- empty list
}

-- constructor
function overseer:new()
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.playerObj = mage:new(
        love.graphics.newImage( 'assets/pfp_placeholder.png' ),
        "Mage",
        {}
    )

    obj.statsObj = statsboard:new(
        love.graphics.newImage( 'assets/stats_placeholder.png' )
    )

    obj.game_timerObj = timer:new( 0, true )

    obj:init_spellBtns()

    return obj

end

-- abstrasted call for logic related to love.update( dt )
function overseer:update( dt )
    if ( self.game_timerObj ~= 0 ) then
        self.game_timerObj:update( dt )
    end

end

-- abstrasted call for logic related to love.draw( dt )
function overseer:display() 
    if self.statsObj ~= 0  then 
        self.statsObj:display( 0, 0 )
    end

    if self.playerObj ~= 0 then
        self.playerObj:display( 0, 320 )
    end

    if self.game_timerObj ~= 0 then
        love.graphics.print(
            "Run time: "..self.game_timerObj:seconds(),
            300,
            300
        )
    end

    if self.spellBtnObjs ~= 0 then
        for i, btn in ipairs ( self.spellBtnObjs ) do
            btn:draw()
        end
    end

end

function overseer:init_spellBtns()
    local spellBtn = button:new( 
        love.graphics.newImage( 'assets/button.png' )
    )

    local start_x = 240
    local start_y = 320

    for i=1, 2 do
        table.insert(
            self.spellBtnObjs, 
            button:new( 
                love.graphics.newImage( 'assets/button.png' ),
                "Spell"..i,
                start_x,
                start_y
            )
        )
        start_x = start_x * 2
    end

    start_x = 240
    start_y = start_y + 120
    for i=3, 4 do
        table.insert(
            self.spellBtnObjs, 
            button:new( 
                love.graphics.newImage( 'assets/button.png' ),
                "Spell"..i,
                start_x,
                start_y
            )
        )
        start_x = start_x * 2
    end

end

return overseer