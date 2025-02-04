local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local function ShowBadgePopup(iconId)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:FindFirstChildOfClass("PlayerGui")
    screenGui.ResetOnSpawn = false

    -- Badge Frame (Starts Offscreen)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 60)
    frame.Position = UDim2.new(1, 0, 0.6, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Outline (Matches Progress Bar Color)
    local outline = Instance.new("Frame")
    outline.Size = UDim2.new(1, -1, 1, -1)
    outline.Position = UDim2.new(0, 0.5, 0, 0.5)
    outline.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    outline.BorderSizePixel = 0
    outline.Parent = frame

    -- Inner Frame (Slightly Extends Past Outline)
    local innerFrame = Instance.new("Frame")
    innerFrame.Size = UDim2.new(1, -2, 1, -2)
    innerFrame.Position = UDim2.new(0, 1, 0, 1)
    innerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    innerFrame.BorderSizePixel = 0
    innerFrame.Parent = outline
    
    -- Badge Icon
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 36, 0, 36)
    icon.Position = UDim2.new(0, 10, 0.5, -18)
    icon.Image = "rbxassetid://" .. iconId
    icon.BackgroundTransparency = 1
    icon.Parent = innerFrame

    -- Title Label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -60, 0, 18)
    titleLabel.Position = UDim2.new(0, 50, 0.2, 0)
    titleLabel.Text = "Loading PS99 Hub"
    titleLabel.TextSize = 15
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = innerFrame

    -- Subtitle Label (Animated Dots)
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Size = UDim2.new(1, -60, 0, 14)
    subtitleLabel.Position = UDim2.new(0, 50, 0.55, -6)
    subtitleLabel.Text = "Hurry up already."
    subtitleLabel.TextSize = 11
    subtitleLabel.Font = Enum.Font.SourceSans
    subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    subtitleLabel.Parent = innerFrame

    -- Progress Bar
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 0.08, 0)
    progressBar.Position = UDim2.new(0, 3, 1, -7)
    progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = innerFrame

    -- Animate Subtitle Dots
    local dotStages = {"Hurry up already.", "Hurry up already..", "Hurry up already...", "Hurry up already."}
    local dotIndex = 1

    local function animateDots()
        while screenGui.Parent do
            subtitleLabel.Text = dotStages[dotIndex]
            dotIndex = dotIndex % #dotStages + 1
            task.wait(0.5)
        end
    end

    -- Start Dot Animation
    task.spawn(animateDots)

    -- Slide in animation
    local showTween = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -220, 0.6, 0)})
    showTween:Play()

    -- Progress bar animation
    local barTween = TweenService:Create(progressBar, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, -6, 0.08, 0)})
    barTween:Play()

    task.wait(5)

    -- Slide out animation
    local hideTween = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0.6, 0)})
    hideTween:Play()

    hideTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

-- Example Usage
task.wait(2)
ShowBadgePopup("12345678") -- Replace with actual image ID)
