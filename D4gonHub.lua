local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
	Name = "ROBLOKI HUB 6.3.0",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "Project segredo"
})

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
})

RBTab:AddButton({
	Name = "oRee Hub",
	Callback = function()
		loadstring(game:HttpGet("https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"))()
	end    
})

RBTab:AddButton({
	Name = "fenorik Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua'))()
	end    
})

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
})

GGTab:AddButton({
	Name = "No-Lag Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua'))()
	end    
})

GGTab:AddButton({
	Name = "ThunderZ",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
	end    
})

-- ABA DEAD RAILS

local DRTab = Window:MakeTab({
	Name = "🐺 Dead Rails",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local fiveSection = DRTab:AddSection({
	Name = "🤠 Auto Bound"
})

DRTab:AddButton({
	Name = "Tbao Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails'))()
	end    
})

DRTab:AddButton({
	Name = "Native Hub",
	Callback = function()
		loadstring(game:HttpGet('https://getnative.cc/script/loader'))()
	end    
})

DRTab:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
	end    
})

-- 99 NOITES EM UMA FLORESTA

local NFTab = Window:MakeTab({
	Name = "🐾 99 Noite em uma floresta ",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local sixSection = NFTab:AddSection({
	Name = "🔦 Auto Farm"
})

NFTab:AddButton({
	Name = "Fast Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/adibhub1/99-nighit-in-forest/refs/heads/main/99%20night%20in%20forest'))()
	end    
})

NFTab:AddButton({
	Name = "H4X Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua'))()
	end    
})

NFTab:AddButton({
	Name = "EF Hub",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/1craku/Test/refs/heads/main/99%20Nights%20in%20the%20Forest%202'))()
	end    
})


-- ABA SUPER LEAGUE SOCCER
local SLSTab = Window:MakeTab({
	Name = "⚽Super League Soccer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local sevenSection = SLSTab:AddSection({
	Name = "Farms and Hitbox"
})

SLSTab:AddButton({
	Name = "Reach Op - Ryo Ask",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dr4gonScripts/MEU-SCRIPTS/refs/heads/main/RYO.ASK.HUB.By.D4.lua"))()
	end    
})

SLSTab:AddButton({
	Name = "Nothing X Hub",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Super-League-Soccer!-NOTHING-X-HUB-V2-38977"))()
	end    
})

-- Arise Crossover
local ACTab = Window:MakeTab({
   Name = "🦸 Arise Crossover",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local eightSection = ACTab:AddSection({
   Name = "👻 Auto Farm"
})

ACTab:AddButton({
   Name = "Speed Hub X",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
   end    
})

-- ABA ANIME LAST STAND

local ALSSTab = Window:MakeTab({
   Name = "🗡️ Anime Last Stand",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local nineSection = ALSSTab:AddSection({
   Name = "⚔️ Auto Farm"
})

ALSSTab:AddButton({
   Name = "Buang Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/alan11ago/Hub/refs/heads/main/ImpHub.lua"))()
   end    
})

ALSSTab:AddButton({
   Name = "Miku Hub",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/U4MjceNC"))()
   end    
})

-- ABA UNIVERSAL

local UTab = Window:MakeTab({
   Name = "🌌 Universal",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local tenSection = UTab:AddSection({
   Name = "🌟 Universal Scripts"
})

UTab:AddButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end    
})

UTab:AddButton({
   Name = "CMD X",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source.lua'))()
   end    
})

UTab:AddButton({
   Name = "Speed Hub X",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
   end    
})

UTab:AddButton({
   Name = "Ghost Hub",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
   end    
})

UTab:AddButton({
   Name = "RSPY",
   Callback = function()
      loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
   end    
})

-- ABA TOWER OF HELL

local THTab = Window:MakeTab({
   Name = "🗼 Tower of Hell",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local elevenSection = THTab:AddSection({
   Name = "🏰 Auto Tower"
})

THTab:AddButton({
   Name = "TJ Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptmaker099/TowerOfHellScriptUpdate/refs/heads/main/Tower/Of/Hell/Update/Script/By/Timothy/Source"))()
   end    
})

-- Aba Brookhaven

local BHTab = Window:MakeTab({
   Name = "🏡 Brookhaven",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local twelveSection = BHTab:AddSection({
   Name = "🏠 Auto Farm"
})


BHTab:AddButton({
   Name = "SP Hub",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-SP-Hub-New-Uptade-2-March-2025-30618"))()
   end    
})

BHTab:AddButton({
   Name = "Chaos Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Luscaa22/Calabocaa/refs/heads/main/ChaosHub"))()
   end    
})

-- aba flee the facility

local FTFTab = Window:MakeTab({
   Name = "🏃 Flee the Facility",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local thirteenSection = FTFTab:AddSection({
   Name = "🏃 Farm"
})

FTFTab:AddButton({
   Name = "Olympia Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/B-Xs/FPlus/refs/heads/main/Loader"))()
   end    
})

FTFTab:AddButton({
   Name = "Antora Hub",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/K9ntra/Antora/main/abc.lua'))()
   end    
})

OrionLib:Init()
