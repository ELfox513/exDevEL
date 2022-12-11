--[[
    - exDevEL loading script
]]
exdevel = {_noSyncCheck = true}
dofile("scripts/exDevEL/_header.lua")

-- Select mode ------------------------------------------------

exdevel.devmode = (Config:getModId() == "exDevEL")
if exdevel.devmode then
    elog("Running in development mode")
else
    elog("Running in mod mode")
end

-- loading modules --------------------------------------------

local modules = getFileHandler("scripts/exDevEL"):list()
for i = 1, #modules do
    if modules[i]:name():sub(1, 1) ~= "_" then
        dofile(modules[i]:toString())
    end
end
elog("All modules loaded")

-- creating the menu toggle button ----------------------------

local toggleButtonLayer = UiManager:addLayer(UiManager.MainUiLayer.OVERLAY, 9513, "exDevEL toggle button")
local complexButton = luajava.new(ComplexButton, "", AssetManager:getLabelStyle(24), luajava.createProxy(RunnableInterface, {
    run = function()
        if exdevel.devmode then
            if exdevel.menuOverlay then
                exdevel.menuOverlay.show()
            else
                UiManager.dialog:showAlert("exDevEL Menu Overlay not implemented")
            end
        else
            if exdevel.modCfgs then
                exdevel.modCfgs.show()
            else
                UiManager.dialog:showAlert("exDevEL Mod Configurator not implemented")
            end
        end
    end
}))

local positions = exdevel.devmode and {0, 0, 8, 48, 64, 48, 56, 0} or {0, 0, 0, 48, 80, 48, 72, 0}
local size = exdevel.devmode and {x = 64, y = 48} or {x = 80, y = 48}
local icon_pos = exdevel.devmode and {x = 16, y = 8} or {x = 24, y = 8}
complexButton:setBackground(luajava.new(QuadDrawable, luajava.new(QuadActor, Color.GREEN, positions)), 0, 0, size.x, size.y)
complexButton:setIcon(AssetManager:getDrawable(exdevel.devmode and "exdevel-logo" or "icon-floppy"), icon_pos.x, icon_pos.y, 32, 32)
complexButton:setBackgroundColors(MaterialColor.LIGHT_GREEN.P800, MaterialColor.LIGHT_GREEN.P900, MaterialColor.LIGHT_GREEN.P700, Color.BLACK)
toggleButtonLayer:getTable():add(complexButton):top():left():size(size.x, size.y):padTop(132):padLeft(exdevel.devmode and 88 or 0):expand()
