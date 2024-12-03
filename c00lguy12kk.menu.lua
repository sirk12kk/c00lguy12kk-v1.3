local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local BanStore = DataStoreService:GetDataStore("BanStore")

-- Function to ban a player
local function BanPlayer(player)
    -- Save the player's UserId to the BanStore
    BanStore:SetAsync(tostring(player.UserId), true)
    -- Kick the player
    player:Kick("You have been banned.")
end

-- Function to unban a player
local function UnbanPlayer(player)
    -- Remove the player's UserId from the BanStore
    BanStore:SetAsync(tostring(player.UserId), nil)
end

-- Check if a player is banned when they join the game
Players.PlayerAdded:Connect(function(player)
    -- Check if the player's UserId is in the BanStore
    if BanStore:GetAsync(tostring(player.UserId)) then
        -- If they are banned, kick them
        player:Kick("You are banned from this game.")
    else
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        
        -- Set initial jump power and walk speed
        humanoid.JumpPower = 100
        humanoid.WalkSpeed = 50

        -- Variables for flight control
        local flying = false
        local flySpeed = 50

        -- Function to activate flying
        local function fly()
            flying = true
            humanoid.PlatformStand = true -- Prevents the player from falling
            while flying do
                character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame + Vector3.new(0, flySpeed * 0.1, 0)) -- Move up
                wait(0.1) -- Wait a bit before continuing
            end
        end

        -- Function to deactivate flying
        local function unfly()
            flying = false
            humanoid.PlatformStand = false -- Allows the player to fall again
        end

        -- Function to set speed
        local function setSpeed(speed)
            humanoid.WalkSpeed = speed
            print(player.Name .. " walk speed set to " .. humanoid.WalkSpeed)
        end

        -- Function to set size
        local function setSize(size)
            character:Resize(size) -- Adjust the size of the character
            print(player.Name .. " size set to " .. tostring(size))
        end

        -- Example usage of functions
        setSpeed(100) -- Set initial speed to 100
        setSize(Vector3.new(1, 1, 1)) -- Set initial size to normal

        -- Activate flying after 5 seconds (for testing)
        wait(5)
        fly()

        -- Deactivate flying after 10 seconds (for testing)
        wait(10)
        unfly()
    end
end)

-- Example usage: Ban a player (replace "PlayerName" with the actual player's name)
local playerToBan = Players:FindFirstChild("PlayerName")
if playerToBan then
    BanPlayer(playerToBan)
end

-- Example usage: Unban a player (replace "PlayerName" with the actual player's name)
local playerToUnban = Players:FindFirstChild("PlayerName")
if playerToUnban then
    UnbanPlayer(playerToUnban)
end
