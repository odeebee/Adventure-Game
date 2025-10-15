Inventory = {
    inventoryOpen = false,

    list = {},

    showInventory = function()
        if Inventory.inventoryOpen == false then
            Inventory.inventoryOpen = true
        else
            Inventory.inventoryOpen = false
        end
    end,

    iconStartPosX = 60,
    iconStartPosY = 60,

    displayAllItems = function()
        if Inventory.inventoryOpen == true then
            dummy = 0
            for i=1,#Inventory.list do
                --love.graphics.setColor(255,0,0)
                --love.graphics.rectangle("fill",Inventory.iconStartPosX+dummy,Inventory.iconStartPosY,50,50)
                for j=1,#items do
                    if items[j].name == Inventory.list[i] then
                        love.graphics.draw(items[j].icon,Inventory.iconStartPosX+dummy,Inventory.iconStartPosY)
                    else
                        love.graphics.rectangle("fill",Inventory.iconStartPosX+dummy,Inventory.iconStartPosY,50,50)
                    end
                end
                dummy = dummy + 60
            end
        end
    end
}