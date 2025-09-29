require "singleton"
require "player"

Ogrish = {
    displaySpeechIndicator = false,
    speechBounds = 50,
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
    dialogeIndex = 1,
    
    boundaryChecker = function()
        --print(player.xPosition)
        if player.xPosition >= Ogrish.x - Ogrish.speechBounds and player.xPosition <= Ogrish.x + Ogrish.width + Ogrish.speechBounds then
            Ogrish.displaySpeechIndicator = true
        else
            Ogrish.displaySpeechIndicator = false
        end
    end,

    drawCharacter = function()
        if Ogrish.canDraw == true then
            love.graphics.rectangle("fill",
                                    Ogrish.x,
                                    floorlevel-Ogrish.height,
                                    Ogrish.width,
                                    Ogrish.height)
            if Ogrish.displaySpeechIndicator == true then
                love.graphics.print("Press X", Ogrish.x,floorlevel-Ogrish.height-20)
            end
        end
    end
}