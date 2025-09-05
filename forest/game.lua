-- 🌲 Hearthvale Forest Module
local rs = game:GetService("ReplicatedStorage").Events

-- Auto Fire
_G.fireLoop = true
task.spawn(function()
    while _G.fireLoop do
        rs.AddLog:FireServer()
        task.wait(0.1)
    end
end)

-- Auto Carrot
_G.carrotLoop = true
task.spawn(function()
    while _G.carrotLoop do
        rs.AddCarrot:FireServer()
        rs.EatCarrot:FireServer()
        task.wait(0.2)
    end
end)
