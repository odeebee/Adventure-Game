player = {
    xPosition = 0,
    speed = 150,
    bspeed = 150
}

function drawPlayer()
    love.graphics.rectangle("fill",player.xPosition, floorlevel-50,25,50)
end
