require "conf"
require "levels"
require "singleton"
require "player"
require "helperFuncs"

--Characters
require ("Characters.Ogrish")

chars = {}
table.insert(chars, Ogrish)

local tween = require "tween"
local t1

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
end

function love.draw()
    drawPlayer()
    drawLevels()
    drawCharacters()
    drawDialogeText()
end

function love.mousepressed(x,y,button,istouch,presses)
    if button == 1 then
        movePlayer(x)
    end
end

function love.keypressed(key)
    if key == "x" then
        for i=1,#chars do
            if chars[i].displaySpeechIndicator == true then
                if chars[i].dialogeIndex == 1 then
                    dialogeDisplayText = chars[i].dialoge[chars[i].dialogeIndex]
                end
            end
        end
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