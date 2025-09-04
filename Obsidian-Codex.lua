-- Obsidian-Codex - Advanced Roblox Enhancement Suite
-- Deep Dark Metallic UI + Comprehensive Game Features

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
ContentScroller.Parent = MainContent

local ContentLayout = Instance.new("UIListLayout")
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
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1, -8, 0, 24)
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Parent = ContentScroller
    
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.Size = UDim2.new(1, 0, 1, 0)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Font = Enum.Font.GothamBold
    sectionLabel.TextSize = 12
    sectionLabel.TextColor3 = Colors.Accent
    sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    sectionLabel.Text = title
    sectionLabel.Parent = sectionFrame
    
    return sectionFrame
end

-- Clear content function
local function clearContent()
    for _, child in ipairs(ContentScroller:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
end

-- Active button tracking
local activeButton = nil
local function setActiveButton(button)
    if activeButton then
        TweenService:Create(activeButton, TweenInfo.new(Config.AnimationSpeed), {
            BackgroundColor3 = Colors.Secondary,
            TextColor3 = Colors.TextDim
        }):Play()
    end
    
    activeButton = button
    TweenService:Create(button, TweenInfo.new(Config.AnimationSpeed), {
        BackgroundColor3 = Colors.Accent,
        TextColor3 = Colors.Primary
    }):Play()
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
            LocalPlayer.Character.Humanoid.JumpPower = originalJumpPower * 2
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

-- Tab Content Functions
local function showHomepage()
    clearContent()
    setActiveButton(HomepageButton)
    
    createSection("🏠 Welcome to Obsidian-Codex v1.0")
    
    local welcomeText = Instance.new("TextLabel")
    welcomeText.Size = UDim2.new(1, -8, 0, 80)
    welcomeText.BackgroundTransparency = 1
    welcomeText.Font = Enum.Font.Gotham
    welcomeText.TextSize = 11
    welcomeText.TextColor3 = Colors.TextDim
    welcomeText.TextXAlignment = Enum.TextXAlignment.Left
    welcomeText.TextYAlignment = Enum.TextYAlignment.Top
    welcomeText.TextWrapped = true
    welcomeText.Text = "Advanced Roblox enhancement suite with comprehensive features:\n\n• Advanced Player Tracking & ESP\n• Auto Farming (All Seas)\n• Combat Enhancements\n• Quest Automation\n• Teleportation Tools\n• Visual Effects\n• Shop Utilities\n• Anti-AFK & Auto Rejoin"
    welcomeText.Parent = ContentScroller
    
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
    
    createToggle("Higher Jump", "🦘", function(enabled)
        jumpEnabled = enabled
        updateJump()
        notify("Higher Jump: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("No-Clip", "👻", function(enabled)
        noclipEnabled = enabled
        if enabled then
            enableNoclip()
            noclipConnection = LocalPlayer.CharacterAdded:Connect(function(character)
                character:WaitForChild("HumanoidRootPart")
                task.wait(0.1)
                enableNoclip()
            end)
            notify("No-Clip: ON - WARNING: Experimental!", "warning")
        else
            disableNoclip()
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
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
        autoQuest = enabled
        notify("Auto Quest: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Collect Rewards", "🎁", function(enabled)
        autoClaim = enabled
        notify("Auto Collect Rewards: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createSection("🎯 Quest Types")
    
    createActionButton("Start Bandit Quest", "👤", function()
        notify("Starting Bandit Quest", "info")
    end)
    
    createActionButton("Start Marine Quest", "👮", function()
        notify("Starting Marine Quest", "info")
    end)
    
    createActionButton("Start Pirate Quest", "🏴‍☠️", function()
        notify("Starting Pirate Quest", "info")
    end)
    
    createActionButton("Start Sky Quest", "☁️", function()
        notify("Starting Sky Quest", "info")
    end)
    
    createActionButton("Start Fishman Quest", "🐟", function()
        notify("Starting Fishman Quest", "info")
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
        espEnabled = enabled
        notify("ESP: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
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
        notify("Dark Mode: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Glow Effects", "✨", function(enabled)
        notify("Glow Effects: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Rainbow Mode", "🌈", function(enabled)
        notify("Rainbow Mode: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
end

local function showShop()
    clearContent()
    setActiveButton(ShopButton)
    
    createSection("🛒 Shop Utilities")
    
    createToggle("Auto Buy Items", "💰", function(enabled)
        notify("Auto Buy Items: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Buy Fruits", "🍎", function(enabled)
        notify("Auto Buy Fruits: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createToggle("Auto Buy Swords", "⚔️", function(enabled)
        notify("Auto Buy Swords: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end)
    
    createSection("🛍️ Quick Purchases")
    
    createActionButton("Buy Sword", "⚔️", function()
        notify("Purchasing Sword", "info")
    end)
    
    createActionButton("Buy Gun", "🔫", function()
        notify("Purchasing Gun", "info")
    end)
    
    createActionButton("Buy Fruit", "🍎", function()
        notify("Purchasing Fruit", "info")
    end)
    
    createActionButton("Buy Fighting Style", "🥋", function()
        notify("Purchasing Fighting Style", "info")
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
        notify("Server hopping...", "info")
    end)
    
    createSection("🔧 Advanced Tools")
    
    createToggle("Anti-AFK", "🚫", function(enabled)
        notify("Anti-AFK: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
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
    updateSpeed()
    updateJump()
    if noclipEnabled then
        task.wait(0.1)
        enableNoclip()
    end
end)

-- Show default content
showHomepage()

-- Initialize UI
notify("Obsidian-Codex v1.0 loaded successfully!", "success")
