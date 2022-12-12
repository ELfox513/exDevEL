--[[
    - utils for exDevEL
]]

JLNS = "java.lang." -- java lang namespace

-- binder ------------------------------------------------------

local bindCache = {_noSyncCheck = true}
exdevel.bind = function(className, nameSpace)
    local fullClass = (nameSpace or GNS)..className
    if not bindCache[fullClass] then
        bindCache[fullClass] = luajava.bindClass(fullClass)
    end
    return bindCache[fullClass]
end

-- utils -------------------------------------------------------

local bind = exdevel.bind

local ApplicationType = bind("Application$ApplicationType", GDXNS)
local Gdx = bind("Gdx", GDXNS)
local Logger = bind("Logger")

exdevel.utils = {
    log = function(text)
        Logger:log("exDevEL", text)
    end,

    error = function(text)
        Logger:error("exDevEL", text)
    end,

    getFileHandler = function(path) 
        return Gdx.app:getType() == ApplicationType.Android and Gdx.files:external(path) or Gdx.files:internal(path)
    end,

    printr = function(var, tabSize, visitedTables)
        log(_G.utils.printr(var, tabSize, visitedTables))
    end,
}