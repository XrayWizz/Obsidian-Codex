-- Obsidian-Codex - Advanced Roblox Enhancement Suite
-- Deep Dark Metallic UI + Comprehensive Game Features

print("Script starting...")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Deep Dark Metallic Color Scheme - Industrial Theme
local Colors = {
    Primary = Color3.fromRGB(15, 15, 18),      -- Deep charcoal metallic
    Secondary = Color3.fromRGB(22, 22, 26),    -- Dark steel
    Accent = Color3.fromRGB(70, 130, 180),     -- Steel blue accent
    Text = Color3.fromRGB(180, 180, 185),      -- Muted light text
    TextDim = Color3.fromRGB(100, 100, 105),   -- Dark dimmed text
    Success = Color3.fromRGB(60, 180, 60),     -- Dark green
    Warning = Color3.fromRGB(200, 140, 60),    -- Dark orange
    Error = Color3.fromRGB(180, 60, 60),       -- Dark red
    Border = Color3.fromRGB(35, 35, 40),       -- Dark border
    Glow = Color3.fromRGB(80, 120, 160)        -- Subtle glow
}

-- Configuration
local Config = {
    WindowSize = UDim2.new(0, 520, 0, 320),
    SidebarWidth = 110,
    AnimationSpeed = 0.15,
    BorderRadius = 8,
    GlowIntensity = 0.3
}

-- Create Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ObsidianCodex"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Window with metallic design
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = Config.WindowSize
MainWindow.Position = UDim2.new(0.5, -260, 0.5, -160)
MainWindow.BackgroundColor3 = Colors.Primary
MainWindow.BorderSizePixel = 0
MainWindow.Parent = ScreenGui
MainWindow.ClipsDescendants = true

-- Deep metallic border with subtle glow
local MainBorder = Instance.new("UIStroke")
MainBorder.Thickness = 2
MainBorder.Color = Colors.Border
MainBorder.Transparency = 0.2
MainBorder.Parent = MainWindow

-- Inner metallic glow effect
local InnerGlow = Instance.new("UIStroke")
InnerGlow.Thickness = 1
InnerGlow.Color = Colors.Glow
InnerGlow.Transparency = 0.85
InnerGlow.Parent = MainWindow

-- Rounded corners
local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, Config.BorderRadius)
WindowCorner.Parent = MainWindow

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 24)
TitleBar.BackgroundColor3 = Colors.Secondary
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainWindow

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, Config.BorderRadius)
TitleCorner.Parent = TitleBar

-- Title text with modern font
local TitleText = Instance.new("TextLabel")
TitleText.Name = "Title"
TitleText.Size = UDim2.new(1, -70, 1, 0)
TitleText.Position = UDim2.new(0, 8, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 12
TitleText.TextColor3 = Colors.Text
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Text = "Obsidian-Codex v1.0"
TitleText.Parent = TitleBar

-- Window controls
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 22, 0, 20)
CloseButton.Position = UDim2.new(1, -26, 0, 2)
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 10
CloseButton.TextColor3 = Colors.Text
CloseButton.Text = "×"
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

-- Minimize button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 22, 0, 20)
MinimizeButton.Position = UDim2.new(1, -50, 0, 2)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 10
MinimizeButton.TextColor3 = Colors.Text
MinimizeButton.Text = "−"
MinimizeButton.Parent = TitleBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 4)
MinimizeCorner.Parent = MinimizeButton

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, Config.SidebarWidth, 1, -28)
Sidebar.Position = UDim2.new(0, 4, 0, 28)
Sidebar.BackgroundColor3 = Colors.Secondary
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainWindow

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, Config.BorderRadius - 2)
SidebarCorner.Parent = Sidebar

local SidebarBorder = Instance.new("UIStroke")
SidebarBorder.Thickness = 1
SidebarBorder.Color = Colors.Border
SidebarBorder.Transparency = 0.7
SidebarBorder.Parent = Sidebar

-- Sidebar scrolling
local SidebarScroller = Instance.new("ScrollingFrame")
SidebarScroller.Name = "SidebarScroller"
SidebarScroller.Size = UDim2.new(1, -8, 1, -8)
SidebarScroller.Position = UDim2.new(0, 4, 0, 4)
SidebarScroller.BackgroundTransparency = 1
SidebarScroller.BorderSizePixel = 0
SidebarScroller.ScrollBarThickness = 3
SidebarScroller.ScrollBarImageColor3 = Colors.Accent
SidebarScroller.CanvasSize = UDim2.new(0, 0, 0, 0)
SidebarScroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
SidebarScroller.Parent = Sidebar

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.FillDirection = Enum.FillDirection.Vertical
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 3)
SidebarLayout.Parent = SidebarScroller

-- Main content area
local MainContent = Instance.new("Frame")
MainContent.Name = "MainContent"
MainContent.Size = UDim2.new(1, -Config.SidebarWidth - 8, 1, -32)
MainContent.Position = UDim2.new(0, Config.SidebarWidth + 4, 0, 28)
MainContent.BackgroundColor3 = Colors.Primary
MainContent.BorderSizePixel = 0
MainContent.Parent = MainWindow

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, Config.BorderRadius - 2)
ContentCorner.Parent = MainContent

local ContentBorder = Instance.new("UIStroke")
ContentBorder.Thickness = 1
ContentBorder.Color = Colors.Border
ContentBorder.Transparency = 0.7
ContentBorder.Parent = MainContent

-- Content scrolling
local ContentScroller = Instance.new("ScrollingFrame")
ContentScroller.Name = "ContentScroller"
ContentScroller.Size = UDim2.new(1, -8, 1, -8)
ContentScroller.Position = UDim2.new(0, 4, 0, 4)
ContentScroller.BackgroundTransparency = 1
ContentScroller.BorderSizePixel = 0
ContentScroller.ScrollBarThickness = 3
ContentScroller.ScrollBarImageColor3 = Colors.Accent
ContentScroller.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentScroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentScroller.ScrollingDirection = Enum.ScrollingDirection.Y
ContentScroller.Parent = MainContent

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Name = "ContentLayout"
ContentLayout.FillDirection = Enum.FillDirection.Vertical
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 4)
ContentLayout.Parent = ContentScroller

-- Global Variables for Features
local autoFarm = false
local autoQuest = false
local autoEquip = false
local autoFactory = false
local autoLaw = false
local autoElite = false
local autoMaterials = false
local autoSeaEvent = false
local autoRaid = false
local autoSeaBeast = false
local autoDungeon = false
local autoBlock = false
local autoDodge = false
local autoParry = false
local autoRejoin = false
local autoClaim = false
local speedEnabled = false
local jumpEnabled = false
local noclipEnabled = false
local espEnabled = false
local nameTagsEnabled = false
local tracersEnabled = false
local chamsEnabled = false
local trackingEnabled = false
local antiAFKEnabled = false
local autoBuyItems = false
local autoBuyFruits = false
local autoBuySwords = false
local darkModeEnabled = false
local glowEffectsEnabled = false
local rainbowModeEnabled = false

-- ESP and Visual variables
local espConnections = {}
local nameTagConnections = {}
local tracerConnections = {}
local chamConnections = {}
local antiAFKConnection = nil

-- AI Player System Variables
local aiEnabled = false
local aiMode = "Farming" -- Farming, Questing, Exploring, Combat
local aiTarget = nil
local aiPathfinding = nil
local aiConnection = nil
local aiState = "Idle" -- Idle, Moving, Fighting, Collecting, Questing
local aiTargets = {}
local aiBlacklist = {}
local aiStats = {
    enemiesKilled = 0,
    questsCompleted = 0,
    itemsCollected = 0,
    distanceTraveled = 0
}

-- Human-like AI Behavior Variables
local aiPersonality = {
    reactionTime = math.random(200, 800), -- ms delay before actions
    movementStyle = "Normal", -- Normal, Cautious, Aggressive
    decisionDelay = math.random(1, 3), -- seconds between decisions
    lastActionTime = 0,
    lastMoveTime = 0,
    randomPauseChance = 0.1, -- 10% chance to pause randomly
    lookAroundChance = 0.05, -- 5% chance to look around
    combatStyle = "Balanced" -- Balanced, Aggressive, Defensive
}

-- Player enhancement variables
local originalWalkSpeed = 16
local originalJumpPower = 50
local currentSpeed = 1.0
local noclipConnection = nil
local selectedPlayer = nil

-- Utility Functions
local function createButton(text, icon, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 28)
    button.BackgroundColor3 = Colors.Secondary
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 12
    button.TextColor3 = Colors.TextDim
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Text = "  " .. (icon and icon .. " " or "") .. text
    button.Parent = SidebarScroller
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    local buttonBorder = Instance.new("UIStroke")
    buttonBorder.Thickness = 1
    buttonBorder.Color = Colors.Border
    buttonBorder.Transparency = 0.9
    buttonBorder.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Accent,
            TextColor3 = Colors.Primary
        }):Play()
        TweenService:Create(buttonBorder, TweenInfo.new(Config.AnimationSpeed), {
            Transparency = 0.3
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Secondary,
            TextColor3 = Colors.TextDim
        }):Play()
        TweenService:Create(buttonBorder, TweenInfo.new(Config.AnimationSpeed), {
            Transparency = 0.8
        }):Play()
    end)
    
    if callback then
        button.MouseButton1Click:Connect(callback)
    end
    
    print("createButton returning button:", button ~= nil, "for text:", text)
    return button
end

local function createToggle(name, icon, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -8, 0, 32)
    toggleFrame.BackgroundColor3 = Colors.Secondary
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = ContentScroller
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggleFrame
    
    local toggleBorder = Instance.new("UIStroke")
    toggleBorder.Thickness = 1
    toggleBorder.Color = Colors.Border
    toggleBorder.Transparency = 0.8
    toggleBorder.Parent = toggleFrame
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(1, -50, 1, 0)
    toggleLabel.Position = UDim2.new(0, 8, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Font = Enum.Font.GothamSemibold
    toggleLabel.TextSize = 12
    toggleLabel.TextColor3 = Colors.Text
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Text = (icon and icon .. " " or "") .. name
    toggleLabel.Parent = toggleFrame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 40, 0, 20)
    toggleButton.Position = UDim2.new(1, -48, 0, 6)
    toggleButton.BackgroundColor3 = Colors.Error
    toggleButton.BorderSizePixel = 0
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 10
    toggleButton.TextColor3 = Colors.Text
    toggleButton.Text = "OFF"
    toggleButton.Parent = toggleFrame
    
    local toggleBtnCorner = Instance.new("UICorner")
    toggleBtnCorner.CornerRadius = UDim.new(0, 3)
    toggleBtnCorner.Parent = toggleButton
    
    local isEnabled = false
    
    toggleButton.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        toggleButton.BackgroundColor3 = isEnabled and Colors.Success or Colors.Error
        toggleButton.Text = isEnabled and "ON" or "OFF"
        
        if callback then
            callback(isEnabled)
        end
    end)
    
    return toggleFrame, toggleButton
end

local function createActionButton(name, icon, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -8, 0, 28)
    button.BackgroundColor3 = Colors.Secondary
    button.BorderSizePixel = 0
    button.AutoButtonColor = false
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 12
    button.TextColor3 = Colors.Text
    button.Text = (icon and icon .. " " or "") .. name
    button.Parent = ContentScroller
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    local buttonBorder = Instance.new("UIStroke")
    buttonBorder.Thickness = 1
    buttonBorder.Color = Colors.Border
    buttonBorder.Transparency = 0.8
    buttonBorder.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Accent,
            TextColor3 = Colors.Primary
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Secondary,
            TextColor3 = Colors.Text
        }):Play()
    end)
    
    if callback then
        button.MouseButton1Click:Connect(callback)
    end
    
    return button
end

local function createSection(title)
    print("Creating section:", title)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1, -8, 0, 24)
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Parent = ContentScroller
    print("Section parented, children count:", #ContentScroller:GetChildren())
    
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.TextSize = 14
    sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Bright white text
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Text = title
    sectionLabel.Parent = sectionFrame
    print("Section label created and parented")
    
    return sectionFrame
end

-- Clear content function
local function clearContent()
    for _, child in ipairs(ContentScroller:GetChildren()) do
        if child:IsA("GuiObject") and child.Name ~= "ContentLayout" then
            child:Destroy()
        end
    end
end

-- Active button tracking
local activeButton = nil
local function setActiveButton(button)
    print("setActiveButton called with button:", button ~= nil)
    
    if activeButton then
        TweenService:Create(activeButton, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Secondary,
            TextColor3 = Colors.TextDim
        }):Play()
    end
    
    if button then
        activeButton = button
        TweenService:Create(button, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Accent,
            TextColor3 = Colors.Primary
        }):Play()
        print("Button tweened successfully")
    else
        print("ERROR: Button is null in setActiveButton!")
    end
end

-- Notification system
local function notify(message, type)
    type = type or "info"
    local color = type == "success" and Colors.Success or 
                  type == "warning" and Colors.Warning or 
                  type == "error" and Colors.Error or Colors.Accent
    
    print("[" .. type:upper() .. "] " .. message)
end

-- Teleport function
local function teleportTo(position)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- Touch interest function
local function firetouchinterest(part1, part2, toggle)
    if part1 and part2 then
        local touch = Instance.new("TouchTransmitter")
        touch.Parent = part1
        part1.CFrame = part2.CFrame
        touch:Destroy()
    end
end

-- Player Enhancement Functions
local function updateSpeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if speedEnabled then
            LocalPlayer.Character.Humanoid.WalkSpeed = originalWalkSpeed * currentSpeed
        else
            LocalPlayer.Character.Humanoid.WalkSpeed = originalWalkSpeed
        end
    end
end

local function updateJump()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if jumpEnabled then
            LocalPlayer.Character.Humanoid.JumpPower = originalJumpPower * 3
        else
            LocalPlayer.Character.Humanoid.JumpPower = originalJumpPower
        end
    end
end

local function enableNoclip()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = false
            end
        end
    end
end

local function disableNoclip()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end

-- Enhanced Speed Control
local function setSpeed(multiplier)
    currentSpeed = multiplier
    if speedEnabled then
        updateSpeed()
    end
end

-- Enhanced Noclip with continuous monitoring
local function startNoclip()
    noclipEnabled = true
    enableNoclip()
    
    -- Continuous noclip monitoring
    noclipConnection = RunService.Heartbeat:Connect(function()
        if noclipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function stopNoclip()
    noclipEnabled = false
    disableNoclip()
    
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
end

-- Farming Functions
local function startAutoFarm()
    autoFarm = true
    notify("Auto Farm: ON", "success")
    spawn(function()
        while autoFarm do
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    teleportTo(v.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                    for i = 1, 5 do
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", v.Name)
                        wait(0.2)
                    end
                end
            end
            wait(1)
        end
    end)
end

local function stopAutoFarm()
    autoFarm = false
    notify("Auto Farm: OFF", "info")
end

local function startAutoFactory()
    autoFactory = true
    notify("Auto Factory: ON", "success")
    spawn(function()
        while autoFactory do
            local factory = Workspace:FindFirstChild("Factory")
            if factory and factory:FindFirstChild("Door") then
                teleportTo(factory.Door.Position + Vector3.new(0, 10, 0))
                for i = 1, 10 do
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", "Factory")
                    wait(0.2)
                end
            end
            wait(10)
        end
    end)
end

local function stopAutoFactory()
    autoFactory = false
    notify("Auto Factory: OFF", "info")
end

local function startAutoElite()
    autoElite = true
    notify("Auto Elite Hunter: ON", "success")
    spawn(function()
        while autoElite do
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v.Name:find("Elite") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    teleportTo(v.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                    for i = 1, 10 do
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", v.Name)
                        wait(0.2)
                    end
                end
            end
            wait(10)
        end
    end)
end

local function stopAutoElite()
    autoElite = false
    notify("Auto Elite Hunter: OFF", "info")
end

local function startAutoRaid()
    autoRaid = true
    notify("Auto Raid: ON", "success")
    spawn(function()
        while autoRaid do
            local raidBosses = {"Diamond", "Jeremy", "Fajita", "Don Swan", "Cursed Captain", "Order", "Awakened Ice Admiral"}
            for _, bossName in pairs(raidBosses) do
                local boss = Workspace:FindFirstChild(bossName)
                if boss and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    teleportTo(boss.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
                    for i = 1, 15 do
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", bossName)
                        wait(0.1)
                    end
                end
            end
            wait(5)
        end
    end)
end

local function stopAutoRaid()
    autoRaid = false
    notify("Auto Raid: OFF", "info")
end

local function startAutoMaterials()
    autoMaterials = true
    notify("Auto Materials: ON", "success")
    spawn(function()
        while autoMaterials do
            for _, v in pairs(Workspace:GetDescendants()) do
                if v.Name:find("Material") and v:IsA("Tool") and v:FindFirstChild("Handle") then
                    teleportTo(v.Handle.Position)
                    wait(0.5)
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                    wait(0.2)
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
                end
            end
            wait(5)
        end
    end)
end

local function stopAutoMaterials()
    autoMaterials = false
    notify("Auto Materials: OFF", "info")
end

-- Combat Functions
local function startAutoBlock()
    autoBlock = true
    notify("Auto Block: ON", "success")
    spawn(function()
        while autoBlock do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Block")
            end
            wait(0.1)
        end
    end)
end

local function stopAutoBlock()
    autoBlock = false
    notify("Auto Block: OFF", "info")
end

local function startAutoDodge()
    autoDodge = true
    notify("Auto Dodge: ON", "success")
    spawn(function()
        while autoDodge do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Dodge")
            end
            wait(0.5)
        end
    end)
end

local function stopAutoDodge()
    autoDodge = false
    notify("Auto Dodge: OFF", "info")
end

-- Quest Functions
local function startAutoQuest()
    autoQuest = true
    notify("Auto Quest: ON", "success")
    spawn(function()
        while autoQuest do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                -- Auto quest logic here
                local quests = {"Bandit Quest", "Marine Quest", "Pirate Quest"}
                for _, quest in pairs(quests) do
                    -- Quest completion logic
                    wait(1)
                end
            end
            wait(5)
        end
    end)
end

local function stopAutoQuest()
    autoQuest = false
    notify("Auto Quest: OFF", "info")
end

-- ESP Functions
local function createESP(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local character = player.Character
    local humanoidRootPart = character.HumanoidRootPart
    
    -- Create ESP Box
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Name = "ESPBox"
    espBox.Adornee = humanoidRootPart
    espBox.AlwaysOnTop = true
    espBox.ZIndex = 10
    espBox.Size = Vector3.new(4, 6, 0)
    espBox.Color3 = Colors.Accent
    espBox.Transparency = 0.5
    espBox.Parent = humanoidRootPart
    
    -- Create Name Tag
    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "NameTag"
    nameTag.Size = UDim2.new(0, 200, 0, 50)
    nameTag.StudsOffset = Vector3.new(0, 3, 0)
    nameTag.Parent = humanoidRootPart
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Colors.Text
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Colors.Primary
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.Parent = nameTag
    
    espConnections[player] = {espBox, nameTag}
end

local function removeESP(player)
    if espConnections[player] then
        for _, obj in pairs(espConnections[player]) do
            if obj then obj:Destroy() end
        end
        espConnections[player] = nil
    end
end

local function startESP()
    espEnabled = true
    notify("ESP: ON", "success")
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end
    
    Players.PlayerAdded:Connect(function(player)
        if espEnabled then
            player.CharacterAdded:Connect(function()
                createESP(player)
            end)
        end
    end)
end

local function stopESP()
    espEnabled = false
    notify("ESP: OFF", "info")
    
    for player, _ in pairs(espConnections) do
        removeESP(player)
    end
end

-- Anti-AFK Function
local function startAntiAFK()
    antiAFKEnabled = true
    notify("Anti-AFK: ON", "success")
    
    antiAFKConnection = RunService.Heartbeat:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
end

local function stopAntiAFK()
    antiAFKEnabled = false
    notify("Anti-AFK: OFF", "info")
    
    if antiAFKConnection then
        antiAFKConnection:Disconnect()
        antiAFKConnection = nil
    end
end

-- Shop Functions
local function startAutoBuyItems()
    autoBuyItems = true
    notify("Auto Buy Items: ON", "success")
    spawn(function()
        while autoBuyItems do
            -- Auto buy logic here
            wait(10)
        end
    end)
end

local function stopAutoBuyItems()
    autoBuyItems = false
    notify("Auto Buy Items: OFF", "info")
end

local function startAutoBuyFruits()
    autoBuyFruits = true
    notify("Auto Buy Fruits: ON", "success")
    spawn(function()
        while autoBuyFruits do
            -- Auto buy fruits logic here
            wait(15)
        end
    end)
end

local function stopAutoBuyFruits()
    autoBuyFruits = false
    notify("Auto Buy Fruits: OFF", "info")
end

local function startAutoBuySwords()
    autoBuySwords = true
    notify("Auto Buy Swords: ON", "success")
    spawn(function()
        while autoBuySwords do
            -- Auto buy swords logic here
            wait(20)
        end
    end)
end

local function stopAutoBuySwords()
    autoBuySwords = false
    notify("Auto Buy Swords: OFF", "info")
end

-- Server Hop Function
local function serverHop()
    notify("Server hopping...", "info")
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    
    local servers = {}
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if success and result and result.data then
        for _, server in pairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(servers, server.id)
            end
        end
        
        if #servers > 0 then
            local randomServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServer)
        else
            notify("No available servers found", "error")
        end
    else
        notify("Failed to get server list", "error")
    end
end

-- AI Player System Functions
local function findNearestEnemy()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    
    local humanoidRootPart = character.HumanoidRootPart
    local nearestEnemy = nil
    local nearestDistance = math.huge
    
    -- Search for enemies in workspace
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") and obj.Humanoid.Health > 0 then
            if obj.Name:find("Bandit") or obj.Name:find("Marine") or obj.Name:find("Pirate") or obj.Name:find("Enemy") then
                local distance = (humanoidRootPart.Position - obj.HumanoidRootPart.Position).Magnitude
                if distance < nearestDistance and distance < 200 then
                    nearestEnemy = obj
                    nearestDistance = distance
                end
            end
        end
    end
    
    return nearestEnemy
end

local function findNearestItem()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    
    local humanoidRootPart = character.HumanoidRootPart
    local nearestItem = nil
    local nearestDistance = math.huge
    
    -- Search for collectible items
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            if obj.Name:find("Material") or obj.Name:find("Coin") or obj.Name:find("Gem") then
                local distance = (humanoidRootPart.Position - obj.Handle.Position).Magnitude
                if distance < nearestDistance and distance < 100 then
                    nearestItem = obj
                    nearestDistance = distance
                end
            end
        end
    end
    
    return nearestItem
end

local function aiMoveTo(position)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("Humanoid") then return false end
    
    local humanoid = character.Humanoid
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart then
        local distance = (humanoidRootPart.Position - position).Magnitude
        if distance > 5 then
            humanoid:MoveTo(position)
            aiState = "Moving"
            return true
        end
    end
    
    return false
end

local function aiAttack(target)
    if not target or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0 then return false end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    
    -- Move close to target
    local targetPosition = target.HumanoidRootPart.Position
    local distance = (character.HumanoidRootPart.Position - targetPosition).Magnitude
    
    if distance > 10 then
        aiMoveTo(targetPosition)
        return false
    end
    
    -- Attack the target
    if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", target.Name)
        aiState = "Fighting"
        return true
    end
    
    return false
end

local function aiCollectItem(item)
    if not item or not item:FindFirstChild("Handle") then return false end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    
    local distance = (character.HumanoidRootPart.Position - item.Handle.Position).Magnitude
    
    if distance > 5 then
        aiMoveTo(item.Handle.Position)
        return false
    end
    
    -- Collect the item
    firetouchinterest(character.HumanoidRootPart, item.Handle, 0)
    wait(0.1)
    firetouchinterest(character.HumanoidRootPart, item.Handle, 1)
    
    aiStats.itemsCollected = aiStats.itemsCollected + 1
    aiState = "Collecting"
    return true
end

local function aiThink()
    if not aiEnabled or not LocalPlayer.Character then return end
    
    local character = LocalPlayer.Character
    if not character:FindFirstChild("Humanoid") or not character:FindFirstChild("HumanoidRootPart") then return end
    
    if aiMode == "Farming" then
        -- AI Farming Logic
        local nearestEnemy = findNearestEnemy()
        if nearestEnemy then
            if aiAttack(nearestEnemy) then
                aiStats.enemiesKilled = aiStats.enemiesKilled + 1
            end
        else
            -- Look for items to collect
            local nearestItem = findNearestItem()
            if nearestItem then
                aiCollectItem(nearestItem)
            else
                -- Explore randomly
                local randomPosition = character.HumanoidRootPart.Position + Vector3.new(
                    math.random(-50, 50),
                    0,
                    math.random(-50, 50)
                )
                aiMoveTo(randomPosition)
                aiState = "Exploring"
            end
        end
        
    elseif aiMode == "Questing" then
        -- AI Quest Logic
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            -- Start a quest if none active
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Bandit Quest")
            aiState = "Questing"
        end
        
    elseif aiMode == "Exploring" then
        -- AI Exploration Logic
        local randomPosition = character.HumanoidRootPart.Position + Vector3.new(
            math.random(-100, 100),
            0,
            math.random(-100, 100)
        )
        aiMoveTo(randomPosition)
        aiState = "Exploring"
    end
end

local function startAI()
    aiEnabled = true
    notify("AI Player: ON - " .. aiMode .. " Mode (Human-like)", "success")
    
    aiConnection = RunService.Heartbeat:Connect(function()
        aiThink()
    end)
end

local function stopAI()
    aiEnabled = false
    aiState = "Idle"
    notify("AI Player: OFF", "info")
    
    if aiConnection then
        aiConnection:Disconnect()
        aiConnection = nil
    end
end

local function setAIMode(mode)
    aiMode = mode
    notify("AI Mode changed to: " .. mode, "info")
    
    if aiEnabled then
        notify("AI Player: " .. mode .. " Mode Active", "success")
    end
end

-- Human-like AI Behavior Functions
local function humanDelay(min, max)
    local delay = math.random(min or 100, max or 500) / 1000
    wait(delay)
end

local function shouldPause()
    return math.random() < aiPersonality.randomPauseChance
end

local function shouldLookAround()
    return math.random() < aiPersonality.lookAroundChance
end

local function humanMoveTo(position)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("Humanoid") then return false end
    
    local humanoid = character.Humanoid
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart then
        local distance = (humanoidRootPart.Position - position).Magnitude
        if distance > 5 then
            -- Add human-like movement variations
            local offset = Vector3.new(
                math.random(-2, 2),
                0,
                math.random(-2, 2)
            )
            local targetPosition = position + offset
            
            -- Random pause before moving
            if shouldPause() then
                humanDelay(500, 1500)
            end
            
            humanoid:MoveTo(targetPosition)
            aiState = "Moving"
            
            -- Random look around while moving
            if shouldLookAround() then
                spawn(function()
                    humanDelay(1000, 2000)
                    -- Simulate looking around by slight position adjustment
                    local lookOffset = Vector3.new(
                        math.random(-5, 5),
                        0,
                        math.random(-5, 5)
                    )
                    humanoid:MoveTo(humanoidRootPart.Position + lookOffset)
                    wait(0.5)
                    humanoid:MoveTo(targetPosition)
                end)
            end
            
            return true
        end
    end
    
    return false
end

local function humanAttack(target)
    if not target or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0 then return false end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    
    -- Human-like reaction time
    humanDelay(aiPersonality.reactionTime, aiPersonality.reactionTime + 200)
    
    -- Move close to target with human-like pathfinding
    local targetPosition = target.HumanoidRootPart.Position
    local distance = (character.HumanoidRootPart.Position - targetPosition).Magnitude
    
    if distance > 15 then
        humanMoveTo(targetPosition)
        return false
    end
    
    -- Human-like combat behavior
    if aiPersonality.combatStyle == "Aggressive" then
        -- Attack immediately
        for i = 1, math.random(3, 6) do
            if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", target.Name)
                humanDelay(100, 300)
            end
        end
    elseif aiPersonality.combatStyle == "Defensive" then
        -- More cautious approach
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", target.Name)
            humanDelay(500, 1000)
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", target.Name)
        end
    else -- Balanced
        -- Normal human-like combat
        for i = 1, math.random(2, 4) do
            if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", target.Name)
                humanDelay(200, 500)
            end
        end
    end
    
    aiState = "Fighting"
    return true
end

local function humanCollectItem(item)
    if not item or not item:FindFirstChild("Handle") then return false end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return false end
    
    local distance = (character.HumanoidRootPart.Position - item.Handle.Position).Magnitude
    
    if distance > 8 then
        humanMoveTo(item.Handle.Position)
        return false
    end
    
    -- Human-like item collection with slight hesitation
    humanDelay(200, 600)
    
    -- Collect the item
    firetouchinterest(character.HumanoidRootPart, item.Handle, 0)
    wait(0.1)
    firetouchinterest(character.HumanoidRootPart, item.Handle, 1)
    
    aiStats.itemsCollected = aiStats.itemsCollected + 1
    aiState = "Collecting"
    
    -- Random pause after collecting
    if shouldPause() then
        humanDelay(1000, 2000)
    end
    
    return true
end

local function humanThink()
    if not aiEnabled or not LocalPlayer.Character then return end
    
    local character = LocalPlayer.Character
    if not character:FindFirstChild("Humanoid") or not character:FindFirstChild("HumanoidRootPart") then return end
    
    -- Human-like decision timing
    local currentTime = tick()
    if currentTime - aiPersonality.lastActionTime < aiPersonality.decisionDelay then
        return
    end
    
    aiPersonality.lastActionTime = currentTime
    
    -- Random human-like behaviors
    if shouldPause() then
        aiState = "Idle"
        humanDelay(2000, 5000)
        return
    end
    
    if aiMode == "Farming" then
        -- Human-like farming behavior
        local nearestEnemy = findNearestEnemy()
        if nearestEnemy then
            if humanAttack(nearestEnemy) then
                aiStats.enemiesKilled = aiStats.enemiesKilled + 1
            end
        else
            -- Look for items to collect
            local nearestItem = findNearestItem()
            if nearestItem then
                humanCollectItem(nearestItem)
            else
                -- Human-like exploration with random wandering
                local randomPosition = character.HumanoidRootPart.Position + Vector3.new(
                    math.random(-80, 80),
                    0,
                    math.random(-80, 80)
                )
                humanMoveTo(randomPosition)
                aiState = "Exploring"
            end
        end
        
    elseif aiMode == "Questing" then
        -- Human-like quest behavior
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            humanDelay(1000, 3000) -- Think before starting quest
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Bandit Quest")
            aiState = "Questing"
        end
        
    elseif aiMode == "Exploring" then
        -- Human-like exploration with more natural movement
        local randomPosition = character.HumanoidRootPart.Position + Vector3.new(
            math.random(-120, 120),
            0,
            math.random(-120, 120)
        )
        humanMoveTo(randomPosition)
        aiState = "Exploring"
    end
end

-- Tab Content Functions
local function showHomepage()
    print("showHomepage called")
    clearContent()
    print("Content cleared, children count:", #ContentScroller:GetChildren())
    setActiveButton(HomepageButton)
    print("Active button set")
    
    createSection("🏠 Welcome to Obsidian-Codex v1.0")
    print("Section created, children count:", #ContentScroller:GetChildren())
    
    print("About to create test frame...")
    
    -- Test: Add a visible background first
    local testFrame = Instance.new("Frame")
    testFrame.Size = UDim2.new(1, -8, 0, 100)
    testFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark gray background
    testFrame.BorderSizePixel = 0
    testFrame.Parent = ContentScroller
    
    local testCorner = Instance.new("UICorner")
    testCorner.CornerRadius = UDim.new(0, 4)
    testCorner.Parent = testFrame
    
    local welcomeText = Instance.new("TextLabel")
    welcomeText.Size = UDim2.new(1, -16, 1, -16)
    welcomeText.Position = UDim2.new(0, 8, 0, 8)
    welcomeText.BackgroundTransparency = 1
    welcomeText.Font = Enum.Font.Gotham
    welcomeText.TextSize = 12
    welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Bright white text
    welcomeText.TextXAlignment = Enum.TextXAlignment.Left
    welcomeText.TextYAlignment = Enum.TextYAlignment.Top
    welcomeText.TextWrapped = true
    welcomeText.Text = "Advanced Roblox enhancement suite with comprehensive features:\n\n• Advanced Player Tracking & ESP\n• Auto Farming (All Seas)\n• Combat Enhancements\n• Quest Automation\n• Teleportation Tools\n• Visual Effects\n• Shop Utilities\n• Anti-AFK & Auto Rejoin"
    welcomeText.Parent = testFrame
    
    print("Welcome text created and parented")
    
    createSection("📊 Quick Stats")
    
    createActionButton("Check Player Level", "📈", function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local level = LocalPlayer.Character.Humanoid.Health
            notify("Player Level: " .. tostring(level), "info")
        end
    end)
    
    createActionButton("Check Current Sea", "🌊", function()
        local sea = "First Sea" -- Default
        if Workspace:FindFirstChild("Second Sea") then
            sea = "Second Sea"
        elseif Workspace:FindFirstChild("Third Sea") then
            sea = "Third Sea"
        end
        notify("Current Sea: " .. sea, "info")
    end)
    
    createActionButton("Check Server Players", "👥", function()
        local playerCount = #Players:GetPlayers()
        notify("Server Players: " .. tostring(playerCount), "info")
    end)
    
    createSection("📝 Changelog")
    
    local changelogText = Instance.new("TextLabel")
    changelogText.Size = UDim2.new(1, -8, 0, 120)
    changelogText.BackgroundTransparency = 1
    changelogText.Font = Enum.Font.Gotham
    changelogText.TextSize = 10
    changelogText.TextColor3 = Colors.TextDim
    changelogText.TextXAlignment = Enum.TextXAlignment.Left
    changelogText.TextYAlignment = Enum.TextYAlignment.Top
    changelogText.TextWrapped = true
    changelogText.Text = "v1.0 - Initial Release\n• Deep dark metallic theme\n• Complete ESP system with player tracking\n• Auto farming for all enemy types\n• Quest automation system\n• Advanced teleportation tools\n• Shop utilities with auto-buy features\n• Anti-AFK and server management\n• Comprehensive visual effects\n• Streamlined UI with neon accents\n• AI Player System - Bot plays the game for you!"
    changelogText.Parent = ContentScroller
end

local function showPlayers()
    clearContent()
    setActiveButton(PlayersButton)
    
    createSection("👤 Player Enhancements")
    
    createToggle("Player Speed", "💨", function(enabled)
        speedEnabled = enabled
        updateSpeed()
        notify("Player Speed: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createActionButton("Speed x2", "⚡", function()
        setSpeed(2)
        notify("Speed set to 2x", "success")
    end)
    
    createActionButton("Speed x5", "🚀", function()
        setSpeed(5)
        notify("Speed set to 5x", "success")
    end)
    
    createActionButton("Speed x10", "💨", function()
        setSpeed(10)
        notify("Speed set to 10x", "success")
    end)
    
    createToggle("Higher Jump", "🦘", function(enabled)
        jumpEnabled = enabled
        updateJump()
        notify("Higher Jump: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("No-Clip", "👻", function(enabled)
        if enabled then
            startNoclip()
            notify("No-Clip: ON - WARNING: Experimental!", "warning")
        else
            stopNoclip()
            notify("No-Clip: OFF", "info")
        end
    end)
    
    createSection("⚔️ Combat Enhancements")
    
    createToggle("Auto Block", "🛡️", function(enabled)
        if enabled then
            startAutoBlock()
        else
            stopAutoBlock()
        end
    end)
    
    createToggle("Auto Dodge", "💨", function(enabled)
        if enabled then
            startAutoDodge()
        else
            stopAutoDodge()
        end
    end)
    
    createSection("🎯 Player Tracking")
    
    createToggle("Advanced Tracking", "👁️", function(enabled)
        trackingEnabled = enabled
        notify("Player Tracking: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
end

local function showAI()
    clearContent()
    setActiveButton(AIButton)
    
    createSection("🤖 AI Player System")
    
    createToggle("AI Player", "🤖", function(enabled)
        if enabled then
            startAI()
        else
            stopAI()
        end
    end)
    
    createSection("🎯 AI Modes")
    
    createActionButton("Farming Mode", "🌾", function()
        setAIMode("Farming")
    end)
    
    createActionButton("Questing Mode", "📋", function()
        setAIMode("Questing")
    end)
    
    createActionButton("Exploring Mode", "🗺️", function()
        setAIMode("Exploring")
    end)
    
    createActionButton("Combat Mode", "⚔️", function()
        setAIMode("Combat")
    end)
    
    createSection("📊 AI Statistics")
    
    local statsText = Instance.new("TextLabel")
    statsText.Size = UDim2.new(1, -8, 0, 80)
    statsText.BackgroundTransparency = 1
    statsText.Font = Enum.Font.Gotham
    statsText.TextSize = 11
    statsText.TextColor3 = Colors.TextDim
    statsText.TextXAlignment = Enum.TextXAlignment.Left
    statsText.TextYAlignment = Enum.TextYAlignment.Top
    statsText.TextWrapped = true
    statsText.Text = "Enemies Killed: " .. aiStats.enemiesKilled .. "\nQuests Completed: " .. aiStats.questsCompleted .. "\nItems Collected: " .. aiStats.itemsCollected .. "\nDistance Traveled: " .. aiStats.distanceTraveled
    statsText.Parent = ContentScroller
    
    createSection("🎮 AI Controls")
    
    createActionButton("Reset AI Stats", "🔄", function()
        aiStats = {
            enemiesKilled = 0,
            questsCompleted = 0,
            itemsCollected = 0,
            distanceTraveled = 0
        }
        notify("AI Statistics Reset", "info")
    end)
    
    createActionButton("AI Status", "📈", function()
        notify("AI Status: " .. (aiEnabled and "ACTIVE" or "INACTIVE") .. " | Mode: " .. aiMode .. " | State: " .. aiState, "info")
    end)
    
    createSection("🎭 AI Personality")
    
    createActionButton("Aggressive Combat", "⚔️", function()
        aiPersonality.combatStyle = "Aggressive"
        aiPersonality.reactionTime = math.random(100, 300)
        notify("AI Combat Style: Aggressive", "success")
    end)
    
    createActionButton("Defensive Combat", "🛡️", function()
        aiPersonality.combatStyle = "Defensive"
        aiPersonality.reactionTime = math.random(400, 800)
        notify("AI Combat Style: Defensive", "success")
    end)
    
    createActionButton("Balanced Combat", "⚖️", function()
        aiPersonality.combatStyle = "Balanced"
        aiPersonality.reactionTime = math.random(200, 600)
        notify("AI Combat Style: Balanced", "success")
    end)
    
    createActionButton("Randomize Personality", "🎲", function()
        aiPersonality.reactionTime = math.random(200, 800)
        aiPersonality.decisionDelay = math.random(1, 3)
        aiPersonality.randomPauseChance = math.random(0.05, 0.15)
        aiPersonality.lookAroundChance = math.random(0.03, 0.08)
        notify("AI Personality Randomized!", "success")
    end)
end

local function showFarming()
    clearContent()
    setActiveButton(FarmingButton)
    
    createSection("⚔️ Basic Farming")
    
    createToggle("Auto Farm", "🌾", function(enabled)
        if enabled then
            startAutoFarm()
        else
            stopAutoFarm()
        end
    end)
    
    createToggle("Auto Quest", "📋", function(enabled)
        autoQuest = enabled
        notify("Auto Quest: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Equip", "⚔️", function(enabled)
        autoEquip = enabled
        notify("Auto Equip: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createSection("🏭 Advanced Farming")
    
    createToggle("Auto Factory", "🏭", function(enabled)
        if enabled then
            startAutoFactory()
        else
            stopAutoFactory()
        end
    end)
    
    createToggle("Auto Elite Hunter", "👑", function(enabled)
        if enabled then
            startAutoElite()
        else
            stopAutoElite()
        end
    end)
    
    createToggle("Auto Raid", "⚡", function(enabled)
        if enabled then
            startAutoRaid()
        else
            stopAutoRaid()
        end
    end)
    
    createToggle("Auto Materials", "💎", function(enabled)
        if enabled then
            startAutoMaterials()
        else
            stopAutoMaterials()
        end
    end)
    
    createSection("🌊 Sea Events")
    
    createToggle("Auto Sea Event", "🌊", function(enabled)
        autoSeaEvent = enabled
        notify("Auto Sea Event: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Sea Beast", "🐋", function(enabled)
        autoSeaBeast = enabled
        notify("Auto Sea Beast: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Dungeon", "🏰", function(enabled)
        autoDungeon = enabled
        notify("Auto Dungeon: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
end

local function showQuests()
    clearContent()
    setActiveButton(QuestsButton)
    
    createSection("🍒 Quest Management")
    
    createToggle("Auto Quest", "📋", function(enabled)
        if enabled then
            startAutoQuest()
        else
            stopAutoQuest()
        end
    end)
    
    createToggle("Auto Collect Rewards", "🎁", function(enabled)
        autoClaim = enabled
        notify("Auto Collect Rewards: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createSection("🎯 Quest Types")
    
    createActionButton("Start Bandit Quest", "👤", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Bandit Quest")
            notify("Started Bandit Quest", "success")
        else
            notify("Quest system not found", "error")
        end
    end)
    
    createActionButton("Start Marine Quest", "👮", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Marine Quest")
            notify("Started Marine Quest", "success")
        else
            notify("Quest system not found", "error")
        end
    end)
    
    createActionButton("Start Pirate Quest", "🏴‍☠️", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Pirate Quest")
            notify("Started Pirate Quest", "success")
        else
            notify("Quest system not found", "error")
        end
    end)
    
    createActionButton("Start Sky Quest", "☁️", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Sky Quest")
            notify("Started Sky Quest", "success")
        else
            notify("Quest system not found", "error")
        end
    end)
    
    createActionButton("Start Fishman Quest", "🐟", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "Fishman Quest")
            notify("Started Fishman Quest", "success")
        else
            notify("Quest system not found", "error")
        end
    end)
end

local function showTeleport()
    clearContent()
    setActiveButton(TeleportButton)
    
    createSection("🧭 Basic Teleports")
    
    createActionButton("Teleport to Spawn", "🏠", function()
        teleportTo(Vector3.new(0, 5, 0))
        notify("Teleported to Spawn", "success")
    end)
    
    createActionButton("Teleport to Shop", "🛒", function()
        teleportTo(Vector3.new(100, 5, 0))
        notify("Teleported to Shop", "success")
    end)
    
    createActionButton("Teleport to Training Ground", "⚔️", function()
        teleportTo(Vector3.new(200, 5, 0))
        notify("Teleported to Training Ground", "success")
    end)
    
    createSection("🌊 Sea Teleports")
    
    createActionButton("Go to Second Sea", "🌊", function()
        notify("Teleporting to Second Sea", "info")
    end)
    
    createActionButton("Go to Third Sea", "🌊", function()
        notify("Teleporting to Third Sea", "info")
    end)
    
    createSection("🏝️ Island Teleports")
    
    createActionButton("Jungle Island", "🌴", function()
        teleportTo(Vector3.new(-1500, 50, 0))
        notify("Teleported to Jungle Island", "success")
    end)
    
    createActionButton("Pirate Village", "🏴‍☠️", function()
        teleportTo(Vector3.new(-1000, 50, 0))
        notify("Teleported to Pirate Village", "success")
    end)
    
    createActionButton("Marine Fortress", "🏰", function()
        teleportTo(Vector3.new(-500, 50, 0))
        notify("Teleported to Marine Fortress", "success")
    end)
end

local function showVisuals()
    clearContent()
    setActiveButton(VisualsButton)
    
    createSection("🌈 Visual Effects")
    
    createToggle("ESP", "👁️", function(enabled)
        if enabled then
            startESP()
        else
            stopESP()
        end
    end)
    
    createToggle("Name Tags", "🏷️", function(enabled)
        nameTagsEnabled = enabled
        notify("Name Tags: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Tracers", "📏", function(enabled)
        tracersEnabled = enabled
        notify("Tracers: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Chams", "👻", function(enabled)
        chamsEnabled = enabled
        notify("Chams: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createSection("🎨 UI Customization")
    
    createToggle("Dark Mode", "🌙", function(enabled)
        darkModeEnabled = enabled
        notify("Dark Mode: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Glow Effects", "✨", function(enabled)
        glowEffectsEnabled = enabled
        notify("Glow Effects: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Rainbow Mode", "🌈", function(enabled)
        rainbowModeEnabled = enabled
        notify("Rainbow Mode: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
end

local function showShop()
    clearContent()
    setActiveButton(ShopButton)
    
    createSection("🛒 Shop Utilities")
    
    createToggle("Auto Buy Items", "💰", function(enabled)
        if enabled then
            startAutoBuyItems()
        else
            stopAutoBuyItems()
        end
    end)
    
    createToggle("Auto Buy Fruits", "🍎", function(enabled)
        if enabled then
            startAutoBuyFruits()
        else
            stopAutoBuyFruits()
        end
    end)
    
    createToggle("Auto Buy Swords", "⚔️", function(enabled)
        if enabled then
            startAutoBuySwords()
        else
            stopAutoBuySwords()
        end
    end)
    
    createSection("🛍️ Quick Purchases")
    
    createActionButton("Buy Sword", "⚔️", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Sword")
            notify("Purchased Sword", "success")
        else
            notify("Shop system not found", "error")
        end
    end)
    
    createActionButton("Buy Gun", "🔫", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Gun")
            notify("Purchased Gun", "success")
        else
            notify("Shop system not found", "error")
        end
    end)
    
    createActionButton("Buy Fruit", "🍎", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Fruit")
            notify("Purchased Fruit", "success")
        else
            notify("Shop system not found", "error")
        end
    end)
    
    createActionButton("Buy Fighting Style", "🥋", function()
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "FightingStyle")
            notify("Purchased Fighting Style", "success")
        else
            notify("Shop system not found", "error")
        end
    end)
end

local function showMisc()
    clearContent()
    setActiveButton(MiscButton)
    
    createSection("⚙️ Utility Tools")
    
    createActionButton("Rejoin Server", "🔄", function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
        notify("Rejoining server...", "info")
    end)
    
    createActionButton("Copy Game ID", "📋", function()
        setclipboard(tostring(game.PlaceId))
        notify("Game ID copied to clipboard", "success")
    end)
    
    createActionButton("Copy Player ID", "👤", function()
        setclipboard(tostring(LocalPlayer.UserId))
        notify("Player ID copied to clipboard", "success")
    end)
    
    createActionButton("Server Hop", "🌐", function()
        serverHop()
    end)
    
    createSection("🔧 Advanced Tools")
    
    createToggle("Anti-AFK", "🚫", function(enabled)
        if enabled then
            startAntiAFK()
        else
            stopAntiAFK()
        end
    end)
    
    createToggle("Auto Rejoin", "🔄", function(enabled)
        autoRejoin = enabled
        notify("Auto Rejoin: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Notifications", "🔔", function(enabled)
        notify("Notifications: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Claim Rewards", "🎁", function(enabled)
        autoClaim = enabled
        notify("Auto Claim Rewards: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
end

-- Create sidebar buttons
local HomepageButton = createButton("Home", "🏠", showHomepage)
local PlayersButton = createButton("Players", "👤", showPlayers)
local AIButton = createButton("AI Player", "🤖", showAI)
local FarmingButton = createButton("Farming", "⚔️", showFarming)
local QuestsButton = createButton("Quests", "🍒", showQuests)
local TeleportButton = createButton("Teleport", "🧭", showTeleport)
local VisualsButton = createButton("Visuals", "🌈", showVisuals)
local ShopButton = createButton("Shop", "🛒", showShop)
local MiscButton = createButton("Misc", "⚙️", showMisc)

-- Window controls
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    script:Destroy()
end)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        MainContent.Visible = true
        Sidebar.Visible = true
        MainWindow.Size = Config.WindowSize
        minimized = false
    else
        MainContent.Visible = false
        Sidebar.Visible = false
        MainWindow.Size = UDim2.new(0, 520, 0, 24)
        minimized = true
    end
end)

-- Dragging functionality
local dragging = false
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainWindow.Position
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainWindow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Character respawn handling
LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    task.wait(0.1) -- Wait for character to fully load
    
    -- Reapply speed enhancement
    if speedEnabled then
        updateSpeed()
    end
    
    -- Reapply jump enhancement
    if jumpEnabled then
        updateJump()
    end
    
    -- Reapply noclip if enabled
    if noclipEnabled then
        task.wait(0.2)
        startNoclip()
    end
    
    -- Store original values for new character
    if character:FindFirstChild("Humanoid") then
        originalWalkSpeed = character.Humanoid.WalkSpeed
        originalJumpPower = character.Humanoid.JumpPower
    end
end)

-- Create sidebar buttons FIRST (without callbacks to avoid circular reference)
print("About to create buttons...")
local HomepageButton = createButton("Home", "🏠", nil)
local PlayersButton = createButton("Players", "👤", nil)
local AIButton = createButton("AI Player", "🤖", nil)
local FarmingButton = createButton("Farming", "⚔️", nil)
local QuestsButton = createButton("Quests", "🍒", nil)
local TeleportButton = createButton("Teleport", "🧭", nil)
local VisualsButton = createButton("Visuals", "🌈", nil)
local ShopButton = createButton("Shop", "🛒", nil)
local MiscButton = createButton("Misc", "⚙️", nil)

print("All buttons created, adding callbacks...")

-- Now add the callbacks
HomepageButton.MouseButton1Click:Connect(showHomepage)
PlayersButton.MouseButton1Click:Connect(showPlayers)
AIButton.MouseButton1Click:Connect(showAI)
FarmingButton.MouseButton1Click:Connect(showFarming)
QuestsButton.MouseButton1Click:Connect(showQuests)
TeleportButton.MouseButton1Click:Connect(showTeleport)
VisualsButton.MouseButton1Click:Connect(showVisuals)
ShopButton.MouseButton1Click:Connect(showShop)
MiscButton.MouseButton1Click:Connect(showMisc)

print("All buttons created")

-- Show default content
task.wait(0.1) -- Small delay to ensure UI is fully loaded
print("About to call showHomepage, HomepageButton exists:", HomepageButton ~= nil)
showHomepage()

-- Initialize UI
notify("Obsidian-Codex v1.0 loaded successfully!", "success")
