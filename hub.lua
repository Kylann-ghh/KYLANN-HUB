local gui = Instance.new("ScreenGui")
gui.Name = "MozilHub"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundTransparency = 1
label.Text = "Mozil Hub actif"
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.GothamBold
label.TextSize = 24
label.Parent = frame
local autofarm = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0, 100, 0, 80)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.Text = "Auto Farm: OFF"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.Gotham
button.TextSize = 16
button.Parent = frame

button.MouseButton1Click:Connect(function()
    autofarm = not autofarm
    button.Text = "Auto Farm: " .. (autofarm and "ON" or "OFF")
end)

task.spawn(function()
    while true do
        task.wait(1)
        if autofarm then
            pcall(function()
                local enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                end
            end)
        end
    end
end)
