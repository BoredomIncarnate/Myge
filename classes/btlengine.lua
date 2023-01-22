-- btlengine.lua
-- the battle engine


local btlengine = {
    turn = 0,
    plrKey = 1,
    emyKey = 2,
    plrHasEnded = false,
    emyHasEnded = false,
    plrAct = {},
    emyAct = {},
    isEndPhase = false
}

function btlengine:new()
    local obj = {}

    setmetatable( obj, { __index = self } )

    obj.turn = 1
    obj.plrKey = 1
    obj.emyKey = 2
    obj.plrHasEnded = false
    obj.emyHasEnded = false
    obj.plrAct = nil
    obj.emyAct = nil
    obj.isEndPhase = false

    return obj

end

function btlengine:submit( key, action )
    local submitted = false

    -- submit the player action,
    -- if the player hasn't taken an action this turn
    if ( key == self.plrKey )
    and ( self.plrEnd == false ) then
        self.plrAct = nil
        self.plrAct = action
        self.plrHasEnded = true
        submitted = true
    -- submit the enemy action,
    -- if the enemy hasn't taken an action this turn
    elseif ( key == self.emyKey )
    and ( self.emyEnd == false ) then
        self.emyAct = nil
        self.emyAct = action
        self.emyHasEnded = true
        submitted = true
    end

    if ( self.plrEnd )
    and ( self.emyEnd ) then
        self.isEndPhase = true
    end
    
    return submitted

end

function btlengine:determineOutcomes( playerObj, enemyObj )
    if ( self.plyAct == nil )
    or ( self.emyAct == nil ) 
    or ( self.isEndPhase == false ) then
        return nil
    end

end

function btlengine:calculate( target, action )
    local rawDmg = action:basedmg()
    
    

end

function btlengine:reset() 
    self.turn = 1
    self.plrAct = nil
    self.emyAct = nil
    self.isEndPhase = false

end

return btlengine
