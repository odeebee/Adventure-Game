require "levels"
require "player"
require "conf"

local tween = require "tween"

displayLeft = true
displayRight = true

displayWidth = 35
aplhaValue = 0.5
alphaTime = 0.7

local t2
aplhaVars={
    alpha=0
}

aplhaVarsR={
    alpha=0
}

function levelMoveBoundaryCheck(dt)
    if t2 then
        t2:update(dt)
    end

    if player.xPosition > 0 and player.xPosition < 50 then
        displayLeft = true
    else
        displayLeft = false
    end

    if player.xPosition < screenWidth and player.xPosition > screenWidth - 50 then
        displayRight = true
    else
        displayRight = false
    end
end

function drawGradient()
    if displayLeft == true then
        t2 = tween.new(alphaTime,aplhaVars,{alpha=aplhaValue})
        love.graphics.setColor(255,255,255,aplhaVars.alpha)
        love.graphics.rectangle("fill",0,0,displayWidth,screenHeight)
        love.graphics.setColor(255,255,255,1)
    end
    if displayLeft == false then
        t2 = tween.new(1,aplhaVars,{alpha=0})
        love.graphics.setColor(255,255,255,aplhaVars.alpha)
        love.graphics.rectangle("fill",0,0,displayWidth,screenHeight)
        love.graphics.setColor(255,255,255,1)
    end

    if player.xPosition > 500 then
        if displayRight == true then
            t2 = tween.new(alphaTime,aplhaVarsR,{alpha=aplhaValue})
            love.graphics.setColor(255,255,255,aplhaVarsR.alpha)
            love.graphics.rectangle("fill",screenWidth-displayWidth,0,displayWidth,screenHeight)
            love.graphics.setColor(255,255,255,1)
        end    
        if displayRight == false then
            t2 = tween.new(alphaTime,aplhaVarsR,{alpha=0})
            love.graphics.setColor(255,255,255,aplhaVarsR.alpha)
            love.graphics.rectangle("fill",screenWidth-displayWidth,0,displayWidth,screenHeight)
            love.graphics.setColor(255,255,255,1)
        end
    end
end