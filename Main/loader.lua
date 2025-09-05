-- Loader for Hearthvale GUI (99 Nights in the Forest)
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
repeat task.wait() until player and player:FindFirstChild("PlayerGui")

-- Load GUI module from GitHub
local guiURL = "https://raw.githubusercontent.com/Vuxlifydev/HearthVale---A-Roblox-Cheat/main/gui.lua"
local guiSource = HttpService:GetAsync(guiURL)
local guiModule = loadstring(guiSource)()

-- Load game-specific module
local forestURL = "https://raw.githubusercontent.com/Vuxlifydev/HearthVale---A-Roblox-Cheat/main/forest/game.lua"
local forestSource = HttpService:GetAsync(forestURL)
local forestModule = loadstring(forestSource)()

-- Create and show GUI
local gui = guiModule:Create() -- Assuming your gui.lua returns a Create() function
gui.Parent = player:WaitForChild("PlayerGui")
gui.Enabled = true

-- Optional: force visibility on main frame
if gui:FindFirstChild("MainFrame") then
    gui.MainFrame.Visible = true
end

-- Run forest logic
forestModule:Init(gui)
print("GUI loaded")
print("Forest module initialized")
