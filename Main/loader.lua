-- 🌲 Hearthvale Loader | Developed by Vuxlifydev
local placeMap = {
    [79546208627805] = "forest" -- 99 Nights in the Forest
}

local branch = placeMap[game.PlaceId] or "main"

-- Load game-specific module
local gameURL = "https://raw.githubusercontent.com/Vuxlifydev/Hearthvale/" .. branch .. "/game.lua"
loadstring(game:HttpGet(gameURL, true))()

-- Load GUI
local guiURL = "https://raw.githubusercontent.com/Vuxlifydev/Hearthvale/main/gui.lua"
loadstring(game:HttpGet(guiURL, true))()
