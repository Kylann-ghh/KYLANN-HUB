print("Mozil Hub chargé avec succès !")
-- Chargement de l'interface Mozil Hub style Redz
local MozilHub = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoFarmBtn = Instance.new("TextButton")
local ESPBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

MozilHub.Name = "MozilHub"
MozilHub.Parent = game.CoreGui
MozilHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = MozilHub
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Position = UDim2.new(0.3, 0, 0.25, 0)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Active = true
Main.Draggable = true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Mozil Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

AutoFarmBtn.Name = "AutoFarmBtn"
AutoFarmBtn.Parent = Main
AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoFarmBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
AutoFarmBtn.Size = UDim2.new(0, 300, 0, 40)
AutoFarmBtn.Font = Enum.Font.Gotham
AutoFarmBtn.Text = "Auto Farm"
AutoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmBtn.TextSize = 20
AutoFarmBtn.MouseButton1Click:Connect(function()
    print("Auto Farm activé !")
end)

ESPBtn.Name = "ESPBtn"
ESPBtn.Parent = Main
ESPBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESPBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
ESPBtn.Size = UDim2.new(0, 300, 0, 40)
ESPBtn.Font = Enum.Font.Gotham
ESPBtn.Text = "Activer ESP"
ESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPBtn.TextSize = 20
ESPBtn.MouseButton1Click:Connect(function()
    print("ESP activé !")
end)

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = Main
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Position = UDim2.new(0.88, 0, 0, 0)
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 20
CloseBtn.MouseButton1Click:Connect(function()
    MozilHub:Destroy()
end)
