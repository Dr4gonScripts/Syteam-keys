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


-- ==================================================================================================
-- ABA MUSCLES LEGENDS
-- ==================================================================================================

local MusclesLegendsTab = Window:MakeTab({
	Name = "Muscles Legends",
	Icon = "rbxassetid://4483345998", -- Ícone de bíceps
	PremiumOnly = false
})

local AutoFarmSection = MusclesLegendsTab:AddSection({
	Name = "🦾 Auto Farm"
})

AutoFarmSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

AutoFarmSection:AddButton({
	Name = "Beamed V2 (key: Benishot )",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
	end
})

AutoFarmSection:AddButton({
	Name = "ML V1",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
	end
})

AutoFarmSection:AddButton({
	Name = "KTM (key: KTMx2025 )",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
	end
})

-- ==================================================================================================
-- BLOX FRUITS ABA
-- ==================================================================================================

local BloxFruitsTab = Window:MakeTab({
	Name = "Blox Fruits",
	Icon = "rbxassetid://4483345998", -- Ícone de uma fruta
	PremiumOnly = false
})

local BFSection = BloxFruitsTab:AddSection({
	Name = "⚔️ Combat & Farm"
})

BFSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

BFSection:AddButton({
	Name = "Redz Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
	end
})

BFSection:AddButton({
	Name = "Alchemy Hub Beta Edition",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))()
	end
})

BFSection:AddButton({
	Name = "Cokka Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
	end
})

-- ==================================================================================================
-- ABA ROUBE UM BRAINROT
-- ==================================================================================================

local StealABrainrotTab = Window:MakeTab({
	Name = "Roube um Brainrot",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local BrainrotSection = StealABrainrotTab:AddSection({
	Name = "🧠 Brainrot Farm"
})

BrainrotSection:AddButton({
	Name = "Moskvv Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))()
	end
})

BrainrotSection:AddButton({
	Name = "Fenorik HUb",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))()
	end
})

BrainrotSection:AddButton({
	Name = "Nabaru Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
	end
})


-- ==================================================================================================
-- ABA GROW A GARDEN
-- ==================================================================================================

local GrowGardenTab = Window:MakeTab({
	Name = "Grow a Garden",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local GGSection = GrowGardenTab:AddSection({
	Name = "🌱 Garden Farm"
})

GGSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

GGSection:AddButton({
	Name = "No-Lag Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))()
	end
})

GGSection:AddButton({
	Name = "ThunderZ Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
	end
})

GGSection:AddButton({
	Name = "Dupe GAG",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet('https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/refs/heads/main/DGAG'))()
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
