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

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({Name = "My Custom Hub"})
local Tab = Window:MakeTab({Name = "Main"})
local Section = Tab:AddSection({Name = "Player Customization"})

-- Insira o código do slider aqui:
Section:AddSlider({
    Name = "Speed Customs",
    Min = 16,
    Max = 200,
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

OrionLib:MakeNotification({
	Name = "Hub Carregando!",
	Content = "Espere alguns segundos...",
	Image = "rbxassetid://4483345998",
	Time = 5
})


OrionLib:Init()
