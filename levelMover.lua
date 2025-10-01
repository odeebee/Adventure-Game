require "levels"
require "player"

displayLeft = true
displayRight = true

displayWidth = 35

function levelMoveBoundaryCheck(dt)
    print(player.xPosition)
end

function drawGradient()
    if displayLeft == true then
        love.graphics.setColor(255,255,255,0.1)
        love.graphics.rectangle("fill",0,0,displayWidth,screenHeight)
        love.graphics.setColor(255,255,255,1)
    end
end