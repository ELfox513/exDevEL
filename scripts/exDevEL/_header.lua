--[[
    - utils for exDevEL
]]

-- managers ----------------------------------------------------

AssetManager = managers.AssetManager
UiManager = managers.UiManager

-- binds -------------------------------------------------------

if not bind then dofile("scripts/utils/binder.lua") end
--
ApplicationType = bind(GDXNS.."Application$ApplicationType", true)
Color = bind(GDXNS.."graphics.Color", true)
ComplexButton = bind("ui.actors.ComplexButton")
Config = bind("Config")
Gdx = bind(GDXNS.."Gdx", true)
Logger = bind("Logger")
MaterialColor = bind("utils.MaterialColor")
QuadActor = bind("ui.actors.QuadActor")
QuadDrawable = bind("utils.QuadDrawable")

-- interfaces --------------------------------------------------

RunnableInterface = "java.lang.Runnable"

-- funcs -------------------------------------------------------

_G.elog = function(text)
    Logger:log("exDevEL", text)
end

_G.eerror = function(text)
    Logger:error("exDevEL", text)
end

_G.getFileHandler = function(path) 
    return Gdx.app:getType() == ApplicationType.Android and Gdx.files:external(path) or Gdx.files:internal(path)
end