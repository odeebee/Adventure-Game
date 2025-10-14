Inventory = {
    inventoryOpen = false,

    list = {"Test1","Test2","Test3","Test4","Test5","Test6","Test7"},

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
                love.graphics.rectangle("fill",Inventory.iconStartPosX+dummy,Inventory.iconStartPosY,50,50)
                dummy = dummy + 60
            end
        end
    end
}