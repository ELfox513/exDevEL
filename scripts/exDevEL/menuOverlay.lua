--[[
    - exDevEL Menu Overlay
]]

----[[ HEADER ]]------------------------------------------------

-- import from exdevel utils -----------------------------------

local log = exdevel.utils.log

-- managers ----------------------------------------------------

local UiManager = managers.UiManager


-- Preparation -------------------------------------------------

local menuOverlayLayer = UiManager:addLayer(UiManager.MainUiLayer.OVERLAY, 9512, "exDevEL menu overlay")
local columns = {}

----[[ MAIN ]]--------------------------------------------------

-- Methods -----------------------------------------------------

exdevel.menuOverlay = {
    show = function()
        UiManager.dialog:showAlert("Nothing to show, sorry")
    end,
}