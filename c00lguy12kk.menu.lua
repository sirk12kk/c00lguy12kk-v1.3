-- Lista de URLs para buscar o script
local scriptUrls = {
    "https://raw.githubusercontent.com/sirk12kk/C00lguy-menu-v1.2/main/c00lguy12kk_menu.lua", -- Certifique-se de que o caminho esteja correto
    "https://backup-url.com/script.lua" -- Substitua por um URL de fallback real
}

local function fetchAndExecuteScript()
    for _, url in ipairs(scriptUrls) do
        local success, result = pcall(function()
            return game:HttpGet(url, true)
        end)

        if success then
            print("Successfully fetched script from: " .. url)
            local execSuccess, execErr = pcall(function()
                loadstring(result)()
            end)
            if execSuccess then
                print("Script executed successfully.")
                return -- Sair após execução bem-sucedida
            else
                warn("Error executing script from: " .. url .. " - Error: " .. execErr)
            end
        else
            warn("Failed to fetch script from: " .. url .. " - Error: " .. tostring(result))
        end
    end

    warn("All attempts to fetch and execute the script failed.")
end

fetchAndExecuteScript()
local scriptUrls = {
    "https://raw.githubusercontent.com/sirk12kk/c00lguy12kk-v1.3/refs/heads/main/c00lguy12kk.menu.lua",
    "https://backup-url.com/script.lua" -- Substitua por um URL de fallback real
}

local function fetchAndExecuteScript()
    for _, url in ipairs(scriptUrls) do
        print("Attempting to fetch script from: " .. url)
        local success, result = pcall(function()
            return game:HttpGet(url, true)
        end)

        if success then
            print("Successfully fetched script from: " .. url)
            local execSuccess, execErr = pcall(function()
                loadstring(result)()
            end)
            if execSuccess then
                print("Script executed successfully.")
                return -- Sair após execução bem-sucedida
            else
                warn("Error executing script from: " .. url .. " - Error: " .. execErr)
            end
        else
            warn("Failed to fetch script from: " .. url .. " - Error: " .. tostring(result))
        end
    end

    warn("All attempts to fetch and execute the script failed.")
end

fetchAndExecuteScript()
