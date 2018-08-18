local composer = require( "composer" )
 
local scene = composer.newScene()

local background

local starTable = {}

local starTime = 10000

local function spawnStar()
    star = display.newCircle(10,10,2)
    star.x = math.random(display.contentCenterX,display.contentCenterX)
    star.y = math.random(display.contentCenterY,display.contentCenterY)
    moveR = math.random(1,4)
    if moveR == 1 then
        transition.moveTo(star, {x = -200, y = math.random(0,1920), time = starTime})
    elseif moveR == 2 then
        transition.moveTo(star, {x = 1200, y = math.random(0,1920), time = starTime})
    elseif moveR == 3 then
        transition.moveTo(star, {x = math.random(0, 1080), y = -200, time = starTime})
    elseif moveR == 4 then
        transition.moveTo(star, {x = math.random(0, 1080), y = 2000, time = starTime})
    end
    table.insert(starTable, star)
end

local moonTable = {}

local function spawnMoon()
    local moon = display.newImage("moon.png")
    moon.x = display.contentCenterX
    moon.y = display.contentCenterY + 180
    moon.width = 800
    moon.height = 800
    table.insert(moonTable, moon)
end

spawnMoon()

-- create()
function scene:create( event )
 
    local sceneGroup = self.view

    local bg = display.newImage("background.png")
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local years = display.newText("5 YEARS", display.contentCenterX, 90, "Dosis-Medium", 147)
    local months = display.newText("7 MONTHS", display.contentCenterX, 200, "Dosis-Medium", 120)
    local days = display.newText("25 DAYS", display.contentCenterX, 310, "Dosis-Medium", 150)
    local hours = display.newText("20 HOURS", display.contentCenterX, 420, "Dosis-Medium", 120)
    local minutes = display.newText("47 MINUTES", display.contentCenterX, 520, "Dosis-Medium", 105)
    local seconds = display.newText("69 SECONDS", display.contentCenterX, 610, "Dosis-Medium", 98)

    local hasta = display.newText("Until", display.contentCenterX, 1650, "Dosis-Medium", 100)

    local date = display.newText("Apirl 8th, 2024", display.contentCenterX, 1800, "Dosis-Medium", 100)

    spawnStarTimer = timer.performWithDelay(100, spawnStar, 0)

    sceneGroup:insert(bg)

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene