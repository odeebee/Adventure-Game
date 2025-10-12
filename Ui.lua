require "conf"

Ui = {
    mouseOverUi = false,

    inventoryButtonX = screenWidth-70-10,

    inventoryButtonY = 10,

    drawUi = function()
        local borderWidth = 1
        love.graphics.setColor(255,255,255)
        love.graphics.rectangle("fill",Ui.inventoryButtonX,Ui.inventoryButtonY,70,25)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill",Ui.inventoryButtonX+borderWidth,Ui.inventoryButtonY+borderWidth,70-borderWidth*2,25-borderWidth*2)
        love.graphics.setColor(255,255,255)
        love.graphics.print("Inventory",Ui.inventoryButtonX+5,Ui.inventoryButtonY+5)
    end,

    isMouseOverUi = function(x,y)
        if x >= Ui.inventoryButtonX and x < Ui.inventoryButtonX + 70 and y >= Ui.inventoryButtonY and y < Ui.inventoryButtonY + 25 then
            return true
        else
            return false
        end
    end,
}
