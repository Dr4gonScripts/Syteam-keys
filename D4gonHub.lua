local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "D4gon Hub - @draknessxz - discord", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "🔒 Main Hub"
})

-- ==================================================================================================
-- FUNÇÕES ADICIONADAS AQUI
-- ==================================================================================================

-- Slider para Walk Speed
Section:AddSlider({
	Name = "Walk Speed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(0, 150, 255), -- Cor azul para a barra
	Increment = 1, -- Muda o valor de 1 em 1
	ValueName = "speed", -- Adiciona 'speed' depois do valor
	Callback = function(value)
		local character = game.Players.LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = value
			end
		end
	end
})

-- Slider para Jump Power
Section:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 250,
	Default = 50,
	Color = Color3.fromRGB(0, 255, 0), -- Cor verde para a barra
	Increment = 5, -- Muda o valor de 5 em 5
	ValueName = "power", -- Adiciona 'power' depois do valor
	Callback = function(value)
		local character = game.Players.LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.JumpPower = value
			end
		end
	end
})

-- ==================================================================================================
-- FIM DAS FUNÇÕES
-- ==================================================================================================

OrionLib:MakeNotification({
	Name = "D4gon Hub",
	Content = "carregando...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:Init()
