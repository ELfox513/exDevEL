--[[
    - utils for exDevEL
]]

-- binds -------------------------------------------------------

if not bind then dofile("scripts/utils/binder.lua") end
--
ApplicationType = bind(GDXNS.."Application$ApplicationType", true)
Gdx = bind(GDXNS.."Gdx", true)
Logger = bind("Logger")

-- funcs -------------------------------------------------------

function elog(text)
    Logger:log("exDevEL", text)
end

function eerror(text)
    Logger:error("exDevEL", text)
end

if Gdx.app:getType() == ApplicationType.Android then
    getFileHandler = function(path) 
        return Gdx.files:external(path)
    end
else
    getFileHandler = function(path) 
        return Gdx.files:internal(path)
    end
end