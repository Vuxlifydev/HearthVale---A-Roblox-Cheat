local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "HearthvaleGUI"

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 350)
frame.Position = UDim2.new(0.5, -150, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Visible = false

-- Rounded corners
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌲 Hearthvale Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Toggle Button Template
local function createToggle(name, callback)
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = UDim2.new(0, 10, 0, #frame:GetChildren() * 35)
    button.Text = "⏺ " .. name
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16

    local active = false
    button.MouseButton1Click:Connect(function()
        active = not active
        button.Text = (active and "✅ " or "⏺ ") .. name
        callback(active)
    end)
end

-- Add toggles
createToggle("Auto Fire", function(state)
    if state then
        _G.fireLoop = true
        task.spawn(function()
            while _G.fireLoop do
                game:GetService("ReplicatedStorage").Events.AddLog:FireServer()
                task.wait(0.1)
            end
        end)
    else
        _G.fireLoop = false
    end
end)

createToggle("Auto Carrot", function(state)
    if state then
        _G.carrotLoop = true
        task.spawn(function()
            while _G.carrotLoop do
                local rs = game:GetService("ReplicatedStorage").Events
                rs.AddCarrot:FireServer()
                rs.EatCarrot:FireServer()
                task.wait(0.2)
            end
        end)
    else
        _G.carrotLoop = false
    end
end)

-- Animate GUI in
frame.Visible = true
TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -175)}):Play()
