local function banPlayer(playerName)
    local player = game.Players:FindFirstChild(playerName)
    if player then
        player:Kick("You have been banned!")
        print(player.Name .. " has been banned!")
    else
        print("Player not found: " .. playerName)
    end
end

local function kickPlayer(playerName)
    local player = game.Players:FindFirstChild(playerName)
    if player then
        player:Kick("You have been kicked!")
        print(player.Name .. " has been kicked!")
    else
        print("Player not found: " .. playerName)
    end
end

local function flyPlayer(player)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
        print(player.Name .. " is now flying!")
    end
end

local function unflyPlayer(player)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = false
        print(player.Name .. " has stopped flying!")
    end
end

local function setPlayerSpeed(player, speed)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
        print(player.Name .. " speed set to " .. speed)
    end
end

local function setPlayerJumpPower(player, jumpPower)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = jumpPower
        print(player.Name .. " jump power set to " .. jumpPower)
    end
end

local function setPlayerSize(player, size)
    local character = player.Character
    if character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Size = part.Size * size
                part.Anchored = true
                wait()
                part.Anchored = false
            elseif part:IsA("Humanoid") then
                part.BodyDepthScale.Value = size
                part.BodyHeightScale.Value = size
                part.BodyWidthScale.Value = size
            end
        end
        print(player.Name .. " size set to " .. size)
    end
end

local function createBanMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("ScrollingFrame")
    local TextLabel = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")

    ScreenGui.Name = "BanMenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 200, 0, 300)
    Frame.Position = UDim2.new(0.5, -100, 0.5, -150)
    Frame.CanvasSize = UDim2.new(0, 0, 2, 0)
    Frame.ScrollBarThickness = 8
    Frame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    Frame.ScrollBarImageTransparency = 0.5

    TextLabel.Parent = Frame
    TextLabel.Text = "Ban Menu"
    TextLabel.Size = UDim2.new(1, 0, 0, 50)
    TextLabel.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
    TextLabel.BorderSizePixel = 0
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.SourceSansBold

    CloseButton.Parent = Frame
    CloseButton.Text = "X"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    CloseButton.BorderSizePixel = 0
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local players = game.Players:GetPlayers()
    for i, player in ipairs(players) do
        local button = Instance.new("TextButton")
        button.Parent = Frame
        button.Text = "Ban " .. player.Name
        button.Size = UDim2.new(1, -10, 0, 40)
        button.Position = UDim2.new(0, 5, 0, 60 + (i-1) * 50)
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.BorderSizePixel = 0
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.Font = Enum.Font.SourceSans
        button.MouseButton1Click:Connect(function()
            banPlayer(player.Name)
        end)
    end
end

local function createMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("ScrollingFrame")
    local TextLabel = Instance.new("TextLabel")
    local PlayerTextBox = Instance.new("TextBox")
    local SpeedTextBox = Instance.new("TextBox")
    local JumpTextBox = Instance.new("TextBox")
    local SizeTextBox = Instance.new("TextBox")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local FlyButton = Instance.new("TextButton")
    local UnflyButton = Instance.new("TextButton")
    local BanButton = Instance.new("TextButton")
    local KickButton = Instance.new("TextButton")
    local SpeedButton = Instance.new("TextButton")
    local JumpPowerButton = Instance.new("TextButton")
    local SizeButton = Instance.new("TextButton")

    ScreenGui.Name = "MenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 300, 0, 450)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -225)
    Frame.CanvasSize = UDim2.new(0, 0, 2, 0)
    Frame.ScrollBarThickness = 8
    Frame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    Frame.ScrollBarImageTransparency = 0.5

    TextLabel.Parent = Frame
    TextLabel.Text = "Main Menu"
    TextLabel.Size = UDim2.new(1, 0, 0, 50)
    TextLabel.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
    TextLabel.BorderSizePixel = 0
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.SourceSansBold

    PlayerTextBox.Parent = Frame
    PlayerTextBox.PlaceholderText = "Enter Player Name"
    PlayerTextBox.Size = UDim2.new(1, -20, 0, 40)
    PlayerTextBox.Position = UDim2.new(0, 10, 0, 60)
    PlayerTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    PlayerTextBox.BorderSizePixel = 0
    PlayerTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerTextBox.TextScaled = true
    PlayerTextBox.Font = Enum.Font.SourceSans

    SpeedTextBox.Parent = Frame
    SpeedTextBox.PlaceholderText = "Enter Speed Value"
    SpeedTextBox.Size = UDim2.new(1, -20, 0, 40)
    SpeedTextBox.Position = UDim2.new(0, 10, 0, 110)
    SpeedTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SpeedTextBox.BorderSizePixel = 0
    SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedTextBox.TextScaled = true
    SpeedTextBox.Font = Enum.Font.SourceSans

    JumpTextBox.Parent = Frame
    JumpTextBox.PlaceholderText = "Enter Jump Power Value"
    JumpTextBox.Size = UDim2.new(1, -20, 0, 40)
    JumpTextBox.Position = UDim2.new(0, 10, 0, 160)
    JumpTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    JumpTextBox.BorderSizePixel = 0
    JumpTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpTextBox.TextScaled = true
    JumpTextBox.Font =
