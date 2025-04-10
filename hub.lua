local gui = Instance.new("ScreenGui")
gui.Name = "MozilHub"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 300)
main.Position = UDim2.new(0.5, -250, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Parent = gui

-- MOZIL HUB v2 - Hoho Style + Thème One Piece

local MozilGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TabButtons = Instance.new("Frame")
local Pages = {}

MozilGui.Name = "MozilHub"
MozilGui.ResetOnSpawn = false

-- Support pour PC/Mobile
pcall(function()
    MozilGui.Parent = game:GetService("CoreGui")
end)
if not MozilGui.Parent then
    MozilGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

MozilGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
Main.Name = "Main
-- === PARTIE 2 : Auto Farm ===

-- Variables de contrôle
_G.AutoFarm = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Fonction pour attaquer l'ennemi
local function attackTarget(target)
    if not target or not target:FindFirstChild("HumanoidRootPart") then return end
    character:PivotTo(CFrame.new(target.HumanoidRootPart.Position + Vector3.new(0, 5, 0)))
    task.wait(0.2)
    if player.Backpack:FindFirstChildOfClass("Tool") then
        player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
    end
    if character:FindFirstChildOfClass("Tool") and target:FindFirstChild("Humanoid") then
        character:FindFirstChildOfClass("Tool"):Activate()
    end
    -- === PARTIE 3 : Prise de quête auto + liste de mobs ===

_G.AutoQuest = true
_G.SelectedMob = "Bandit" -- mob par défaut

-- Liste de mobs + leurs quêtes
local mobData = {
    ["Bandit"] = {
        questName = "BanditQuest1",
        questNPC = "BanditQuest",
        levelReq = 1,
        enemyName = "Bandit",
        position = Vector3.new(1060, 16, 1547)
    },
    ["Monkey"] = {
        questName = "JungleQuest",
        questNPC = "JungleQuest",
        levelReq = 10,
        enemyName = "Monkey",
        position = Vector3.new(-1613, 37, 146)
    },
    -- Ajoute ici d'autres mobs avec leurs infos...
}

-- Fonction pour prendre la quête automatiquement
local function takeQuest(mob)
    local info = mobData[mob]
    if not info then return end

    local npc = workspace:FindFirstChild(info.questNPC
            -- === PARTIE 4 : Téléportation (First Sea) ===

-- Liste d’îles pour la 1ère mer
local islands = {
    ["Start Island"] = Vector3.new(1050, 16, 1500),
    ["Jungle"] = Vector3.new(-1613, 37, 146),
    ["Pirate Village"] = Vector3.new(-1111, 13, 3938),
    ["Desert"] = Vector3.new(1143, 47, 4350),
    ["Marine Fortress"] = Vector3.new(-4500, 20, 4260),
    ["Sky Island"] = Vector3.new(-4919, 717, -2629),
    ["Colosseum"] = Vector3.new(-1421, 7, -3014)
    -- Tu pourras ajouter les îles des autres mers après
}
-- === PARTIE 5 : ESP - Haki de l'observation ===

local RunService = game:GetService("RunService")
local DrawingESP = {}
_G.ESPEnabled = false

-- Fonction pour dessiner un ESP sur un joueur
local function createESP(player)
    local box = Drawing.new("Text")
    box.Text = player.Name
    box.Size = 16
    box.Color = Color3.new(1, 0, 0)
    box.Center = true
    box.Outline = true
    box.Visible = false
    DrawingESP[player] = box
end

-- Supprimer ESP d’un joueur
local function removeESP(player)
    if DrawingESP[player] then
        DrawingESP[player]:Remove()
        DrawingESP[player] = nil
    end
end

-- Détecter les nouveaux joueurs
game.Players.PlayerAdded:Connect(function(p)
    createESP(p)
end)
game.Players.PlayerRemoving:Connect(function(p)
    removeESP(p)
end)

-- Initialiser ESP existants
for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= game.Players.LocalPlayer then
        createESP(plr)
    end
end

-- Mettre à jour les positions ESP
RunService.RenderStepped:Connect(function()
    if not _G.ESPEnabled then
        for _, esp in pairs(DrawingESP) do
            esp.Visible = false
        end
        return
    end

    for player, esp in pairs(DrawingESP) do
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local pos, visible = workspace.CurrentCamera:WorldToViewportPoint(char.HumanoidRootPart.Position)
            if visible then
                esp.Position = Vector2.new(pos.X, pos.Y)
                esp.Visible = true
            else
                esp.Visible = false
            end
        else
            esp.Visible = false
        end
    end
end)

-- Bouton d’activation de l’ESP
local espToggle = Instance.new("TextButton")
espToggle.Parent = espTab
espToggle.Size = UDim2.new(0, 200, 0, 40)
espToggle.Position = UDim2.new(0, 20, 0, 20)
espToggle.BackgroundColor3 = Color3.fromRGB(0, 40, 0)
espToggle.Text = "Activer ESP Joueurs"
espToggle.Font = Enum.Font.GothamBold
espToggle.TextColor3 = Color3.new(1, 1, 1)
espToggle.TextSize = 16

espToggle.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    espToggle.Text = _G.ESPEnabled and "Désactiver ESP Joueurs" or "Activer ESP Joueurs"
end)
-- === PARTIE 6 : Auto Stat Points ===

_G.AutoStatsEnabled = false
_G.SelectedStat = "Melee"
_G.StatAmount = 1

-- Fonction d’attribution automatique
task.spawn(function()
    while task.wait(1) do
        if _G.AutoStatsEnabled then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", _G.SelectedStat, _G.StatAmount)
            end)
        end
    end
end)

-- Dropdown pour le type de stats
local statBox = Instance.new("TextBox")
statBox.Parent = statsTab
statBox.Size = UDim2.new(0, 200, 0, 40)
statBox.Position = UDim2.new(0, 20, 0, 20)
statBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
statBox.Text = "Melee"
statBox.Font = Enum.Font.Gotham
statBox.TextColor3 = Color3.new(1, 1, 1)
statBox.TextSize = 16

statBox.FocusLost:Connect(function()
    local text = statBox.Text
    if text == "Melee" or text == "Defense" or text == "Sword" or text == "Gun" or text == "Blox Fruit" then
        _G.SelectedStat = text
    else
        statBox.Text = "Invalide"
        task.wait(1)
        statBox.Text = _G.SelectedStat
    end
end)

-- Boîte pour le nombre de points
local amountBox = Instance.new("TextBox")
amountBox.Parent = statsTab
amountBox.Size = UDim2.new(0, 200, 0, 40)
amountBox.Position = UDim2.new(0, 20, 0, 70)
amountBox.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
amountBox.Text = "1"
amountBox.Font = Enum.Font.Gotham
amountBox.TextColor3 = Color3.new(1, 1, 1)
amountBox.TextSize = 16

amountBox.FocusLost:Connect(function()
    local n = tonumber(amountBox.Text)
    if n then
        _G.StatAmount = n
    else
        amountBox.Text = tostring(_G.StatAmount)
    end
end)

-- Toggle Auto Stat
local autoStatBtn = Instance.new("TextButton")
autoStatBtn.Parent = statsTab
autoStatBtn.Size = UDim2.new(0, 200, 0, 40)
autoStatBtn.Position = UDim2.new(0, 20, 0, 120)
autoStatBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
autoStatBtn.Text = "Activer Auto Stats"
autoStatBtn.Font = Enum.Font.GothamBold
autoStatBtn.TextColor3 = Color3.new(1, 1, 1)
autoStatBtn.TextSize = 16

autoStatBtn.MouseButton1Click:Connect(function()
    _G.AutoStatsEnabled = not _G.AutoStatsEnabled
    autoStatBtn.Text = _G.AutoStatsEnabled and "Désactiver Auto Stats" or "Activer Auto Stats"
end)
 -- === PARTIE 7 : Auto Sea Event + Auto Préhistorique ===

_G.AutoSeaBeast = false
_G.AutoPrehistoric = false

-- Auto Sea Beast
task.spawn(function()
    while task.wait(1) do
        if _G.AutoSeaBeast then
            pcall(function()
                for _, v in pairs(workspace.SeaBeasts:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        character:PivotTo(CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0)))
                        if player.Backpack:FindFirstChildOfClass("Tool") then
                            player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
                        end
                        if character:FindFirstChildOfClass("Tool") then
                            character:FindFirstChildOfClass("Tool"):Activate()
                        end
                    end
                end
            end)
        end
    end
end)

-- Auto Préhistorique (Solo)
task.spawn(function()
    while task.wait(1) do
        if _G.AutoPrehistoric then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name:find("Dinosaur") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        character:PivotTo(CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0)))
                        if player.Backpack:FindFirstChildOfClass("Tool") then
                            player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChildOfClass("Tool"))
                        end
                        if character:FindFirstChildOfClass("Tool") then
                            character:FindFirstChildOfClass("Tool"):Activate()
                        end
                    end
                end
            end)
        end
    end
end)

-- Boutons UI
local seaToggle = Instance.new("TextButton")
seaToggle.Parent = autoFarmTab
seaToggle.Size = UDim2.new(0, 200, 0, 40)
seaToggle.Position = UDim2.new(0
-- === PARTIE 8 : Paramètres / Crédits / FPS Boost / Rejoin ===

-- Boost FPS
local function boostFPS()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") and v.Material ~= Enum.Material.SmoothPlastic then
            v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Decal") then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Enabled = false
        end
    end
    sethiddenproperty(game:GetService("Lighting"), "Technology", Enum.Technology.Compatibility)
end

-- FPS Boost Button
local boostButton = Instance.new("TextButton")
boostButton.Parent = settingsTab
boostButton.Size = UDim2.new(0, 200, 0, 40)
boostButton.Position = UDim2.new(0, 20, 0, 20)
boostButton.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
boostButton.Text = "Boost FPS"
boostButton.Font = Enum.Font.Goth
                
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenGui.Name = "MozilHubUI"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0

local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(0, 120, 1, 0)
tabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Position = UDim2.new(0, 120, 0, 0)
contentFrame.Size = UDim2.new(1, -120, 1, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                local tabs = {"Auto Farm", "Téléportation", "ESP", "Stats", "Mer", "Paramètres"}
local tabButtons = {}
local tabContents = {}

for i, tabName in ipairs(tabs) do
    -- Crée le bouton
    local button = Instance.new("TextButton", tabFrame)
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, (i - 1) * 45)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Text = tabName
    button.Font = Enum.Font.GothamBold
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    tabButtons[tabName] = button

    -- Crée le contenu du tab
    local content = Instance.new("Frame", contentFrame)
    content.Size = UDim2.new(1, 0, 1, 0)
    content.Visible = i == 1
    content.BackgroundTransparency = 1
    tabContents[tabName] = content

    button.MouseButton1Click:Connect(function()
        for _, c in pairs(tabContents) do c.Visible = false end
        content.Visible = true
    end)
                end
local farmTab = tabContents["Auto Farm"]

local function createButton(parent, text, callback, posY)
    local button = Instance.new("TextButton", parent)
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Position = UDim2.new(0, 20, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = text
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.MouseButton1Click:Connect(callback)
end

local autofarm = false

createButton(farmTab, "Activer Auto Farm", function()
    autofarm = not autofarm
end, 20)

spawn(function()
    while true do
        wait(1)
        if autofarm then
            pcall(function()
                local enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if enemy then
                    character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                end
            end)
        end
    end
end)
                
