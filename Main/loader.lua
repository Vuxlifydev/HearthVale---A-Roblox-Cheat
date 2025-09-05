local placeMap = {
    [79546208627805] = "forest",
    [90234872349823] = "arena"
}

local branch = placeMap[game.PlaceId] or "main"
local url = "https://raw.githubusercontent.com/Vuxlifydev/Hearthvale/" .. branch .. "/game.lua"
loadstring(game:HttpGet(url, true))()
local guiURL = "https://raw.githubusercontent.com/Vuxlifydev/Hearthvale/main/gui.lua"
loadstring(game:HttpGet(guiURL, true))()
