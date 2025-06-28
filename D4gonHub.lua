local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source", true))()


local Window = OrionLib:MakeWindow({
	Name = "D4gon Hub - @draknessxz - discord",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrionTest"
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({ Name = "🔒 Main Hub" })

Section:AddToggle({
	Name = "God Speed (On/Off)",
	Default = false,
	Callback = function(Value)
		local character = game.Players.LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = Value and 100 or 16
			end
		end
	end
})

-- === MUSCLES LEGENDS ===
local MusclesLegendsTab = Window:MakeTab({
	Name = "Muscles Legends",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AutoFarmSection = MusclesLegendsTab:AddSection({ Name = "🦾 Auto Farm" })

AutoFarmSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

AutoFarmSection:AddButton({
	Name = "Beamed V2 (key: Benishot )",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
	end
})

AutoFarmSection:AddButton({
	Name = "ML V1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
	end
})

AutoFarmSection:AddButton({
	Name = "KTM (key: KTMx2025 )",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
	end
})

-- === BLOX FRUITS, GARDEN, e outras abas continuam iguais ===

-- === DEAD RAILS ===
local DRTab = Window:MakeTab({
	Name = "Dead Rails",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local DRLSection = DRTab:AddSection({ Name = "💴 Auto Bound" })

DRLSection:AddButton({
	Name = "Tbao Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
	end
})

DRLSection:AddButton({
	Name = "Than Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
	end
})

DRLSection:AddButton({
	Name = "Native Hub",
	Callback = function()
		loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
	end
})

DRLSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
	end
})

DRLSection:AddButton({
	Name = "Auto Win",
	Callback = function()
		-- Substitua esse link por um válido caso tenha script funcional
		loadstring(game:HttpGet("https://example.com/autowin.lua"))()
	end
})

-- === STAND AWAKENING (CORRIGIDO) ===
local STATab = Window:MakeTab({
	Name = "Stand Awakening",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SASection = STATab:AddSection({ Name = "🕴 Stand Farm" })

SASection:AddButton({
	Name = "Auto farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/snowbrkkkk/main/refs/heads/main/Standsawakening"))()
	end
})

-- === NOTIFICAÇÃO FINAL ===
OrionLib:MakeNotification({
	Name = "D4gon Hub",
	Content = "carregando...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:Init()
