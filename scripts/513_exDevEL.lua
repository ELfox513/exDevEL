--[[
    - exDevEL loading script
]]
exdevel = { _noSyncCheck = true }
dofile("scripts/exDevEL/_header.lua")

-- loading modules --------------------------------------------

log("loading modules")
local modules = getFileHandler("scripts/exDevEL"):list()
for i = 1, #modules do
    if modules[i]:name():sub(1, 1) ~= "_" then
        dofile(modules[i]:toString())
    end
end

log("loaded")