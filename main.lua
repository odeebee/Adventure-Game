require "conf"
require "levels"
require "singleton"
require "player"
require "helperFuncs"
require "levelMover"

--Characters
require ("Characters.Ogrish")

chars = {}
table.insert(chars, Ogrish)

local tween = require "tween"
local t1

displayTable = {}
displayTimerTable = {}
displayIndex = 1
displayTimer = 0
displayIterations = 0
firstLineDisplayed = false
displayLineFinished = true

TIMER = 0

dialogeDisplayText = ""

function love.load()
    love.window.setMode(screenWidth,screenHeight)
    levelIndex = 1 --Docks
    floorlevel = levelFloorLevels[levelIndex]
end

function love.update(dt)
    if t1 then
        t1:update(dt)
    end

    updateCharsBoundaries()
    levelMoveBoundaryCheck(dt)

    TIMER = TIMER + dt
    if TIMER > tickTime then
        TIMER = 0
        tick()
    end
end

function love.draw()
    drawPlayer()
    drawLevels()
    drawCharacters()
    drawDialogeText()
    drawGradient()
end

function love.mousepressed(x,y,button,istouch,presses)
    if button == 1 then
        movePlayer(x)
    end
end

function love.keypressed(key)
    if key == "x" then
        for i=1,#chars do

            local characterDialogeTable = chars[i].dialoge
            if dialogeDisplayText == "" and (chars[i].dialogeIndex == #characterDialogeTable) then
                chars[i].dialogeIndex = 1
            end

            if chars[i].displaySpeechIndicator == true and (chars[i].dialogeIndex < #characterDialogeTable) and displayLineFinished == true then
                displayLineFinished = false
                print(chars[i].dialogeIndex,#characterDialogeTable-1)
                if chars[i].dialogeIndex == 1 and firstLineDisplayed == false then
                    --dialogeDisplayText = chars[i].dialoge[chars[i].dialogeIndex]
                    updateDialogeText(chars[i].dialoge[chars[i].dialogeIndex])
                else
                    chars[i].dialogeIndex = chars[i].dialogeIndex + 1
                    updateDialogeText(chars[i].dialoge[chars[i].dialogeIndex])
                end
            end
            if chars[i].displaySpeechIndicator == true and (chars[i].dialogeIndex == #characterDialogeTable) then
                --chars[i].dialogeIndex = 1
                dialogeDisplayText=""
            end
        end
    end

    if key == "space" then
        --print("Space")
        moveLevel()
    end
end

function drawCharacters()
    for i=1,#chars do
        if chars[i].location == levelNames[levelIndex] then
            chars[i].canDraw = true
            chars[i].drawCharacter()
        end
    end
end 

function drawLevels()
    if levelIndex == 1 then
        drawDocks()
    end
end

function drawDocks()
    love.graphics.setColor(255,255,255)
    love.graphics.line(0,floorlevel,screenWidth,floorlevel)
end

function movePlayer(x)
    local distance = math.abs(x - player.xPosition)
    local time = distance / player.speed
    if time > 0 then
        t1 = tween.new(time,player,{xPosition = x})
    end
end

function drawDialogeText()
    love.graphics.print(dialogeDisplayText)
end

function updateCharsBoundaries()
    for i=1,#chars do
        if chars[i].location == levelNames[levelIndex] then
            chars[i].boundaryChecker()
        end
    end
end

function tick()
    --A tick is every 0.l seconds
    updateDialogeTable()
end

function updateDialogeText(dialogeToDisplay)
    dialogeDisplayText = ""
    print("Updated Dialoge Text")
    print(dialogeToDisplay)
    for str in string.gmatch(dialogeToDisplay, "([^".."%s".."]+)") do 
        table.insert(displayTable,str)
    end

    for i=1,#displayTable do
        table.insert(displayTimerTable,#displayTable[i])
    end
    displayTimerTable[1] = 1 -- sets the first words timer to 1, this just makes sure the first word displays instantly
end

function updateDialogeTable()
    love.graphics.print(dialogeDisplayText)
    if #displayTable > 0 and displayIterations < #displayTable-1 then
        if displayTimer == 0 then
            dialogeDisplayText = dialogeDisplayText .. displayTable[displayIndex] .. " "
            displayIndex = displayIndex + 1
            displayTimer = displayTimerTable[displayIndex]
            displayIterations = displayIterations + 1
        end
        if displayTimer > 0 then
            displayTimer = displayTimer - 1
        end
    end

    if displayIterations == #displayTable-1 and firstLineDisplayed == false then
        print("FINISHED")
        displayLineFinished = true
        firstLineDisplayed = true
    end

    if displayIterations == #displayTable-1 and displayLineFinished == false then
        print("FINISHED AFTER FIRST LINE")
        displayLineFinished = true
    end

end