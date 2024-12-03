-- Load necessary services
local Players = game:GetService("Players")

-- Function to ban a player
local function banPlayer(playerName)
    local player = Players:FindFirstChild(playerName)
    if player then
        player:Kick("You have been banned from the game.")
        print(playerName .. " has been banned.")
    else
        print("Player not found.")
    end
end

-- Function to kick a player
local function kickPlayer(playerName)
    local player = Players:FindFirstChild(playerName)
    if player then
        player:Kick("You have been kicked from the game.")
        print(playerName .. " has been kicked.")
    else
        print("Player not found.")
    end
end

-- Function to enable flying for a player
local function flyPlayer(player)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
        print(player.Name .. " is now flying.")
    else
        print("Humanoid not found for player: " .. player.Name)
    end
end

-- Function to disable flying for a player
local function unflyPlayer(player)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = false
        print(player.Name .. " has stopped flying.")
    else
        print("Humanoid not found for player: " .. player.Name)
    end
end

-- Function to set player speed
local function setPlayerSpeed(player, speed)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
        print(player.Name .. " speed set to " .. speed)
    else
        print("Humanoid not found for player: " .. player.Name)
    end
end

-- Function to set player jump power
local function setPlayerJumpPower(player, jumpPower)
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = jumpPower
        print(player.Name .. " jump power set to " .. jumpPower)
    else
        print("Humanoid not found for player: " .. player.Name)
    end
end

-- Function to set player size
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
    else
        print("Character not found for player: " .. player.Name)
    end
end

-- Create Menu
local function createMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("ScrollingFrame")
    local TextLabel = Instance.new("TextLabel")
    local PlayerTextBox = Instance.new("TextBox")
    local SpeedTextBox = Instance.new("TextBox")
    local JumpTextBox = Instance.new("TextBox")
    local SizeTextBox = Instance.new("TextBox")
    local ScriptUrlTextBox = Instance.new("TextBox")
    local ExecuteScriptButton = Instance.new("TextButton")
    local FlyButton = Instance.new("TextButton")
    local UnflyButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")

    ScreenGui.Name = "MenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 300, 0, 500)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -250)
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
    JumpTextBox.Font = Enum.Font.SourceSans

    SizeTextBox.Parent = Frame
    SizeTextBox.PlaceholderText = "Enter Size Value"
    SizeTextBox.Size = UDim2.new(1, -20, 0, 40)
    SizeTextBox.Position = UDim2.new(0, 10, 0, 210)
    SizeTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SizeTextBox.BorderSizePixel = 0
    SizeTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SizeTextBox.TextScaled = true
    SizeTextBox.Font = Enum.Font.SourceSans

    ScriptUrlTextBox.Parent = Frame
    ScriptUrlTextBox.PlaceholderText = "Enter Script URL"
    ScriptUrlTextBox.Size = UDim2.new(1, -20, 0, 60)
    ScriptUrlTextBox.Position = UDim2.new(0, 10, 0, 260)
    ScriptUrlTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    ScriptUrlTextBox.BorderSizePixel = 0
    ScriptUrlTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptUrlTextBox.TextScaled = true
    ScriptUrlTextBox.Font = Enum.Font.SourceSans
    ScriptUrlTextBox.MultiLine = true

    ExecuteScriptButton.Parent = Frame
    ExecuteScriptButton.Text = "Execute Script"
    ExecuteScriptButton.Size = UDim2.new(1, -20, 0, 40)
    ExecuteScriptButton.Position = UDim2.new(0, 10, 0, 330)
    ExecuteScriptButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    ExecuteScriptButton.BorderSizePixel = 0
    ExecuteScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecuteScriptButton.TextScaled = true
    ExecuteScriptButton.Font = Enum.Font.SourceSans
    ExecuteScriptButton.MouseButton1Click:Connect(function()
        local url = ScriptUrlTextBox.Text
        local success, script = pcall(function()
            return game:HttpGet(url)
        end)
        if success then
            local func, err = loadstring(script)
            if func then
                local exec_success, exec_err = pcall(func)
                if exec_success then
                    print("Script executed successfully.")
                else
                    print("Error during script execution: " .. exec
