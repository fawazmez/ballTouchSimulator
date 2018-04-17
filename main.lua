-----------------------------------------------------------------------------------------
--
-- main.Lua
--
-- touch the ball and it happens
--
--
-- Created by: Fawaz Mezher
-- Created on: March 2018 
-----------------------------------------------------------------------------------------

local theBall = display.newImage( "./assets/sprites/ball.png" )
theBall.x = 400
theBall.y = display.contentCenterY
theBall.id = "ball object"
 
function theBall:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

theBall:addEventListener( "touch", theBall )

local Ball = display.newImage( "./assets/sprites/balls.png" )
Ball.x = display.contentCenterX
Ball.y = display.contentCenterY
Ball.id = "balls object"
 
local function onBallTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

Ball:addEventListener( "touch", onBallTouched )