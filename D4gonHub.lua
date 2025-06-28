local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Test 0.0.1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Muscles Legends",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Auto Farm"
})
Section:AddSlider({
    Name = "Speed Customs",
    Min = 16,
    Max = 500,
    Default = 16,
    Rounding = 1,
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        
        if character and character:FindFirstChildOfClass("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            humanoid.WalkSpeed = Value
        end
    end
})

Section:AddSlider({
    Name = "Jump Customs",
    Min = 50, -- O valor padrão do JumpPower é 50
    Max = 500,
    Default = 50,
    Rounding = 1,
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        
        if character and character:FindFirstChildOfClass("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            humanoid.JumpPower = Value
        end
    end
})

-- Notificação para avisar que o hub foi carregado
OrionLib:MakeNotification({
	Name = "Hub Carregando!",
	Content = "Hub Test 0.0.1 carregado com sucesso!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- Inicializa a UI
OrionLib:Init()
