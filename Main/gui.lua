local gui = Instance.new("ScreenGui")
gui.Name = "HearthvaleGUI"
gui.ResetOnSpawn = false
gui.Parent = (syn and syn.protect_gui and syn.protect_gui(game:GetService("CoreGui"))) or game:GetService("CoreGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌲 Hearthvale Cheats"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20

local function createToggle(name, loopVar)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, #frame:GetChildren() * 35)
    btn.Text = "⏺ " .. name
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16

    local active = true
    btn.MouseButton1Click:Connect(function()
        active = not active
        _G[loopVar] = active
        btn.Text = (active and "✅ " or "⏺ ") .. name
    end)
end

createToggle("Auto Fire", "fireLoop")
createToggle("Auto Carrot", "carrotLoop")
