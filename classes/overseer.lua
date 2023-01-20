-- oversees the entire game
-- is the main entry point and communicator to the main.lua

mage = require( "classes/mage" )
statsboard = require( "classes/statsboard" )
timer = require( "classes/timer" )
button = require( "classes/button" )
footer = require( "classes/footer" )
metricsboard = require( "classes/metricsboard" )

-- struct
local overseer = {
    playerObj = nil,
    enemyObj = nil,
    statsObj = nil,
    footerObj = nil,
    playerMetricsObj = nil,
    enemyMetricsObj = nil,
    spellBtnObjs = {} -- empty list
}

-- constructor
function overseer:new()
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.playerObj = mage:new(
        love.graphics.newImage( 'assets/pfp_placeholder.png' ), -- img
        "Mage", -- name
        {}, -- spells
        10  -- hp
    )

    obj.playerMetricsObj = metricsboard:new(
        love.graphics.newImage( 'assets/metrics.png' ),
        obj.playerObj.health.max,
        obj.playerObj.name
    )

    obj.enemyObj = mage:new(
        love.graphics.newImage( 'assets/enemy_placeholder.png' ),
        "Enemy",
        {}
    )

    obj.enemyMetricsObj = metricsboard:new(
        love.graphics.newImage( 'assets/metrics.png' ),
        obj.enemyObj.health.max,
        obj.enemyObj.name
    )

    obj.statsObj = statsboard:new(
        love.graphics.newImage( 'assets/stats_placeholder.png' )
    )

    obj.footerObj = footer:new()

    obj:init_spellBtns()

    return obj

end

-- abstrasted call for logic related to love.update( dt )
function overseer:update( dt )
    if ( self.statsObj ~= 0 ) then
        self.statsObj:update( dt )
    end

    if ( self.playerObj ~= 0 )
    and ( self.playerMetricsObj ~= 0) then
        self.playerMetricsObj.healthbar.max = self.playerObj.health.max
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

    if self.playerMetricsObj ~= 0 then
        self.playerMetricsObj:display( 720, 320 )
    end

    if self.enemyObj ~= 0 then
        self.enemyObj:display( 240, 0 )
    end

    if self.enemyMetricsObj ~= 0 then
        self.enemyMetricsObj:display( 720, 0 )
    end

    if self.spellBtnObjs ~= 0 then
        for i, btn in ipairs ( self.spellBtnObjs ) do
            btn:display()
        end
    end

    if self.footerObj ~= 0 then
        self.footerObj:display()
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
                "Spell "..i,
                "This is Spell "..i.."; it is rubbish.",
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
                "Spell "..i,
                "This is Spell "..i.."; it is rubbish.",
                start_x,
                start_y
            )
        )
        start_x = start_x * 2
    end

end

function overseer:scanClick( x, y )
    for i, btn in pairs( self.spellBtnObjs ) do
        if  x >= btn.x 
        and y >= btn.y
        and x < btn.x + btn.img:getWidth()
        and y < btn.y + btn.img:getHeight() then
            btn:func()
            self:setLastAction( btn.text.." was\n\nclicked" )
        end
    end

end

function overseer:scanHover( x, y )
    for i, btn in pairs( self.spellBtnObjs ) do
        if  x >= btn.x 
        and y >= btn.y
        and x < btn.x + btn.img:getWidth()
        and y < btn.y + btn.img:getHeight() then
            self.footerObj:update( btn.info )
        end
    end

end

function overseer:setLastAction( str )
    self.statsObj.lastAction = str
end

return overseer
