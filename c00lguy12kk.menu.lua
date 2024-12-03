-- Player Functions
local function banPlayer(playerName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower() == playerName:lower() then
            player:Kick("You have been banned!")
            print(player.Name .. " has been banned!")
            return
        end
    end
    warn("Player not found: " .. playerName)
end

local function kickPlayer(playerName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower() == playerName:lower() then
            player:Kick("You have been kicked!")
            print(player.Name .. " has been kicked!")
            return
        end
    end
    warn("Player not found: " .. playerName)
end

-- Create Menu
local function createMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local PlayerTextBox = Instance.new("TextBox")
    local BanButton = Instance.new("TextButton")
    local KickButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")

    ScreenGui.Name = "MenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -100)

    PlayerTextBox.Parent = Frame
    PlayerTextBox.Size = UDim2.new(0, 280, 0, 50)
    PlayerTextBox.Position = UDim2.new(0, 10, 0, 10)
    PlayerTextBox.PlaceholderText = "Enter player name"

    BanButton.Parent = Frame
    BanButton.Size = UDim2.new(0, 130, 0, 50)
    BanButton.Position = UDim2.new(0, 10, 0, 70)
    BanButton.Text = "Ban Player"
    BanButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

    KickButton.Parent = Frame
    KickButton.Size = UDim2.new(0, 130, 0, 50)
    KickButton.Position = UDim2.new(0, 150, 0, 70)
    KickButton.Text = "Kick Player"
    KickButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)

    CloseButton.Parent = Frame
    CloseButton.Size = UDim2.new(0, 280, 0, 50)
    CloseButton.Position = UDim2.new(0, 10, 0, 130)
    CloseButton.Text = "Close"
    CloseButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

    -- Ban Button Functionality
    BanButton.MouseButton1Click:Connect(function()
        local playerName = PlayerTextBox.Text
        if playerName and playerName ~= "" then
            banPlayer(playerName)
        else
            warn("Please enter a valid player name.")
        end
    end)

    -- Kick Button Functionality
    KickButton.MouseButton1Click:Connect(function()
        local playerName = PlayerTextBox.Text
        if playerName and playerName ~= "" then
            kickPlayer(playerName)
        else
            warn("Please enter a valid player name.")
        end
    end)

    -- Close Button Functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- Create the menu when the script runs
createMenu()
