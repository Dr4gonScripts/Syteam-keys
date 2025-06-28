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

-- Botão para Walk Speed (16 -> 100)
Section:AddToggle({
	Name = "God Speed (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local character = game.Players.LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				if Value then
					-- Se o botão estiver LIGADO
					humanoid.WalkSpeed = 100
				else
					-- Se o botão estiver DESLIGADO, volta à velocidade normal
					humanoid.WalkSpeed = 16
				end
			end
		end
	end
})

-- Botão para Jump Power (50 -> 300)
Section:AddToggle({
	Name = "Super Jump (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local character = game.Players.LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				if Value then
					-- Se o botão estiver LIGADO
					humanoid.JumpPower = 500
				else
					-- Se o botão estiver DESLIGADO, volta ao pulo normal
					humanoid.JumpPower = 50
				end
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
