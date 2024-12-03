local function banPlayer(player)
    player:Kick("You have been banned!")
    print(player.Name .. " has been banned!")
end

local function kickPlayer(player)
    player:Kick("You have been kicked!")
    print(player.Name .. " has been kicked!")
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

local function createBanMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local buttons = {}

    ScreenGui.Name = "BanMenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.Size = UDim2.new(0, 200, 0, 300)
    Frame.Position = UDim2.new(0.5, -100, 0.5, -150)

    TextLabel.Parent = Frame
    TextLabel.Text = "Ban Menu"
    TextLabel.Size = UDim2.new(1, 0, 0, 50)
    TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true

    CloseButton.Parent = Frame
    CloseButton.Text = "X"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local players = game.Players:GetPlayers()
    for i, player in ipairs(players) do
        local button = Instance.new("TextButton")
        button.Parent = Frame
        button.Text = "Ban " .. player.Name
        button.Size = UDim2.new(1, 0, 0, 40)
        button.Position = UDim2.new(0, 0, 0, 60 + (i-1) * 50)
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.MouseButton1Click:Connect(function()
            banPlayer(player)
        end)
        table.insert(buttons, button)
    end
end

local function createMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local buttons = {}

    ScreenGui.Name = "MenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.Size = UDim2.new(0, 300, 0, 350)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -175)

    TextLabel.Parent = Frame
    TextLabel.Text = "Main Menu"
    TextLabel.Size = UDim2.new(1, 0, 0, 50)
    TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true

    MinimizeButton.Parent = Frame
    MinimizeButton.Text = "_"
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.TextScaled = true

    CloseButton.Parent = Frame
    CloseButton.Text = "X"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true

    MinimizeButton.MouseButton1Click:Connect(function()
        Frame.Visible = false
        local MaximizeButton = Instance.new("TextButton")
        MaximizeButton.Parent = ScreenGui
        MaximizeButton.Text = "Expand"
        MaximizeButton.Size = UDim2.new(0, 100, 0, 50)
        MaximizeButton.Position = UDim2.new(0, 20, 0, 20)
        MaximizeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        MaximizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        MaximizeButton.TextScaled = true
        MaximizeButton.MouseButton1Click:Connect(function()
            Frame.Visible = true
            MaximizeButton:Destroy()
        end)
    end)

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

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

    createButton("Ban Player", 60, createBanMenu)

    createButton("Kick Player", 110, function()
        -- Código para abrir um menu similar para kickar jogadores
    end)

    createButton("Fly", 160, function()
        local player = game.Players.LocalPlayer -- Substitua pelo jogador alvo
        flyPlayer(player)
    end)

    createButton("Set Speed", 210, function()
        local player = game.Players.LocalPlayer -- Substitua pelo jogador alvo
        setPlayerSpeed(player, 50) -- Ajuste a velocidade conforme necessário
    end)

    createButton("Set Jump Power", 260, function()
        local player = game.Players.LocalPlayer -- Substitua pelo jogador alvo
        setPlayerJumpPower(player, 50) -- Ajuste o poder de pulo conforme necessário
    end)

    createButton("Set Size", 310, function()
        local player = game.Players.LocalPlayer -- Substitua pelo jogador alvo
        setPlayerSize(player, 2) -- Ajuste o tamanho conforme necessário
    end)
end

createMenu()
