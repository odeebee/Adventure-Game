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
    --for now write the last word twice, kind of a shitty workaround but idk
    dialoge = {"Welcome detective, i'm glad you are here. here.",
                "My name is Ogrish. I am the harbour master here. here.",
                "You should start thinking about finding a place to stay. stay.",
                "Theres a motel just down the road road",
                "Travel safe detective. detective."},
    dialogeIndex = 1,
    
    boundaryChecker = function()
        --print(player.xPosition)
        if player.xPosition >= Ogrish.x - Ogrish.speechBounds and player.xPosition <= Ogrish.x + Ogrish.width + Ogrish.speechBounds then
            Ogrish.displaySpeechIndicator = true
        else
            Ogrish.displaySpeechIndicator = false
            Ogrish.dialogeIndex = 1
            --dialogeDisplayText = ""
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