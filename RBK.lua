local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
	Name = "ROBLOKI HUB 7.5.0",
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
	Name = "Beamed V2 - Benlovesul",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
	end    
})

Tab:AddButton({
	Name = "KTM - KTMx2025",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion'))()
	end    
})

Tab:AddButton({
	Name = "Lurnai Hub - HavocBestfr",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Loader.lua"))()
	end    
})

Tab:AddButton({
	Name = "Nebula Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ttvkaiser/Nebula-Hub/refs/heads/main/Muscle-Legends/.lua"))()
	end    
})


Tab:AddButton({
	Name = "TOKATTK",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
	end    
})

Tab:AddButton({
	Name = "Doca V1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/-Doca-V1/refs/heads/main/Free%20Version"))()
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
	Name = "Astral Hub",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Blox-Fruits-ASTRAL-29222"))()
	end    
})

BFTab:AddButton({
	Name = "Cokka Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"))()
	end    
})

BFTab:AddButton({
	Name = "Xero Hub",
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

RBTab:AddButton({
	Name = "Mugen Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Mugen/refs/heads/main/Mugen.lua"))()
	end    
})

RBTab:AddButton({
	Name = "Beecon Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeconHub/main/BeeconHub"))()
	end    
})

RBTab:AddButton({
	Name = "Chill Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
	end    
})

RBTab:AddButton({
	Name = "Lurk Hub V4",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/egor2078f/lurkhackv4/refs/heads/main/main.lua", true))()
	end    
})

RBTab:AddButton({
	Name = "Miranda Free Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/9YIyWc7E/raw"))()
	end    
})

RBTab:AddButton({
	Name = "Lennon Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/NU4lqGZe/raw"))()
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

NFTab:AddButton({
	Name = "Overflow Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OverflowBGSI/Overflow/refs/heads/main/loader.txt"))()
	end    
})

NFTab:AddButton({
	Name = "99 Hub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/gHQGTNYH"))()
	end    
})


-- ABA SUPER LEAGUE SOCCER
local SLSTab = Window:MakeTab({
	Name = "⚽ Super League Soccer",
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

-- Aba game ink

local GITab = Window:MakeTab({
   Name = "🦑 Game Ink",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local fourteenSection = GITab:AddSection({
   Name = "🐙 Auto win"
})

GITab:AddButton({
   Name = "Nexus Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/NexorHub/Scripts.lua/refs/heads/main/InkGame.lua"))()
   end    
})

GITab:AddButton({
   Name = "Ink Game Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/InkGame"))()
   end    
})

GITab:AddButton({
   Name = "Legends Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://pastefy.app/ULaWpxKm/raw"))()
   end    
})

-- ABA SQUID X

local SQTab = Window:MakeTab({
   Name = "🦑 Squid X",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local fifteenSection = SQTab:AddSection({
   Name = "🦑 Auto Win"
})

SQTab:AddButton({
   Name = "Squid Game Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/SquidGameX.lua"))()
   end    
})

SQTab:AddButton({
   Name = "Squid Game X",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/OverflowBGSI/Overflow/refs/heads/main/SquidGameX.lua"))()
   end    
})

-- ABA VOLLEY BALL LEGENDES

local VLTTab = Window:MakeTab({
   Name = "🏐 Volley Ball Legends",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local sixteenSection = VLTTab:AddSection({
   Name = "🏐 Auto Farm"
})

VLTTab:AddButton({
   Name = "Napoleon Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/raydjs/napoleonHub/refs/heads/main/src.lua"))()
   end    
})

VLTTab:AddButton({
   Name = "Sterling Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Zayn31214/name/refs/heads/main/SterlingNew"))()
   end    
})

-- ABA ANIME SHADOW

local ASTab = Window:MakeTab({
   Name = "🗡️ Anime Shadow",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local seventeenSection = ASTab:AddSection({
   Name = "⚔️ Auto Farm"
})

ASTab:AddButton({
   Name = "NS Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/Shad/refs/heads/main/2"))()
   end    
})

ASTab:AddButton({
   Name = "Lyzer Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Kazeruy/LyzerHub/main/ScriptMain"))()
   end    
})

ASTab:AddButton({
   Name = "Akatsuki Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/AkatsukiHub1/Shadow2/refs/heads/main/README.md"))()
   end    
})

-- Aba VoxSeas

local VSTab = Window:MakeTab({
   Name = "🍊 Vox Seas",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local eighteenSection = VSTab:AddSection({
   Name = "⚔️ Auto Farm"
})

VSTab:AddButton({
   Name = "IDK Hub",
   Callback = function()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/shakaUnlocked/IiI/refs/heads/main/vxs.lua'))()
   end    
})

VSTab:AddButton({
   Name = "Nexus Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/CrazyHub123/NexusHubRevival/refs/heads/main/NewLoader.lua"))()
   end    
})

-- Basketball: Zero

local BZTab = Window:MakeTab({
   Name = "🏀 BasketBall: Zero",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	nineteenSection = BZTab:AddSection({
   Name = "🏀 Auto Farm"
})

BZTab:AddButton({
   Name = "Pro Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0abf22d9dc1307a6cf1a4a17955e312d.lua"))()
   end    
})

-- All Star Tower Defense X

local AXTab = Window:MakeTab({
   Name = "🎎 All Star Tower Defense X",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	twentySection = AXTab:AddSection({
   Name = "👔 Auto Farm"
})

AXTab:AddButton({
   Name = "Jimi Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnnwee/JimiHub/refs/heads/main/ASTDX-Normal"))()
   end    
})

-- Forsaken

local FRTab = Window:MakeTab({
   Name = "🔪 forsaken",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	twentyoneSection = FRTab:AddSection({
   Name = "🧰 Auto Generator"
})

FRTab:AddButton({
   Name = "Mandy Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/MaybeNotMandy/forsaken/refs/heads/main/sae"))()
   end    
})

FRTab:AddButton({
   Name = "Photon Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/NittarPP/PhotonScript/refs/heads/main/Loading/Loading.lua"))()
   end    
})

FRTab:AddButton({
   Name = "Saryn Hub",
   Callback = function()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/Saiky988/Saryn-Hub/refs/heads/main/Saryn%25Hub%25Beta.lua'))()
   end    
})

FRTab:AddButton({
   Name = "Yoxi Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Yomkaa/forsaken-YOXI-HUB/refs/heads/main/forsaken%20YOXI%20HUB",true))()
   end    
})

FRTab:AddButton({
   Name = "Sigma Hub",
   Callback = function()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/sigmaboy-sigma-boy/sigmaboy-sigma-boy/refs/heads/main/StaminaSettings.ESP.PIDC.raw'))()
   end    
})

-- mm2

local MMTab = Window:MakeTab({
   Name = "🔪 MM2",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	twentytwoSection = MMTab:AddSection({
   Name = "🏹 Auto Kill"
})

MMTab:AddButton({
   Name = "R3TH Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/mzkv/mm2/refs/heads/main/xHUB", true))()
   end    
})

MMTab:AddButton({
   Name = "SNT Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Snowt-Team/SNT-HUB/refs/heads/main/MurderMystery2.txt"))()
   end    
})


MMTab:AddButton({
   Name = "FOGOTY Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-piano-reborn/refs/heads/main/scr"))()
   end    
})

MMTab:AddButton({
   Name = "Xhub Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/mzkv/mm2/refs/heads/main/xHUB", true))()
   end    
})

-- Blade Ball

local BBTab = Window:MakeTab({
   Name = "⚾ Blade Ball",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	twentythereeSection = BBTab:AddSection({
   Name = "🏹 Auto Kill"
})

BBTab:AddButton({
   Name = "Lurnax Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/mzkv/LUNAR/refs/heads/main/BladeBall", true))()
   end    
})

BBTab:AddButton({
   Name = "Bakugan Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/refs/heads/main/PitbullHubX.lua", true))()
   end    
})

BBTab:AddButton({
   Name = "Nexam Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
   end    
})

-- Hide And seek

local HSTab = Window:MakeTab({
   Name = "🎎 Hide and Seek",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	twentyfourSection = HSTab:AddSection({
   Name = "🎭 Auto win"
})

HSTab:AddButton({
   Name = "Vape Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/inkgame.lua", true))()
   end    
})

HSTab:AddButton({
   Name = "Ringta Hub",
   Callback = function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
   end    
})

-- Aba SkyWars

local SWTab = Window:MakeTab({
   Name = "🏕 SkyWars",
   Icon = "rbxassetid://4483345998",
   PremiumOnly = false
})

local 	twentyfiveSection = SWTab:AddSection({
   Name = "🎭 Auto win"
})

SWTab:AddButton({
   Name = "Shadow Hub",
   Callback = function()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/ShadowBey01/shadowfreev2/refs/heads/main/shadowv2free'))()
   end    
})




OrionLib:Init()
