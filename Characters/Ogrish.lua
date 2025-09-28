require "singleton"
require "player"

Ogrish = {
    canDraw = false,
    location = "Docks",
    x = 400,
    width = 50,
    height = 75,
    knownName = "???",
    name = "Ogrish",
    dialoge = {"Welcome detective, i'm glad you are here.",
                "My name is Ogrish. I am the harbour master here.",
                "You should start thinking about finding a place to stay.",
                "Theres a motel just down the road",
                "Travel safe detective."},
    
    boundaryChecker = function()
        print("Boundary")
    end,

    drawCharacter = function()
        if Ogrish.canDraw == true then
            love.graphics.rectangle("fill",Ogrish.x,floorlevel-Ogrish.height,Ogrish.width,Ogrish.height)
        end
    end
}