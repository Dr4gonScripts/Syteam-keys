ocal OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({Name = "D4gon Hub - @draknessxz - discord", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "🔒 Main Hub"
})

-- Botão para Walk Speed (16 -> 100)
Section:AddToggle({
    Name = "God Speed (On/Off)",
    Default = false,
    Callback = function(Value)
        local character = game:GetService("Players").LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Value then
                    humanoid.WalkSpeed = 100
                else
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end
})


-- ==================================================================================================
-- Iniciar
-- ==================================================================================================

OrionLib:MakeNotification({
    Name = "D4gon Hub",
    Content = "carregando...",
    Image = "rbxassetid://4483345998",
    Time = 5
})

OrionLib:Init()
