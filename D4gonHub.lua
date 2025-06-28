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

-- Botão para Walk Speed (16 -> 100)
Section:AddToggle({
	Name = "God Speed (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local character = game:GetService("Players").LocalPlayer.Character
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

local UtilitySection = Tab:AddSection({
	Name = "⚙️ Combat & Utility"
})

UtilitySection:AddButton({
	Name = "Execute ESP (Link Externo)",
	Callback = function()
		-- AVISO: Execute scripts de fontes desconhecidas por sua conta e risco.
		print("Executando script de ESP do GitHub...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua",true))()
	end
})

UtilitySection:AddToggle({
	Name = "FOV Changer",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local camera = game:GetService("Workspace").CurrentCamera
		if camera then
			if Value then
				-- Se o botão estiver LIGADO, muda o FOV
				camera.FieldOfView = 120 -- Valor alto para uma visão ampla
			else
				-- Se o botão estiver DESLIGADO, volta ao FOV normal
				camera.FieldOfView = 70 -- Valor padrão do Roblox
			end
		end
	end
})
