local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ROBLOKI 6.2.9", HidePremium = false, SaveConfig = true, ConfigFolder = "Project segredo"})

local Tab = Window:MakeTab({
	Name = "😸 Muscles Legends - Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "🐣 Muscles Farm"
})

Tab:AddButton({
	Name = "Speed Hub X",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
  	end    
})

Tab:AddButton({
	Name = "Beamed V2 - benishot",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader'))()
  	end    
})

Tab:AddButton({
	Name = "KTM - KTMx2025",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion'))()
  	end    
})

-- ABA BLOX FRUITS

local BFTab = Window:MakeTab({
	Name = "🍎 Blox Fruits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TwoSection = BFTab:AddSection({
	Name = "🍖 Auto Farm"
})

BFTab:AddButton({
	Name = "Speed Hub X",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
  	end    
})

BFTab:AddButton({
	Name = "Redz Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua'))()
  	end    
})

BFTab:AddButton({
	Name = "Cokka Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua'))()
  	end    
})

BFTab:AddButton({
	Name = "Achelmy Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL'))()
  	end    
})

-- ABA STEAL BRAINROT

local RBTab = Window:MakeTab({
	Name = "👽 Roube um Brainrot",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ThreeSection = RBTab:AddSection({
	Name = "🎊 Auto Steal"
})

RBTab:AddButton({
	Name = "Moskvv Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua'))()
  	end    
}

RBTab:AddButton({
	Name = "oRee Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/oreofdev/Sw1ftSync/Raw/SSXBr/'))()
  	end    
}

RBTab:AddButton({
	Name = "fenorik Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua'))()
  	end    
}

-- ABA GROW A GARDEN

local GGTab = Window:MakeTab({
	Name = "🌱 Grow a Garden",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FourSection = GGTab:AddSection({
	Name = "🍃 Auto Collect"
})

GGTab:AddButton({
	Name = "Speed Hub X",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
  	end    
}

GGTab:AddButton({
	Name = "No-Lag Hub",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua'))()
  	end    
}

GGTab:AddButton({
	Name = "ThunderZ",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
  	end    
}

OrionLib:Init()
