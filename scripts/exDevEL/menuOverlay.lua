--[[
    - exDevEL Menu Overlay
]]

-- import from exdevel utils -----------------------------------

local log = exdevel.utils.log

-- managers ----------------------------------------------------

local UiManager = managers.UiManager

-- Preparation -------------------------------------------------

local moLayer = UiManager:addLayer(UiManager.MainUiLayer.OVERLAY, 9512, "exDevEL menu overlay")
local moTable = moLayer:getTable()
local columns = {}
 
-- Methods -----------------------------------------------------

exdevel.menuOverlay = {

    addCategory = function(id, name, color, buttons, optimize, modmode)
        --todo
    end,

    addButton = function(id, name, categoryId, runnable)
        --todo
    end,

    rebuild = function()
        --todo
    end,

    show = function()
        UiManager.dialog:showAlert("Nothing to show, sorry")
    end,

    hide = function()
        --todo
    end,

}