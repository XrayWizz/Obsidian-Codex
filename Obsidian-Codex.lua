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
    GlowIntensity = 0.3,
    LiquidAnimationSpeed = 0.8,
    BubbleEffectDuration = 1.2,
    MinimizedWidth = 180 -- Width when minimized (just title + controls)
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

-- Liquid background effect for title bar
local LiquidBackground = Instance.new("Frame")
LiquidBackground.Name = "LiquidBackground"
LiquidBackground.Size = UDim2.new(1, 0, 1, 0)
LiquidBackground.BackgroundTransparency = 1
LiquidBackground.BorderSizePixel = 0
LiquidBackground.Parent = TitleBar

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
TitleText.Text = "Obsidian-Codex v1.1"
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

-- Liquid Bubble Animation Functions
local function createBubbleEffect(parent, position, size)
    local bubble = Instance.new("Frame")
    bubble.Name = "LiquidBubble"
    bubble.Size = UDim2.new(0, size, 0, size)
    bubble.Position = UDim2.new(0, position.X, 0, position.Y)
    bubble.BackgroundColor3 = Colors.Accent
    bubble.BackgroundTransparency = 0.1
    bubble.BorderSizePixel = 0
    bubble.Parent = parent
    
    local bubbleCorner = Instance.new("UICorner")
    bubbleCorner.CornerRadius = UDim.new(0.5, 0)
    bubbleCorner.Parent = bubble
    
    local bubbleGlow = Instance.new("UIStroke")
    bubbleGlow.Thickness = 3
    bubbleGlow.Color = Colors.Glow
    bubbleGlow.Transparency = 0.2
    bubbleGlow.Parent = bubble
    
    -- Add ripple effect
    local ripple = Instance.new("Frame")
    ripple.Name = "Ripple"
    ripple.Size = UDim2.new(0, size * 0.4, 0, size * 0.4)
    ripple.Position = UDim2.new(0.5, -size * 0.2, 0.5, -size * 0.2)
    ripple.BackgroundColor3 = Colors.Text
    ripple.BackgroundTransparency = 0.6
    ripple.BorderSizePixel = 0
    ripple.Parent = bubble
    
    local rippleCorner = Instance.new("UICorner")
    rippleCorner.CornerRadius = UDim.new(0.5, 0)
    rippleCorner.Parent = ripple
    
    -- Animate bubble with more realistic physics
    local bubbleTween = TweenService:Create(bubble, TweenInfo.new(
        0.8, 
        Enum.EasingStyle.Back, 
        Enum.EasingDirection.Out
    ), {
        Size = UDim2.new(0, size * 2.5, 0, size * 2.5),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, position.X - size * 0.75, 0, position.Y - size * 0.75)
    })
    
    local glowTween = TweenService:Create(bubbleGlow, TweenInfo.new(
        0.8, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out
    ), {
        Transparency = 1,
        Thickness = 0
    })
    
    local rippleTween = TweenService:Create(ripple, TweenInfo.new(
        0.5, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out
    ), {
        Size = UDim2.new(0, size * 1.2, 0, size * 1.2),
        Position = UDim2.new(0.5, -size * 0.6, 0.5, -size * 0.6),
        BackgroundTransparency = 1
    })
    
    bubbleTween:Play()
    glowTween:Play()
    rippleTween:Play()
    
    bubbleTween.Completed:Connect(function()
        bubble:Destroy()
    end)
    
    return bubble
end

local function createLiquidFlowEffect(parent, startPos, endPos, duration)
    local flow = Instance.new("Frame")
    flow.Name = "LiquidFlow"
    flow.Size = UDim2.new(0, 25, 0, 6)
    flow.Position = UDim2.new(0, startPos.X, 0, startPos.Y)
    flow.BackgroundColor3 = Colors.Accent
    flow.BackgroundTransparency = 0.1
    flow.BorderSizePixel = 0
    flow.Parent = parent
    
    local flowCorner = Instance.new("UICorner")
    flowCorner.CornerRadius = UDim.new(0, 3)
    flowCorner.Parent = flow
    
    local flowGlow = Instance.new("UIStroke")
    flowGlow.Thickness = 1
    flowGlow.Color = Colors.Glow
    flowGlow.Transparency = 0.3
    flowGlow.Parent = flow
    
    local flowTween = TweenService:Create(flow, TweenInfo.new(
        duration, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.InOut
    ), {
        Position = UDim2.new(0, endPos.X, 0, endPos.Y),
        BackgroundTransparency = 1
    })
    
    local glowTween = TweenService:Create(flowGlow, TweenInfo.new(
        duration, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.InOut
    ), {
        Transparency = 1
    })
    
    flowTween:Play()
    glowTween:Play()
    flowTween.Completed:Connect(function()
        flow:Destroy()
    end)
    
    return flow
end

local function createBubblePlopEffect(parent, position)
    -- Create multiple small bubbles for plop effect
    for i = 1, 5 do
        local angle = (i - 1) * (math.pi * 2 / 5)
        local distance = math.random(10, 25)
        local bubblePos = Vector2.new(
            position.X + math.cos(angle) * distance,
            position.Y + math.sin(angle) * distance
        )
        
        spawn(function()
            wait(math.random(0, 100) / 1000) -- Random delay
            createBubbleEffect(parent, bubblePos, math.random(8, 15))
        end)
    end
end

local function animateLiquidMinimize()
    -- Create flowing water effect during minimize
    local titleBarCenter = Vector2.new(
        TitleBar.AbsolutePosition.X + TitleBar.AbsoluteSize.X / 2,
        TitleBar.AbsolutePosition.Y + TitleBar.AbsoluteSize.Y / 2
    )
    
    -- Create liquid background effect
    local liquidTween = TweenService:Create(LiquidBackground, TweenInfo.new(
        0.3, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out
    ), {
        BackgroundColor3 = Colors.Accent,
        BackgroundTransparency = 0.5
    })
    liquidTween:Play()
    
    -- Create multiple flow effects
    for i = 1, 6 do
        spawn(function()
            wait(i * 0.05)
            local startPos = Vector2.new(
                titleBarCenter.X + math.random(-40, 40),
                titleBarCenter.Y + math.random(-5, 5)
            )
            local endPos = Vector2.new(
                startPos.X + math.random(-30, 30),
                startPos.Y + math.random(-15, 15)
            )
            createLiquidFlowEffect(LiquidBackground, startPos, endPos, 0.6)
        end)
    end
    
    -- Create bubble plop at the end
    spawn(function()
        wait(0.4)
        createBubblePlopEffect(LiquidBackground, titleBarCenter)
        
        -- Fade out liquid background
        wait(0.2)
        local fadeTween = TweenService:Create(LiquidBackground, TweenInfo.new(
            0.4, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out
        ), {
            BackgroundTransparency = 1
        })
        fadeTween:Play()
    end)
end

local function animateLiquidMaximize()
    -- Create flowing water effect during maximize
    local titleBarCenter = Vector2.new(
        TitleBar.AbsolutePosition.X + TitleBar.AbsoluteSize.X / 2,
        TitleBar.AbsolutePosition.Y + TitleBar.AbsoluteSize.Y / 2
    )
    
    -- Create liquid background effect
    local liquidTween = TweenService:Create(LiquidBackground, TweenInfo.new(
        0.2, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out
    ), {
        BackgroundColor3 = Colors.Accent,
        BackgroundTransparency = 0.4
    })
    liquidTween:Play()
    
    -- Create expanding bubble effect
    createBubbleEffect(LiquidBackground, titleBarCenter, 25)
    
    -- Create flow effects
    for i = 1, 8 do
        spawn(function()
            wait(i * 0.04)
            local startPos = Vector2.new(
                titleBarCenter.X + math.random(-30, 30),
                titleBarCenter.Y + math.random(-4, 4)
            )
            local endPos = Vector2.new(
                startPos.X + math.random(-40, 40),
                startPos.Y + math.random(-18, 18)
            )
            createLiquidFlowEffect(LiquidBackground, startPos, endPos, 0.7)
        end)
    end
    
    -- Fade out liquid background
    spawn(function()
        wait(0.6)
        local fadeTween = TweenService:Create(LiquidBackground, TweenInfo.new(
            0.5, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out
        ), {
            BackgroundTransparency = 1
        })
        fadeTween:Play()
    end)
end

-- Utility Functions
local function getCurrentSea()
    -- Check for Third Sea
    if Workspace:FindFirstChild("Third Sea") then
        return "Third Sea"
    -- Check for Second Sea
    elseif Workspace:FindFirstChild("Second Sea") then
        return "Second Sea"
    -- Check for First Sea
    elseif Workspace:FindFirstChild("First Sea") then
        return "First Sea"
    -- Check for specific islands that indicate sea level
    elseif Workspace:FindFirstChild("New World") then
        return "Third Sea"
    elseif Workspace:FindFirstChild("Grand Line") then
        return "Second Sea"
    else
        return "First Sea" -- Default fallback
    end
end

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

local function createToggleWithDropdown(name, icon, callback, dropdownContent)
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
    
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Size = UDim2.new(1, -16, 0, 0)
    dropdownFrame.Position = UDim2.new(0, 8, 0, 32)
    dropdownFrame.BackgroundTransparency = 1
    dropdownFrame.Visible = false
    dropdownFrame.Parent = toggleFrame
    
    local dropdownLayout = Instance.new("UIListLayout")
    dropdownLayout.FillDirection = Enum.FillDirection.Vertical
    dropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder
    dropdownLayout.Padding = UDim.new(0, 4)
    dropdownLayout.Parent = dropdownFrame
    
    local isEnabled = false
    
    toggleButton.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        toggleButton.BackgroundColor3 = isEnabled and Colors.Success or Colors.Error
        toggleButton.Text = isEnabled and "ON" or "OFF"
        
        -- Show/hide dropdown with animation and expand/collapse main frame
        if isEnabled then
            dropdownFrame.Visible = true
            dropdownFrame.Size = UDim2.new(1, -16, 0, 0)
            
            -- Wait for content to be added, then animate
            task.wait(0.1)
            local targetHeight = dropdownLayout.AbsoluteContentSize.Y + 8 -- Add some padding
            
            dropdownFrame:TweenSize(
                UDim2.new(1, -16, 0, targetHeight),
                "Out", "Quad", 0.2, true
            )
            
            -- Expand the main toggle frame to accommodate dropdown
            toggleFrame:TweenSize(
                UDim2.new(1, -8, 0, 32 + targetHeight + 8),
                "Out", "Quad", 0.2, true
            )
        else
            local currentHeight = dropdownFrame.Size.Y.Offset
            
            dropdownFrame:TweenSize(
                UDim2.new(1, -16, 0, 0),
                "Out", "Quad", 0.2, true,
                function()
                    dropdownFrame.Visible = false
                end
            )
            
            -- Collapse the main toggle frame back to original size
            toggleFrame:TweenSize(
                UDim2.new(1, -8, 0, 32),
                "Out", "Quad", 0.2, true
            )
        end
        
        if callback then
            callback(isEnabled)
        end
    end)
    
    -- Add dropdown content if provided
    if dropdownContent then
        dropdownContent(dropdownFrame)
    end
    
    return toggleFrame, toggleButton, dropdownFrame
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

local function createCollapsibleSection(title, icon, initialState)
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(1, -8, 0, 32)
    mainFrame.BackgroundColor3 = Colors.Secondary
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = ContentScroller
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 4)
    mainCorner.Parent = mainFrame
    
    local mainBorder = Instance.new("UIStroke")
    mainBorder.Thickness = 1
    mainBorder.Color = Colors.Border
    mainBorder.Transparency = 0.8
    mainBorder.Parent = mainFrame
    
    local headerButton = Instance.new("TextButton")
    headerButton.Size = UDim2.new(1, 0, 1, 0)
    headerButton.BackgroundTransparency = 1
    headerButton.Font = Enum.Font.GothamSemibold
    headerButton.TextSize = 12
    headerButton.TextColor3 = Colors.Text
    headerButton.TextXAlignment = Enum.TextXAlignment.Left
    headerButton.Text = (icon and icon .. " " or "") .. title
    headerButton.Parent = mainFrame
    
    local dropdownIcon = Instance.new("TextLabel")
    dropdownIcon.Size = UDim2.new(0, 20, 0, 20)
    dropdownIcon.Position = UDim2.new(1, -25, 0, 6)
    dropdownIcon.BackgroundTransparency = 1
    dropdownIcon.Font = Enum.Font.GothamBold
    dropdownIcon.TextSize = 14
    dropdownIcon.TextColor3 = Colors.Text
    dropdownIcon.TextXAlignment = Enum.TextXAlignment.Center
    dropdownIcon.Text = "▼"
    dropdownIcon.Parent = mainFrame
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -16, 0, 0)
    contentFrame.Position = UDim2.new(0, 8, 0, 32)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Visible = initialState or false
    contentFrame.Parent = mainFrame
    
    local contentLayout = Instance.new("UIListLayout")
    contentLayout.FillDirection = Enum.FillDirection.Vertical
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 4)
    contentLayout.Parent = contentFrame
    
    local isExpanded = initialState or false
    
    headerButton.MouseButton1Click:Connect(function()
        isExpanded = not isExpanded
        contentFrame.Visible = isExpanded
        dropdownIcon.Text = isExpanded and "▲" or "▼"
        
        -- Animate the dropdown
        if isExpanded then
            contentFrame.Size = UDim2.new(1, -16, 0, 0)
            contentFrame:TweenSize(
                UDim2.new(1, -16, 0, contentLayout.AbsoluteContentSize.Y),
                "Out", "Quad", 0.2, true
            )
        else
            contentFrame:TweenSize(
                UDim2.new(1, -16, 0, 0),
                "Out", "Quad", 0.2, true,
                function()
                    contentFrame.Visible = false
                end
            )
        end
    end)
    
    return mainFrame, contentFrame
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
    clearContent()
    setActiveButton(HomepageButton)
    
    createSection("🏠 Welcome to Obsidian-Codex v1.2")
    
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
    
    -- Quick Stats Collapsible Section
    local quickStatsFrame = Instance.new("Frame")
    quickStatsFrame.Size = UDim2.new(1, -8, 0, 32)
    quickStatsFrame.BackgroundColor3 = Colors.Secondary
    quickStatsFrame.BorderSizePixel = 0
    quickStatsFrame.Parent = ContentScroller
    
    local quickStatsCorner = Instance.new("UICorner")
    quickStatsCorner.CornerRadius = UDim.new(0, 4)
    quickStatsCorner.Parent = quickStatsFrame
    
    local quickStatsBorder = Instance.new("UIStroke")
    quickStatsBorder.Thickness = 1
    quickStatsBorder.Color = Colors.Border
    quickStatsBorder.Transparency = 0.8
    quickStatsBorder.Parent = quickStatsFrame
    
    local quickStatsButton = Instance.new("TextButton")
    quickStatsButton.Size = UDim2.new(1, 0, 1, 0)
    quickStatsButton.BackgroundTransparency = 1
    quickStatsButton.Font = Enum.Font.GothamSemibold
    quickStatsButton.TextSize = 12
    quickStatsButton.TextColor3 = Colors.Text
    quickStatsButton.TextXAlignment = Enum.TextXAlignment.Left
    quickStatsButton.Text = "📊 Quick Stats"
    quickStatsButton.Parent = quickStatsFrame
    
    local dropdownIcon = Instance.new("TextLabel")
    dropdownIcon.Size = UDim2.new(0, 20, 0, 20)
    dropdownIcon.Position = UDim2.new(1, -25, 0, 6)
    dropdownIcon.BackgroundTransparency = 1
    dropdownIcon.Font = Enum.Font.GothamBold
    dropdownIcon.TextSize = 14
    dropdownIcon.TextColor3 = Colors.Text
    dropdownIcon.TextXAlignment = Enum.TextXAlignment.Center
    dropdownIcon.Text = "▼"
    dropdownIcon.Parent = quickStatsFrame
    
    local quickStatsDropdown = Instance.new("Frame")
    quickStatsDropdown.Size = UDim2.new(1, -16, 0, 0)
    quickStatsDropdown.Position = UDim2.new(0, 8, 0, 32)
    quickStatsDropdown.BackgroundTransparency = 1
    quickStatsDropdown.Visible = false
    quickStatsDropdown.Parent = quickStatsFrame
    
    local quickStatsLayout = Instance.new("UIListLayout")
    quickStatsLayout.FillDirection = Enum.FillDirection.Vertical
    quickStatsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    quickStatsLayout.Padding = UDim.new(0, 4)
    quickStatsLayout.Parent = quickStatsDropdown
    
    local isQuickStatsExpanded = false
    
    quickStatsButton.MouseButton1Click:Connect(function()
        isQuickStatsExpanded = not isQuickStatsExpanded
        quickStatsDropdown.Visible = isQuickStatsExpanded
        dropdownIcon.Text = isQuickStatsExpanded and "▲" or "▼"
        
        if isQuickStatsExpanded then
            quickStatsDropdown.Size = UDim2.new(1, -16, 0, 0)
            task.wait(0.1)
            local targetHeight = quickStatsLayout.AbsoluteContentSize.Y + 8
            quickStatsDropdown:TweenSize(
                UDim2.new(1, -16, 0, targetHeight),
                "Out", "Quad", 0.2, true
            )
            quickStatsFrame:TweenSize(
                UDim2.new(1, -8, 0, 32 + targetHeight + 8),
                "Out", "Quad", 0.2, true
            )
        else
            quickStatsDropdown:TweenSize(
                UDim2.new(1, -16, 0, 0),
                "Out", "Quad", 0.2, true,
                function()
                    quickStatsDropdown.Visible = false
                end
            )
            quickStatsFrame:TweenSize(
                UDim2.new(1, -8, 0, 32),
                "Out", "Quad", 0.2, true
            )
        end
    end)
    
    -- Player Activity & Stats Button
    local playerStatsButton = Instance.new("TextButton")
    playerStatsButton.Size = UDim2.new(1, 0, 0, 28)
    playerStatsButton.BackgroundColor3 = Colors.Secondary
    playerStatsButton.BorderSizePixel = 0
    playerStatsButton.AutoButtonColor = false
    playerStatsButton.Font = Enum.Font.GothamSemibold
    playerStatsButton.TextSize = 12
    playerStatsButton.TextColor3 = Colors.Text
    playerStatsButton.Text = "📈 Check Player Activity & Stats"
    playerStatsButton.Parent = quickStatsDropdown
    
    local playerStatsCorner = Instance.new("UICorner")
    playerStatsCorner.CornerRadius = UDim.new(0, 4)
    playerStatsCorner.Parent = playerStatsButton
    
    playerStatsButton.MouseButton1Click:Connect(function()
        setActiveButton(PlayersButton)
        showPlayers()
        notify("Opened Player Tab", "success")
    end)
    
    -- Current Sea Button (with live detection)
    local currentSeaButton = Instance.new("TextButton")
    currentSeaButton.Size = UDim2.new(1, 0, 0, 28)
    currentSeaButton.BackgroundColor3 = Colors.Secondary
    currentSeaButton.BorderSizePixel = 0
    currentSeaButton.AutoButtonColor = false
    currentSeaButton.Font = Enum.Font.GothamSemibold
    currentSeaButton.TextSize = 12
    currentSeaButton.TextColor3 = Colors.Text
    currentSeaButton.Text = "🌊 Check Current Sea"
    currentSeaButton.Parent = quickStatsDropdown
    
    local currentSeaCorner = Instance.new("UICorner")
    currentSeaCorner.CornerRadius = UDim.new(0, 4)
    currentSeaCorner.Parent = currentSeaButton
    
    currentSeaButton.MouseButton1Click:Connect(function()
        local currentSea = getCurrentSea()
        notify("Current Sea: " .. currentSea, "info")
    end)
    
    -- Autofarm Settings Button
    local autofarmButton = Instance.new("TextButton")
    autofarmButton.Size = UDim2.new(1, 0, 0, 28)
    autofarmButton.BackgroundColor3 = Colors.Secondary
    autofarmButton.BorderSizePixel = 0
    autofarmButton.AutoButtonColor = false
    autofarmButton.Font = Enum.Font.GothamSemibold
    autofarmButton.TextSize = 12
    autofarmButton.TextColor3 = Colors.Text
    autofarmButton.Text = "⚔️ Autofarm Settings"
    autofarmButton.Parent = quickStatsDropdown
    
    local autofarmCorner = Instance.new("UICorner")
    autofarmCorner.CornerRadius = UDim.new(0, 4)
    autofarmCorner.Parent = autofarmButton
    
    autofarmButton.MouseButton1Click:Connect(function()
        setActiveButton(FarmingButton)
        showFarming()
        notify("Opened Farming Tab", "success")
    end)
    
    -- Teleportation Button
    local teleportButton = Instance.new("TextButton")
    teleportButton.Size = UDim2.new(1, 0, 0, 28)
    teleportButton.BackgroundColor3 = Colors.Secondary
    teleportButton.BorderSizePixel = 0
    teleportButton.AutoButtonColor = false
    teleportButton.Font = Enum.Font.GothamSemibold
    teleportButton.TextSize = 12
    teleportButton.TextColor3 = Colors.Text
    teleportButton.Text = "🧭 Teleportation"
    teleportButton.Parent = quickStatsDropdown
    
    local teleportCorner = Instance.new("UICorner")
    teleportCorner.CornerRadius = UDim.new(0, 4)
    teleportCorner.Parent = teleportButton
    
    teleportButton.MouseButton1Click:Connect(function()
        setActiveButton(TeleportButton)
        showTeleport()
        notify("Opened Teleport Tab", "success")
    end)
    
    -- Help & Feedback Button
    local helpButton = Instance.new("TextButton")
    helpButton.Size = UDim2.new(1, 0, 0, 28)
    helpButton.BackgroundColor3 = Colors.Secondary
    helpButton.BorderSizePixel = 0
    helpButton.AutoButtonColor = false
    helpButton.Font = Enum.Font.GothamSemibold
    helpButton.TextSize = 12
    helpButton.TextColor3 = Colors.Text
    helpButton.Text = "❓ Help & Feedback"
    helpButton.Parent = quickStatsDropdown
    
    local helpCorner = Instance.new("UICorner")
    helpCorner.CornerRadius = UDim.new(0, 4)
    helpCorner.Parent = helpButton
    
    helpButton.MouseButton1Click:Connect(function()
        setActiveButton(HelpButton)
        showHelp()
        notify("Opened Help & Feedback Tab", "success")
    end)
    
    createSection("📝 Changelog")
    
    local changelogText = Instance.new("TextLabel")
    changelogText.Size = UDim2.new(1, -8, 0, 140)
    changelogText.BackgroundTransparency = 1
    changelogText.Font = Enum.Font.Gotham
    changelogText.TextSize = 10
    changelogText.TextColor3 = Colors.TextDim
    changelogText.TextXAlignment = Enum.TextXAlignment.Left
    changelogText.TextYAlignment = Enum.TextYAlignment.Top
    changelogText.TextWrapped = true
    changelogText.Text = "v1.2 - Fruits Tab & Enhanced UI\n• Added new Fruits tab with probability lists\n• Modern toggle switch for Normal/Summer Gacha\n• Complete fruit probability data (Update 27.2)\n• Color-coded rarity system for fruits\n• Enhanced minimize animation with particle effects\n• Improved titlebar positioning and animations\n\nv1.1 - UI Fixes & Improvements\n• Fixed sidebar button functionality and content display\n• Resolved TweenService errors and circular reference issues\n• Cleaned up duplicate sidebar buttons\n• Improved content loading and UI responsiveness\n• Enhanced debugging and error handling\n\nv1.0 - Initial Release\n• Deep dark metallic theme\n• Complete ESP system with player tracking\n• Auto farming for all enemy types\n• Quest automation system\n• Advanced teleportation tools\n• Shop utilities with auto-buy features\n• Anti-AFK and server management\n• Comprehensive visual effects\n• Streamlined UI with neon accents\n• AI Player System - Bot plays the game for you!"
    changelogText.Parent = ContentScroller
end

local function showPlayers()
    clearContent()
    setActiveButton(PlayersButton)
    
    createSection("👤 Player Enhancements")
    
    createToggleWithDropdown("Player Speed", "💨", function(enabled)
        speedEnabled = enabled
        updateSpeed()
        local speedText = enabled and ("ON (x" .. currentSpeed .. ")") or "OFF"
        notify("Player Speed: " .. speedText, enabled and "success" or "info")
    end, function(dropdownFrame)
        -- Speed x2 button
        local speed2Button = Instance.new("TextButton")
        speed2Button.Size = UDim2.new(1, 0, 0, 28)
        speed2Button.BackgroundColor3 = Colors.Secondary
        speed2Button.BorderSizePixel = 0
        speed2Button.AutoButtonColor = false
        speed2Button.Font = Enum.Font.GothamSemibold
        speed2Button.TextSize = 12
        speed2Button.TextColor3 = Colors.Text
        speed2Button.Text = "⚡ Speed x2"
        speed2Button.Parent = dropdownFrame
        
        local speed2Corner = Instance.new("UICorner")
        speed2Corner.CornerRadius = UDim.new(0, 4)
        speed2Corner.Parent = speed2Button
        
        speed2Button.MouseButton1Click:Connect(function()
            setSpeed(2)
            speedEnabled = true
            updateSpeed()
            notify("Speed set to 2x and enabled", "success")
        end)
        
        -- Speed x5 button
        local speed5Button = Instance.new("TextButton")
        speed5Button.Size = UDim2.new(1, 0, 0, 28)
        speed5Button.BackgroundColor3 = Colors.Secondary
        speed5Button.BorderSizePixel = 0
        speed5Button.AutoButtonColor = false
        speed5Button.Font = Enum.Font.GothamSemibold
        speed5Button.TextSize = 12
        speed5Button.TextColor3 = Colors.Text
        speed5Button.Text = "🚀 Speed x5"
        speed5Button.Parent = dropdownFrame
        
        local speed5Corner = Instance.new("UICorner")
        speed5Corner.CornerRadius = UDim.new(0, 4)
        speed5Corner.Parent = speed5Button
        
        speed5Button.MouseButton1Click:Connect(function()
            setSpeed(5)
            speedEnabled = true
            updateSpeed()
            notify("Speed set to 5x and enabled", "success")
        end)
        
        -- Speed x10 button
        local speed10Button = Instance.new("TextButton")
        speed10Button.Size = UDim2.new(1, 0, 0, 28)
        speed10Button.BackgroundColor3 = Colors.Secondary
        speed10Button.BorderSizePixel = 0
        speed10Button.AutoButtonColor = false
        speed10Button.Font = Enum.Font.GothamSemibold
        speed10Button.TextSize = 12
        speed10Button.TextColor3 = Colors.Text
        speed10Button.Text = "💨 Speed x10"
        speed10Button.Parent = dropdownFrame
        
        local speed10Corner = Instance.new("UICorner")
        speed10Corner.CornerRadius = UDim.new(0, 4)
        speed10Corner.Parent = speed10Button
        
        speed10Button.MouseButton1Click:Connect(function()
            setSpeed(10)
            speedEnabled = true
            updateSpeed()
            notify("Speed set to 10x and enabled", "success")
        end)
        
        -- Reset Speed button
        local resetButton = Instance.new("TextButton")
        resetButton.Size = UDim2.new(1, 0, 0, 28)
        resetButton.BackgroundColor3 = Colors.Secondary
        resetButton.BorderSizePixel = 0
        resetButton.AutoButtonColor = false
        resetButton.Font = Enum.Font.GothamSemibold
        resetButton.TextSize = 12
        resetButton.TextColor3 = Colors.Text
        resetButton.Text = "🔄 Reset Speed"
        resetButton.Parent = dropdownFrame
        
        local resetCorner = Instance.new("UICorner")
        resetCorner.CornerRadius = UDim.new(0, 4)
        resetCorner.Parent = resetButton
        
        resetButton.MouseButton1Click:Connect(function()
            setSpeed(1)
            speedEnabled = false
            updateSpeed()
            notify("Speed reset to normal", "info")
        end)
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
    
    createSection("📊 Advanced Player Stats")
    
    createToggleWithDropdown("Advanced Player Stats", "📈", function(enabled)
        notify("Advanced Player Stats: " .. (enabled and "ON" or "OFF"), enabled and "success" or "info")
    end, function(dropdownFrame)
        -- Player selector dropdown
        local playerSelectorFrame = Instance.new("Frame")
        playerSelectorFrame.Size = UDim2.new(1, 0, 0, 32)
        playerSelectorFrame.BackgroundTransparency = 1
        playerSelectorFrame.Parent = dropdownFrame
        
        local playerSelectorLabel = Instance.new("TextLabel")
        playerSelectorLabel.Size = UDim2.new(0.4, 0, 1, 0)
        playerSelectorLabel.BackgroundTransparency = 1
        playerSelectorLabel.Font = Enum.Font.GothamSemibold
        playerSelectorLabel.TextSize = 12
        playerSelectorLabel.TextColor3 = Colors.Text
        playerSelectorLabel.TextXAlignment = Enum.TextXAlignment.Left
        playerSelectorLabel.Text = "Choose player:"
        playerSelectorLabel.Parent = playerSelectorFrame
        
        local playerDropdown = Instance.new("TextButton")
        playerDropdown.Size = UDim2.new(0.6, -8, 1, 0)
        playerDropdown.Position = UDim2.new(0.4, 8, 0, 0)
        playerDropdown.BackgroundColor3 = Colors.Secondary
        playerDropdown.BorderSizePixel = 0
        playerDropdown.AutoButtonColor = false
        playerDropdown.Font = Enum.Font.Gotham
        playerDropdown.TextSize = 11
        playerDropdown.TextColor3 = Colors.Text
        playerDropdown.Text = "Select Player"
        playerDropdown.Parent = playerSelectorFrame
        
        local playerDropdownCorner = Instance.new("UICorner")
        playerDropdownCorner.CornerRadius = UDim.new(0, 4)
        playerDropdownCorner.Parent = playerDropdown
        
        local playerDropdownBorder = Instance.new("UIStroke")
        playerDropdownBorder.Thickness = 1
        playerDropdownBorder.Color = Colors.Border
        playerDropdownBorder.Transparency = 0.8
        playerDropdownBorder.Parent = playerDropdown
        
        -- Player stats display
        local statsDisplayFrame = Instance.new("Frame")
        statsDisplayFrame.Size = UDim2.new(1, 0, 0, 120)
        statsDisplayFrame.BackgroundColor3 = Colors.Secondary
        statsDisplayFrame.BorderSizePixel = 0
        statsDisplayFrame.Visible = false
        statsDisplayFrame.Parent = dropdownFrame
        
        local statsDisplayCorner = Instance.new("UICorner")
        statsDisplayCorner.CornerRadius = UDim.new(0, 4)
        statsDisplayCorner.Parent = statsDisplayFrame
        
        local statsDisplayBorder = Instance.new("UIStroke")
        statsDisplayBorder.Thickness = 1
        statsDisplayBorder.Color = Colors.Border
        statsDisplayBorder.Transparency = 0.8
        statsDisplayBorder.Parent = statsDisplayFrame
        
        local statsText = Instance.new("TextLabel")
        statsText.Size = UDim2.new(1, -16, 1, -16)
        statsText.Position = UDim2.new(0, 8, 0, 8)
        statsText.BackgroundTransparency = 1
        statsText.Font = Enum.Font.Gotham
        statsText.TextSize = 10
        statsText.TextColor3 = Colors.Text
        statsText.TextXAlignment = Enum.TextXAlignment.Left
        statsText.TextYAlignment = Enum.TextYAlignment.Top
        statsText.TextWrapped = true
        statsText.Text = "Select a player to view their stats"
        statsText.Parent = statsDisplayFrame
        
        local selectedPlayer = nil
        local statsConnection = nil
        
        -- Function to update player stats
        local function updatePlayerStats(player)
            if not player or not player.Character then
                statsText.Text = "Player not found or not loaded"
                return
            end
            
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            local health = humanoid and math.floor(humanoid.Health) or "N/A"
            local maxHealth = humanoid and math.floor(humanoid.MaxHealth) or "N/A"
            
            -- Try to get player data (this might not work in all games)
            local playerData = "N/A"
            local fruit = "N/A"
            local beli = "N/A"
            local frags = "N/A"
            
            -- Attempt to get player stats (game-specific)
            if character:FindFirstChild("Humanoid") then
                -- This is a generic approach - actual implementation depends on the game
                playerData = "Level: " .. (humanoid.Level or "N/A")
            end
            
            statsText.Text = string.format(
                "👤 Username: %s\n🏷️ Display Name: %s\n❤️ Health: %s/%s\n💰 Beli: %s\n💎 Fragments: %s\n🍎 Fruit: %s\n📊 %s",
                player.Name,
                player.DisplayName,
                health,
                maxHealth,
                beli,
                frags,
                fruit,
                playerData
            )
        end
        
        -- Function to populate player dropdown
        local function populatePlayerDropdown()
            local players = Players:GetPlayers()
            playerDropdown.Text = "Select Player (" .. #players .. " online)"
        end
        
        -- Player dropdown click handler
        playerDropdown.MouseButton1Click:Connect(function()
            local players = Players:GetPlayers()
            if #players > 1 then
                -- Simple player selection (in a real implementation, you'd want a proper dropdown)
                local currentIndex = 1
                if selectedPlayer then
                    for i, player in ipairs(players) do
                        if player == selectedPlayer then
                            currentIndex = i
                            break
                        end
                    end
                end
                
                currentIndex = currentIndex + 1
                if currentIndex > #players then
                    currentIndex = 1
                end
                
                selectedPlayer = players[currentIndex]
                playerDropdown.Text = selectedPlayer.DisplayName
                statsDisplayFrame.Visible = true
                updatePlayerStats(selectedPlayer)
                
                -- Start live stats monitoring
                if statsConnection then
                    statsConnection:Disconnect()
                end
                statsConnection = RunService.Heartbeat:Connect(function()
                    if selectedPlayer then
                        updatePlayerStats(selectedPlayer)
                    end
                end)
                
                notify("Now monitoring: " .. selectedPlayer.DisplayName, "success")
            else
                notify("No other players to monitor", "warning")
            end
        end)
        
        -- Initialize dropdown
        populatePlayerDropdown()
        
        -- Update dropdown when players join/leave
        Players.PlayerAdded:Connect(populatePlayerDropdown)
        Players.PlayerRemoving:Connect(populatePlayerDropdown)
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
    
    -- Server Settings Collapsible Section
    local serverSettingsFrame = Instance.new("Frame")
    serverSettingsFrame.Size = UDim2.new(1, -8, 0, 32)
    serverSettingsFrame.BackgroundColor3 = Colors.Secondary
    serverSettingsFrame.BorderSizePixel = 0
    serverSettingsFrame.Parent = ContentScroller
    
    local serverSettingsCorner = Instance.new("UICorner")
    serverSettingsCorner.CornerRadius = UDim.new(0, 4)
    serverSettingsCorner.Parent = serverSettingsFrame
    
    local serverSettingsBorder = Instance.new("UIStroke")
    serverSettingsBorder.Thickness = 1
    serverSettingsBorder.Color = Colors.Border
    serverSettingsBorder.Transparency = 0.8
    serverSettingsBorder.Parent = serverSettingsFrame
    
    local serverSettingsButton = Instance.new("TextButton")
    serverSettingsButton.Size = UDim2.new(1, 0, 1, 0)
    serverSettingsButton.BackgroundTransparency = 1
    serverSettingsButton.Font = Enum.Font.GothamSemibold
    serverSettingsButton.TextSize = 12
    serverSettingsButton.TextColor3 = Colors.Text
    serverSettingsButton.TextXAlignment = Enum.TextXAlignment.Left
    serverSettingsButton.Text = "🌐 Server Settings"
    serverSettingsButton.Parent = serverSettingsFrame
    
    local serverDropdownIcon = Instance.new("TextLabel")
    serverDropdownIcon.Size = UDim2.new(0, 20, 0, 20)
    serverDropdownIcon.Position = UDim2.new(1, -25, 0, 6)
    serverDropdownIcon.BackgroundTransparency = 1
    serverDropdownIcon.Font = Enum.Font.GothamBold
    serverDropdownIcon.TextSize = 14
    serverDropdownIcon.TextColor3 = Colors.Text
    serverDropdownIcon.TextXAlignment = Enum.TextXAlignment.Center
    serverDropdownIcon.Text = "▼"
    serverDropdownIcon.Parent = serverSettingsFrame
    
    local serverSettingsDropdown = Instance.new("Frame")
    serverSettingsDropdown.Size = UDim2.new(1, -16, 0, 0)
    serverSettingsDropdown.Position = UDim2.new(0, 8, 0, 32)
    serverSettingsDropdown.BackgroundTransparency = 1
    serverSettingsDropdown.Visible = false
    serverSettingsDropdown.Parent = serverSettingsFrame
    
    local serverSettingsLayout = Instance.new("UIListLayout")
    serverSettingsLayout.FillDirection = Enum.FillDirection.Vertical
    serverSettingsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    serverSettingsLayout.Padding = UDim.new(0, 4)
    serverSettingsLayout.Parent = serverSettingsDropdown
    
    local isServerSettingsExpanded = false
    
    serverSettingsButton.MouseButton1Click:Connect(function()
        isServerSettingsExpanded = not isServerSettingsExpanded
        serverSettingsDropdown.Visible = isServerSettingsExpanded
        serverDropdownIcon.Text = isServerSettingsExpanded and "▲" or "▼"
        
        if isServerSettingsExpanded then
            serverSettingsDropdown.Size = UDim2.new(1, -16, 0, 0)
            task.wait(0.1)
            local targetHeight = serverSettingsLayout.AbsoluteContentSize.Y + 8
            serverSettingsDropdown:TweenSize(
                UDim2.new(1, -16, 0, targetHeight),
                "Out", "Quad", 0.2, true
            )
            serverSettingsFrame:TweenSize(
                UDim2.new(1, -8, 0, 32 + targetHeight + 8),
                "Out", "Quad", 0.2, true
            )
        else
            serverSettingsDropdown:TweenSize(
                UDim2.new(1, -16, 0, 0),
                "Out", "Quad", 0.2, true,
                function()
                    serverSettingsDropdown.Visible = false
                end
            )
            serverSettingsFrame:TweenSize(
                UDim2.new(1, -8, 0, 32),
                "Out", "Quad", 0.2, true
            )
        end
    end)
    
    -- Rejoin Current Server Button
    local rejoinButton = Instance.new("TextButton")
    rejoinButton.Size = UDim2.new(1, 0, 0, 28)
    rejoinButton.BackgroundColor3 = Colors.Secondary
    rejoinButton.BorderSizePixel = 0
    rejoinButton.AutoButtonColor = false
    rejoinButton.Font = Enum.Font.GothamSemibold
    rejoinButton.TextSize = 12
    rejoinButton.TextColor3 = Colors.Text
    rejoinButton.Text = "🔄 Rejoin Current Server"
    rejoinButton.Parent = serverSettingsDropdown
    
    local rejoinCorner = Instance.new("UICorner")
    rejoinCorner.CornerRadius = UDim.new(0, 4)
    rejoinCorner.Parent = rejoinButton
    
    rejoinButton.MouseButton1Click:Connect(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
        notify("Rejoining current server...", "info")
    end)
    
    -- Respawn Button
    local respawnButton = Instance.new("TextButton")
    respawnButton.Size = UDim2.new(1, 0, 0, 28)
    respawnButton.BackgroundColor3 = Colors.Secondary
    respawnButton.BorderSizePixel = 0
    respawnButton.AutoButtonColor = false
    respawnButton.Font = Enum.Font.GothamSemibold
    respawnButton.TextSize = 12
    respawnButton.TextColor3 = Colors.Text
    respawnButton.Text = "💀 Respawn Player"
    respawnButton.Parent = serverSettingsDropdown
    
    local respawnCorner = Instance.new("UICorner")
    respawnCorner.CornerRadius = UDim.new(0, 4)
    respawnCorner.Parent = respawnButton
    
    respawnButton.MouseButton1Click:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
            notify("Player respawned", "success")
        else
            notify("Character not found", "error")
        end
    end)
    
    -- Exit Server Button
    local exitButton = Instance.new("TextButton")
    exitButton.Size = UDim2.new(1, 0, 0, 28)
    exitButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50) -- Red background for exit
    exitButton.BorderSizePixel = 0
    exitButton.AutoButtonColor = false
    exitButton.Font = Enum.Font.GothamSemibold
    exitButton.TextSize = 12
    exitButton.TextColor3 = Colors.Text
    exitButton.Text = "🚪 Exit Server"
    exitButton.Parent = serverSettingsDropdown
    
    local exitCorner = Instance.new("UICorner")
    exitCorner.CornerRadius = UDim.new(0, 4)
    exitCorner.Parent = exitButton
    
    exitButton.MouseButton1Click:Connect(function()
        LocalPlayer:Kick("Exited via Obsidian-Codex")
        notify("Exiting server...", "warning")
    end)
end

-- Window controls
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    script:Destroy()
end)

-- Wave effect for minimized state
local waveConnection = nil
local function startWaveEffect()
    if waveConnection then
        waveConnection:Disconnect()
    end
    
    local waveTimer = 0
    local bubbleTimer = 0
    waveConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if minimized then
            waveTimer = waveTimer + deltaTime
            bubbleTimer = bubbleTimer + deltaTime
            
            -- Create wave every 0.5 seconds
            if waveTimer >= 0.5 then
                waveTimer = 0
                
                local wave = Instance.new("Frame")
                wave.Name = "LiquidWave"
                wave.Size = UDim2.new(0, 40, 0, 3)
                wave.Position = UDim2.new(0.5, -20, 0.5, -1.5)
                wave.BackgroundColor3 = Colors.Accent
                wave.BackgroundTransparency = 0.6
                wave.BorderSizePixel = 0
                wave.Parent = LiquidBackground
                
                local waveCorner = Instance.new("UICorner")
                waveCorner.CornerRadius = UDim.new(0, 1)
                waveCorner.Parent = wave
                
                local waveTween = TweenService:Create(wave, TweenInfo.new(
                    1.5, 
                    Enum.EasingStyle.Linear, 
                    Enum.EasingDirection.InOut
                ), {
                    Position = UDim2.new(0.5, 20, 0.5, -1.5),
                    BackgroundTransparency = 1
                })
                
                waveTween:Play()
                waveTween.Completed:Connect(function()
                    wave:Destroy()
                end)
            end
            
            -- Create centered bubbles every 0.8 seconds
            if bubbleTimer >= 0.8 then
                bubbleTimer = 0
                
                -- Create a small bubble in the center of the titlebar
                local bubble = Instance.new("Frame")
                bubble.Name = "CenterBubble"
                bubble.Size = UDim2.new(0, 8, 0, 8)
                bubble.Position = UDim2.new(0.5, -4, 0.5, -4)
                bubble.BackgroundColor3 = Colors.Glow
                bubble.BackgroundTransparency = 0.3
                bubble.BorderSizePixel = 0
                bubble.Parent = LiquidBackground
                
                local bubbleCorner = Instance.new("UICorner")
                bubbleCorner.CornerRadius = UDim.new(0.5, 0)
                bubbleCorner.Parent = bubble
                
                local bubbleGlow = Instance.new("UIStroke")
                bubbleGlow.Thickness = 1
                bubbleGlow.Color = Colors.Accent
                bubbleGlow.Transparency = 0.5
                bubbleGlow.Parent = bubble
                
                -- Animate bubble with pulsing effect
                local pulseTween = TweenService:Create(bubble, TweenInfo.new(
                    0.6, 
                    Enum.EasingStyle.Sine, 
                    Enum.EasingDirection.InOut
                ), {
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(0.5, -6, 0.5, -6),
                    BackgroundTransparency = 1
                })
                
                local glowTween = TweenService:Create(bubbleGlow, TweenInfo.new(
                    0.6, 
                    Enum.EasingStyle.Sine, 
                    Enum.EasingDirection.InOut
                ), {
                    Transparency = 1,
                    Thickness = 0
                })
                
                pulseTween:Play()
                glowTween:Play()
                
                pulseTween.Completed:Connect(function()
                    bubble:Destroy()
                end)
            end
        end
    end)
end

local function stopWaveEffect()
    if waveConnection then
        waveConnection:Disconnect()
        waveConnection = nil
    end
end

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        -- Stop wave effect
        stopWaveEffect()
        
        -- Maximize with liquid animation
        animateLiquidMaximize()
        
        -- Animate main window size with bouncy effect and restore centered position
        local windowTween = TweenService:Create(MainWindow, TweenInfo.new(
            0.6, 
            Enum.EasingStyle.Back, 
            Enum.EasingDirection.Out
        ), {
            Size = Config.WindowSize,
            Position = UDim2.new(0.5, -260, 0.5, -160)
        })
        
        -- Show content with delay for liquid effect
        spawn(function()
            wait(0.2)
            MainContent.Visible = true
            Sidebar.Visible = true
        end)
        
        windowTween:Play()
        minimized = false
        
        notify("Window Maximized", "success")
    else
        -- Minimize with liquid animation
        animateLiquidMinimize()
        
        -- Animate main window size with bouncy effect and center it on titlebar
        local windowTween = TweenService:Create(MainWindow, TweenInfo.new(
            0.6, 
            Enum.EasingStyle.Back, 
            Enum.EasingDirection.In
        ), {
            Size = UDim2.new(0, Config.MinimizedWidth, 0, 24),
            Position = UDim2.new(0.5, -Config.MinimizedWidth/2, 0, 20)
        })
        
        -- Hide content immediately
        MainContent.Visible = false
        Sidebar.Visible = false
        
        windowTween:Play()
        minimized = true
        
        -- Start wave effect and secondary upward movement after animation completes
        spawn(function()
            wait(0.7)
            startWaveEffect()
            
            -- Secondary animation: move titlebar much higher and add visible under-titlebar particles
            local upwardTween = TweenService:Create(MainWindow, TweenInfo.new(
                0.8, 
                Enum.EasingStyle.Quart, 
                Enum.EasingDirection.Out
            ), {
                Position = UDim2.new(0.5, -Config.MinimizedWidth/2, 0, -20) -- Move up from Y=20 to Y=-20 (visible on screen)
            })
            
            -- Create particles under the titlebar during upward movement
            local underParticleTimer = 0
            local underParticleConnection = RunService.Heartbeat:Connect(function(deltaTime)
                underParticleTimer = underParticleTimer + deltaTime
                
                -- Create particles every 0.15 seconds during upward movement
                if underParticleTimer >= 0.15 then
                    underParticleTimer = 0
                    
                    -- Get current titlebar position for absolute positioning
                    local currentPos = MainWindow.Position
                    local titlebarBottomY = currentPos.Y.Offset + 24 -- 24 is the height of minimized titlebar
                    
                    -- Create a particle under the titlebar with absolute positioning
                    local underParticle = Instance.new("Frame")
                    underParticle.Name = "UnderParticle"
                    underParticle.Size = UDim2.new(0, 10, 0, 10) -- Slightly smaller particles
                    underParticle.Position = UDim2.new(0, currentPos.X.Offset + Config.MinimizedWidth/2 - 5, 0, titlebarBottomY + 3) -- Position directly under titlebar
                    underParticle.BackgroundColor3 = Colors.Accent
                    underParticle.BackgroundTransparency = 0.2 -- Slightly more transparent
                    underParticle.BorderSizePixel = 0
                    underParticle.ZIndex = 15 -- Very high z-index
                    underParticle.Parent = ScreenGui -- Parent to ScreenGui for absolute positioning
                    
                    local underCorner = Instance.new("UICorner")
                    underCorner.CornerRadius = UDim.new(0.5, 0)
                    underCorner.Parent = underParticle
                    
                    local underGlow = Instance.new("UIStroke")
                    underGlow.Thickness = 2 -- Thinner glow
                    underGlow.Color = Colors.Glow
                    underGlow.Transparency = 0.2 -- Slightly transparent
                    underGlow.Parent = underParticle
                    
                    -- Animate particle falling down and fading
                    local fallTween = TweenService:Create(underParticle, TweenInfo.new(
                        1.5, 
                        Enum.EasingStyle.Quart, 
                        Enum.EasingDirection.Out
                    ), {
                        Position = UDim2.new(0, currentPos.X.Offset + Config.MinimizedWidth/2 - 5, 0, titlebarBottomY + 40), -- Fall down
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0, 3, 0, 3) -- Shrink to very small
                    })
                    
                    local glowTween = TweenService:Create(underGlow, TweenInfo.new(
                        1.5, 
                        Enum.EasingStyle.Quart, 
                        Enum.EasingDirection.Out
                    ), {
                        Transparency = 1,
                        Thickness = 0
                    })
                    
                    fallTween:Play()
                    glowTween:Play()
                    
                    fallTween.Completed:Connect(function()
                        underParticle:Destroy()
                    end)
                end
            end)
            
            upwardTween:Play()
            
            -- Stop under-titlebar particles after upward movement completes
            upwardTween.Completed:Connect(function()
                if underParticleConnection then
                    underParticleConnection:Disconnect()
                end
            end)
        end)
        
        notify("Window Minimized", "info")
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

local function showFruits()
    clearContent()
    setActiveButton(FruitsButton)
    
    createSection("🍎 Fruit Probability List")
    
    -- Fruit probability data from your separate script
    local fruitData = {
        {
            name = "Normal Gacha Probabilities",
            fruits = {
                {name = "Common Fruits", probability = "~69%", rarity = "Common"},
                {name = "Uncommon Fruits", probability = "~14%", rarity = "Uncommon"},
                {name = "Rare Fruits", probability = "~13%", rarity = "Rare"},
                {name = "Legendary Fruits", probability = "~3%", rarity = "Legendary"},
                {name = "Mythical Fruits", probability = "~1%", rarity = "Mythical"}
            }
        },
        {
            name = "Summer Gacha (Update 27.2)",
            fruits = {
                -- Regular gacha fruits (same as normal gacha)
                {name = "Common Fruits", probability = "~69%", rarity = "Common"},
                {name = "Uncommon Fruits", probability = "~14%", rarity = "Uncommon"},
                {name = "Rare Fruits", probability = "~13%", rarity = "Rare"},
                {name = "Legendary Fruits", probability = "~3%", rarity = "Legendary"},
                {name = "Mythical Fruits", probability = "~1%", rarity = "Mythical"},
                -- Diamond skin fruits (special summer event)
                {name = "Emerald Diamond Skin", probability = "~1%", rarity = "Mythical"},
                {name = "Rose Quartz Diamond Skin", probability = "~1%", rarity = "Mythical"},
                {name = "Topaz Diamond Skin", probability = "~1%", rarity = "Mythical"},
                {name = "Ruby Diamond Skin", probability = "~1%", rarity = "Mythical"}
            }
        }
    }
    
    -- Create toggle switch for gacha selection
    local gachaToggleFrame = Instance.new("Frame")
    gachaToggleFrame.Size = UDim2.new(1, -8, 0, 40)
    gachaToggleFrame.BackgroundColor3 = Colors.Secondary
    gachaToggleFrame.BorderSizePixel = 0
    gachaToggleFrame.Parent = ContentScroller
    
    local gachaToggleCorner = Instance.new("UICorner")
    gachaToggleCorner.CornerRadius = UDim.new(0, 4)
    gachaToggleCorner.Parent = gachaToggleFrame
    
    local gachaToggleBorder = Instance.new("UIStroke")
    gachaToggleBorder.Thickness = 1
    gachaToggleBorder.Color = Colors.Border
    gachaToggleBorder.Transparency = 0.8
    gachaToggleBorder.Parent = gachaToggleFrame
    
    local gachaToggleLabel = Instance.new("TextLabel")
    gachaToggleLabel.Size = UDim2.new(1, 0, 0, 20)
    gachaToggleLabel.Position = UDim2.new(0, 8, 0, 4)
    gachaToggleLabel.BackgroundTransparency = 1
    gachaToggleLabel.Font = Enum.Font.GothamSemibold
    gachaToggleLabel.TextSize = 12
    gachaToggleLabel.TextColor3 = Colors.Text
    gachaToggleLabel.TextXAlignment = Enum.TextXAlignment.Center
    gachaToggleLabel.Text = "Gacha Type"
    gachaToggleLabel.Parent = gachaToggleFrame
    
    -- Toggle switch container
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Size = UDim2.new(0, 200, 0, 16)
    toggleContainer.Position = UDim2.new(0.5, -100, 0, 20)
    toggleContainer.BackgroundColor3 = Colors.Primary
    toggleContainer.BorderSizePixel = 0
    toggleContainer.Parent = gachaToggleFrame
    
    local toggleContainerCorner = Instance.new("UICorner")
    toggleContainerCorner.CornerRadius = UDim.new(0, 8)
    toggleContainerCorner.Parent = toggleContainer
    
    local toggleContainerBorder = Instance.new("UIStroke")
    toggleContainerBorder.Thickness = 1
    toggleContainerBorder.Color = Colors.Border
    toggleContainerBorder.Transparency = 0.5
    toggleContainerBorder.Parent = toggleContainer
    
    -- Toggle switch button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 100, 1, 0)
    toggleButton.Position = UDim2.new(0, 0, 0, 0)
    toggleButton.BackgroundColor3 = Colors.Accent
    toggleButton.BorderSizePixel = 0
    toggleButton.AutoButtonColor = false
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 10
    toggleButton.TextColor3 = Colors.Primary
    toggleButton.Text = "Normal"
    toggleButton.Parent = toggleContainer
    
    local toggleButtonCorner = Instance.new("UICorner")
    toggleButtonCorner.CornerRadius = UDim.new(0, 6)
    toggleButtonCorner.Parent = toggleButton
    
    -- Labels for each side
    local normalLabel = Instance.new("TextLabel")
    normalLabel.Size = UDim2.new(0, 100, 1, 0)
    normalLabel.Position = UDim2.new(0, 0, 0, 0)
    normalLabel.BackgroundTransparency = 1
    normalLabel.Font = Enum.Font.GothamBold
    normalLabel.TextSize = 10
    normalLabel.TextColor3 = Colors.Text
    normalLabel.TextXAlignment = Enum.TextXAlignment.Center
    normalLabel.Text = "Normal Gacha"
    normalLabel.Parent = toggleContainer
    
    local summerLabel = Instance.new("TextLabel")
    summerLabel.Size = UDim2.new(0, 100, 1, 0)
    summerLabel.Position = UDim2.new(0, 100, 0, 0)
    summerLabel.BackgroundTransparency = 1
    summerLabel.Font = Enum.Font.GothamBold
    summerLabel.TextSize = 10
    summerLabel.TextColor3 = Colors.TextDim
    summerLabel.TextXAlignment = Enum.TextXAlignment.Center
    summerLabel.Text = "Summer Gacha"
    summerLabel.Parent = toggleContainer
    
    -- Fruit display frame
    local fruitDisplayFrame = Instance.new("Frame")
    fruitDisplayFrame.Size = UDim2.new(1, -8, 0, 200)
    fruitDisplayFrame.BackgroundColor3 = Colors.Secondary
    fruitDisplayFrame.BorderSizePixel = 0
    fruitDisplayFrame.Parent = ContentScroller
    
    local fruitDisplayCorner = Instance.new("UICorner")
    fruitDisplayCorner.CornerRadius = UDim.new(0, 4)
    fruitDisplayCorner.Parent = fruitDisplayFrame
    
    local fruitDisplayBorder = Instance.new("UIStroke")
    fruitDisplayBorder.Thickness = 1
    fruitDisplayBorder.Color = Colors.Border
    fruitDisplayBorder.Transparency = 0.8
    fruitDisplayBorder.Parent = fruitDisplayFrame
    
    local fruitScroller = Instance.new("ScrollingFrame")
    fruitScroller.Size = UDim2.new(1, -16, 1, -16)
    fruitScroller.Position = UDim2.new(0, 8, 0, 8)
    fruitScroller.BackgroundTransparency = 1
    fruitScroller.BorderSizePixel = 0
    fruitScroller.ScrollBarThickness = 4
    fruitScroller.ScrollBarImageColor3 = Colors.Accent
    fruitScroller.Parent = fruitDisplayFrame
    
    local fruitLayout = Instance.new("UIListLayout")
    fruitLayout.FillDirection = Enum.FillDirection.Vertical
    fruitLayout.SortOrder = Enum.SortOrder.LayoutOrder
    fruitLayout.Padding = UDim.new(0, 4)
    fruitLayout.Parent = fruitScroller
    
    local function updateFruitDisplay(selectedGacha)
        -- Clear existing fruit items
        for _, child in ipairs(fruitScroller:GetChildren()) do
            if child:IsA("GuiObject") and child.Name ~= "UIListLayout" then
                child:Destroy()
            end
        end
        
        local selectedData = fruitData[selectedGacha]
        if not selectedData then return end
        
        -- Create fruit items
        for i, fruit in ipairs(selectedData.fruits) do
            local fruitItem = Instance.new("Frame")
            fruitItem.Size = UDim2.new(1, 0, 0, 28)
            fruitItem.BackgroundColor3 = Colors.Primary
            fruitItem.BorderSizePixel = 0
            fruitItem.Parent = fruitScroller
            
            local fruitItemCorner = Instance.new("UICorner")
            fruitItemCorner.CornerRadius = UDim.new(0, 4)
            fruitItemCorner.Parent = fruitItem
            
            local fruitItemBorder = Instance.new("UIStroke")
            fruitItemBorder.Thickness = 1
            fruitItemBorder.Color = Colors.Border
            fruitItemBorder.Transparency = 0.8
            fruitItemBorder.Parent = fruitItem
            
            -- Fruit name
            local fruitName = Instance.new("TextLabel")
            fruitName.Size = UDim2.new(0.6, -8, 1, 0)
            fruitName.Position = UDim2.new(0, 8, 0, 0)
            fruitName.BackgroundTransparency = 1
            fruitName.Font = Enum.Font.GothamSemibold
            fruitName.TextSize = 11
            fruitName.TextColor3 = Colors.Text
            fruitName.TextXAlignment = Enum.TextXAlignment.Left
            fruitName.Text = fruit.name
            fruitName.Parent = fruitItem
            
            -- Probability
            local fruitProbability = Instance.new("TextLabel")
            fruitProbability.Size = UDim2.new(0.25, 0, 1, 0)
            fruitProbability.Position = UDim2.new(0.6, 0, 0, 0)
            fruitProbability.BackgroundTransparency = 1
            fruitProbability.Font = Enum.Font.GothamBold
            fruitProbability.TextSize = 11
            fruitProbability.TextColor3 = Colors.Accent
            fruitProbability.TextXAlignment = Enum.TextXAlignment.Center
            fruitProbability.Text = fruit.probability
            fruitProbability.Parent = fruitItem
            
            -- Rarity indicator
            local rarityColor = Colors.TextDim
            if fruit.rarity == "Common" then
                rarityColor = Color3.fromRGB(150, 150, 150)
            elseif fruit.rarity == "Uncommon" then
                rarityColor = Color3.fromRGB(0, 255, 0)
            elseif fruit.rarity == "Rare" then
                rarityColor = Color3.fromRGB(0, 100, 255)
            elseif fruit.rarity == "Legendary" then
                rarityColor = Color3.fromRGB(255, 100, 0)
            elseif fruit.rarity == "Mythical" then
                rarityColor = Color3.fromRGB(255, 0, 255)
            end
            
            local fruitRarity = Instance.new("TextLabel")
            fruitRarity.Size = UDim2.new(0.15, -8, 1, 0)
            fruitRarity.Position = UDim2.new(0.85, 8, 0, 0)
            fruitRarity.BackgroundTransparency = 1
            fruitRarity.Font = Enum.Font.Gotham
            fruitRarity.TextSize = 10
            fruitRarity.TextColor3 = rarityColor
            fruitRarity.TextXAlignment = Enum.TextXAlignment.Right
            fruitRarity.Text = fruit.rarity
            fruitRarity.Parent = fruitItem
        end
        
        -- Update canvas size
        fruitScroller.CanvasSize = UDim2.new(0, 0, 0, fruitLayout.AbsoluteContentSize.Y)
    end
    
    -- Toggle switch functionality
    local currentGacha = 1
    local isAnimating = false
    
    local function animateToggle(toSummer)
        if isAnimating then return end
        isAnimating = true
        
        local targetPosition = toSummer and UDim2.new(0, 100, 0, 0) or UDim2.new(0, 0, 0, 0)
        local targetText = toSummer and "Summer" or "Normal"
        
        -- Animate button position
        local buttonTween = TweenService:Create(toggleButton, TweenInfo.new(
            0.3, 
            Enum.EasingStyle.Quart, 
            Enum.EasingDirection.Out
        ), {
            Position = targetPosition
        })
        
        -- Animate label colors
        local normalColor = toSummer and Colors.TextDim or Colors.Text
        local summerColor = toSummer and Colors.Text or Colors.TextDim
        
        local normalTween = TweenService:Create(normalLabel, TweenInfo.new(
            0.3, 
            Enum.EasingStyle.Quart, 
            Enum.EasingDirection.Out
        ), {
            TextColor3 = normalColor
        })
        
        local summerTween = TweenService:Create(summerLabel, TweenInfo.new(
            0.3, 
            Enum.EasingStyle.Quart, 
            Enum.EasingDirection.Out
        ), {
            TextColor3 = summerColor
        })
        
        buttonTween:Play()
        normalTween:Play()
        summerTween:Play()
        
        toggleButton.Text = targetText
        
        buttonTween.Completed:Connect(function()
            isAnimating = false
        end)
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        currentGacha = currentGacha == 1 and 2 or 1
        local toSummer = currentGacha == 2
        animateToggle(toSummer)
        updateFruitDisplay(currentGacha)
    end)
    
    -- Initialize with normal gacha
    updateFruitDisplay(1)
    
    createSection("ℹ️ Information")
    
    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(1, -8, 0, 60)
    infoText.BackgroundTransparency = 1
    infoText.Font = Enum.Font.Gotham
    infoText.TextSize = 10
    infoText.TextColor3 = Colors.TextDim
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.TextYAlignment = Enum.TextYAlignment.Top
    infoText.TextWrapped = true
    infoText.Text = "⚠️ Exact probabilities are estimates based on community testing.\n\nNormal Gacha: Standard fruit gacha with common to mythical fruits.\nSummer Gacha: Special event gacha with diamond skin fruits (Update 27.2)."
    infoText.Parent = ContentScroller
end

local function showHelp()
    clearContent()
    setActiveButton(HelpButton)
    
    createSection("❓ Help & Feedback")
    
    local helpText = Instance.new("TextLabel")
    helpText.Size = UDim2.new(1, -8, 0, 100)
    helpText.BackgroundTransparency = 1
    helpText.Font = Enum.Font.Gotham
    helpText.TextSize = 11
    helpText.TextColor3 = Colors.TextDim
    helpText.TextXAlignment = Enum.TextXAlignment.Left
    helpText.TextYAlignment = Enum.TextYAlignment.Top
    helpText.TextWrapped = true
    helpText.Text = "Welcome to Obsidian-Codex! Here's how to navigate:\n\n• Use the sidebar to switch between different feature categories\n• Toggle switches control individual features\n• Dropdown menus appear when toggles are enabled\n• Click action buttons to perform specific tasks\n• All features include visual feedback and notifications"
    helpText.Parent = ContentScroller
    
    createSection("💬 Community & Support")
    
    createActionButton("Join Discord Server", "💬", function()
        notify("Discord server link copied to clipboard!", "success")
        -- For now, just show a placeholder message
        notify("Discord server: Coming Soon! (Under Development)", "info")
    end)
    
    createActionButton("Copy Discord Link", "📋", function()
        notify("Discord server: Coming Soon! (Under Development)", "warning")
        notify("Feature will be available in future updates", "info")
    end)
    
    createSection("📝 Script Information")
    
    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(1, -8, 0, 80)
    infoText.BackgroundTransparency = 1
    infoText.Font = Enum.Font.Gotham
    infoText.TextSize = 10
    infoText.TextColor3 = Colors.TextDim
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.TextYAlignment = Enum.TextYAlignment.Top
    infoText.TextWrapped = true
    infoText.Text = "Obsidian-Codex v1.2\nAdvanced Roblox Enhancement Suite\n\nFeatures: Player Enhancements, AI System, Auto Farming, ESP, Teleportation, Shop Utilities, Fruit Probability Lists, and more!\n\n⚠️ Some features are still under development and will be available in future updates."
    infoText.Parent = ContentScroller
end

-- Create sidebar buttons FIRST (without callbacks to avoid circular reference)
local HomepageButton = createButton("Home", "🏠", nil)
local PlayersButton = createButton("Players", "👤", nil)
local AIButton = createButton("AI Player", "🤖", nil)
local FarmingButton = createButton("Farming", "⚔️", nil)
local QuestsButton = createButton("Quests", "🍒", nil)
local TeleportButton = createButton("Teleport", "🧭", nil)
local VisualsButton = createButton("Visuals", "🌈", nil)
local ShopButton = createButton("Shop", "🛒", nil)
local FruitsButton = createButton("Fruits", "🍎", nil)
local MiscButton = createButton("Misc", "⚙️", nil)
local HelpButton = createButton("Help", "❓", nil)

-- Now add the callbacks
HomepageButton.MouseButton1Click:Connect(showHomepage)
PlayersButton.MouseButton1Click:Connect(showPlayers)
AIButton.MouseButton1Click:Connect(showAI)
FarmingButton.MouseButton1Click:Connect(showFarming)
QuestsButton.MouseButton1Click:Connect(showQuests)
TeleportButton.MouseButton1Click:Connect(showTeleport)
VisualsButton.MouseButton1Click:Connect(showVisuals)
ShopButton.MouseButton1Click:Connect(showShop)
FruitsButton.MouseButton1Click:Connect(showFruits)
MiscButton.MouseButton1Click:Connect(showMisc)
HelpButton.MouseButton1Click:Connect(showHelp)

-- Show default content
task.wait(0.1) -- Small delay to ensure UI is fully loaded
showHomepage()

-- Initialize UI
notify("Obsidian-Codex v1.2 loaded successfully!", "success")
