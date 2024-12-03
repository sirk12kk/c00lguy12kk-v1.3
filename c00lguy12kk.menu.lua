local scriptUrl = "https://raw.githubusercontent.com/sirk12kk/c00lguy12kk-v1.3/refs/heads/main/c00lguy12kk.menu.lua"

local function fetchAndExecuteScript()
    print("Attempting to fetch script from: " .. scriptUrl)
    local response, errorMessage = pcall(function()
        return game:HttpGet(scriptUrl, true)
    end)

    if response then
        print("Successfully fetched script from: " .. scriptUrl)
        local execSuccess, execErr = pcall(function()
            loadstring(response)()
        end)
        if execSuccess then
            print("Script executed successfully.")
        else
            warn("Error executing script: " .. execErr)
        end
    else
        warn("Failed to fetch script - Error: " .. tostring(errorMessage))
    end
end

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
    local buttons = {}

    ScreenGui.Name = "MenuGui"
    ScreenGui.Parent = game.CoreGui

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Frame.Size = UDim2.new(0, 200, 0, 300)
    Frame.Position = UDim2.new(0.5, -100, 0.5, -150)

    TextLabel.Parent = Frame
    TextLabel.Text = "Main Menu"
    TextLabel.Size = UDim2.new(1, 0, 0, 50)
    TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true

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

    createButton("Ban Player", 60, function()
        local player = game.Players.LocalPlayer -- Replace with the target player
        banPlayer(player)
    end)

    createButton("Kick Player", 110, function()
        local player = game.Players.LocalPlayer -- Replace with the target player
        kickPlayer(player)
    end)

    createButton("Fly", 160, function()
        local player = game.Players.LocalPlayer -- Replace with the target player
        flyPlayer(player)
    end)

    createButton("Speed", 210, function()
        local player = game.Players.LocalPlayer -- Replace with the target player
        setPlayerSpeed(player, 50) -- Adjust the speed as needed
    end)

    createButton("Size", 260, function()
        local player = game.Players.LocalPlayer -- Replace with the target player
        setPlayerSize(player, 2) -- Adjust the size as needed
    end)
end

fetchAndExecuteScript()
createMenu()
