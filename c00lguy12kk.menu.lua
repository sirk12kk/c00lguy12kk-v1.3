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
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
        print(player.Name .. " is now flying!")
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
            end
        end
        print(player.Name .. " size set to " .. size)
    end
end

local function createMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local PlayerTextBox = Instance.new("TextBox")
    local SpeedTextBox = Instance.new("TextBox")
    local JumpTextBox = Instance.new("TextBox")
    local FlyTextBox = Instance.new("TextBox")
    local SizeTextBox = Instance.new("TextBox")
    local buttons = {}

    ScreenGui.Name = "MenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.Size = UDim2.new(0, 300, 0, 450)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -225)

    TextLabel.Parent = Frame
    TextLabel.Text = "Main Menu"
    TextLabel.Size = UDim2.new(1, 0, 0, 50)
    TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true

    PlayerTextBox.Parent = Frame
    PlayerTextBox.PlaceholderText = "Enter Player Name"
    PlayerTextBox.Size = UDim2.new(1, 0, 0, 40)
    PlayerTextBox.Position = UDim2.new(0, 0, 0, 60)
    PlayerTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    PlayerTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerTextBox.TextScaled = true

    SpeedTextBox.Parent = Frame
    SpeedTextBox.PlaceholderText = "Enter Speed Value"
    SpeedTextBox.Size = UDim2.new(1, 0, 0, 40)
    SpeedTextBox.Position = UDim2.new(0, 0, 0, 110)
    SpeedTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedTextBox.TextScaled = true

    JumpTextBox.Parent = Frame
    JumpTextBox.PlaceholderText = "Enter Jump Power Value"
    JumpTextBox.Size = UDim2.new(1, 0, 0, 40)
    JumpTextBox.Position = UDim2.new(0, 0, 0, 160)
    JumpTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    JumpTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpTextBox.TextScaled = true

    SizeTextBox.Parent = Frame
    SizeTextBox.PlaceholderText = "Enter Size Multiplier"
    SizeTextBox.Size = UDim2.new(1, 0, 0, 40)
    SizeTextBox.Position = UDim2.new(0, 0, 0, 210)
    SizeTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SizeTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SizeTextBox.TextScaled = true

    local function createButton(name, position, callback)
        local button = Instance.new("TextButton")
        button.Parent = Frame
        button.Text = name
        button.Size = UDim2.new(1, 0, 0, 40)
        button.Position = UDim2.new(0, 0, 0, position)
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.MouseButton1Click:Connect(callback)
        table.insert(buttons, button)
    end

    createButton("Ban Player", 260, function()
        banPlayer(PlayerTextBox.Text)
    end)

    createButton("Kick Player", 310, function()
        kickPlayer(PlayerTextBox.Text)
    end)

    createButton("Fly", 360, function()
        local player = game.Players:FindFirstChild(PlayerTextBox.Text)
        if player then
            flyPlayer(player)
        else
            print("Player not found: " .. PlayerTextBox.Text)
        end
    end)

    createButton("Set Speed", 410, function()
        local player = game.Players:FindFirstChild(PlayerTextBox.Text)
        local speed = tonumber(SpeedTextBox.Text)
        if player and speed then
            setPlayerSpeed(player, speed)
        else
            print("Player or speed value not valid")
        end
    end)

    createButton("Set Jump Power", 460, function()
        local player = game.Players:FindFirstChild(PlayerTextBox.Text)
        local jumpPower = tonumber(JumpTextBox.Text)
        if player and jumpPower then
            setPlayerJumpPower(player, jumpPower)
        else
            print("Player or jump power value not valid")
        end
    end)

    createButton("Set Size", 510, function()
        local player = game.Players:FindFirstChild(PlayerTextBox.Text)
        local size = tonumber(SizeTextBox.Text)
        if player and size then
            setPlayerSize(player, size)
        else
            print("Player or size value not valid")
        end
    end)
end

createMenu()
