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

BrainrotSection:AddButton({
	Name = "oRee Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"))()
	end
})

BrainrotSection:AddButton({
	Name = "Makal Hub",
	Callback = function()
		print("Executando script...")
		local a,b,c=loadstring,(syn and syn.request)or(http and http.request)or(request)or(http_request),assert;c(a and b,"Executor not Supported")a(b({Url="https://makalhub.vercel.app/api/script/loader",Method="GET"}).Body)()
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

GGSection:AddButton({
	Name = "Lunor Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet('https://lunor.dev/loader'))()
	end
})

-- ==================================================================================================
-- ABA 99 NOITES EM UMA FLORESTA
-- ==================================================================================================

local NEFTab = Window:MakeTab({
	Name = "99 Noites na Floresta",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local NERF9Section = NEFTab:AddSection({
	Name = "🌲 99 Noites na Floresta Farm"
})

NERF9Section:AddButton({
	Name = "Fast Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/adibhub1/99-nighit-in-forest/refs/heads/main/99%20night%20in%20forest"))()
	end
})

NERF9Section:AddButton({
	Name = "EF Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1craku/Test/refs/heads/main/99%20Nights%20in%20the%20Forest%202"))()
	end
})

NERF9Section:AddButton({
	Name = "H4x Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
	end
})

-- ==================================================================================================
-- ABA BLUE LOCK RIVAIS
-- ==================================================================================================

local BLRTab = Window:MakeTab({
	Name = "Blue Lock Rivais",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local BLR1Section = BLRTab:AddSection({
	Name = "⚽ BLR Auto Farm"
})

BLR1Section:AddButton({
	Name = "Alchemy Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
	end
})



-- ==================================================================================================
-- ABA FORSAKEN
-- ==================================================================================================


local FRTab = Window:MakeTab({
	Name = "Forsaken",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local FSKSection = FRTab:AddSection({
	Name = "🔪 Forsaken Auto Farm"
})

FSKSection:AddButton({
	Name = "Funny Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))()
	end
})


-- ==================================================================================================
-- ABA DEAD RAILS
-- ==================================================================================================

local DRTab = Window:MakeTab({
	Name = "Dead Rails",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local DRLSection = DRTab:AddSection({
	Name = "💴 Auto Bound"
})

DRLSection:AddButton({
	Name = "Tbao Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
	end
})

DRLSection:AddButton({
	Name = "Than Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
	end
})

DRLSection:AddButton({
	Name = "Native Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
	end
})

DRLSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
	end
})

DRLSection:AddButton({
	Name = "Auto Win",
	Callback = function()
		print("Executando script...")
		<script language="javascript"> 

document.write(unescape('%3C%63%65%6E%74%65%72%3E%3C%69%66%72%61%6D%65%20%73%63%72%6F%6C%6C%69%6E%67%3D%22%6E%6F%22%20%73%74%79%6C%65%3D%22%77%69%64%74%68%3A%20%38%30%25%3B%20%68%65%69%67%68%74%3A%35%36%30%70%78%3B%20%62%6F%72%64%65%72%20%3A%20%30%70%78%20%73%6F%6C%69%64%20%74%72%61%6E%73%70%61%72%65%6E%74%3B%22%20%73%72%63%3D%22%68%74%74%70%73%3A%2F%2F%73%75%62%34%75%6E%6C%6F%63%6B%2E%63%6F%6D%2F%70%6C%75%67%69%6E%73%2F%41%50%49%2FFL.php?$=1521705%22%3E%3C%2F%69%66%72%61%6D%65%3E%3C%2F%63%65%6E%74%65%72%3E'));
</script>
	end
})


-- ==================================================================================================
-- ABA ARISE CROSSOVER
-- ==================================================================================================

local ARTab = Window:MakeTab({
	Name = "Arise Crossover",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local ARCSection = ARTab:AddSection({
	Name = "♟ Arise Crossover - Em breve..."
})


-- ==================================================================================================
-- CAR DEALERSHIP TYCOON
-- ==================================================================================================

local CDTTab = Window:MakeTab({
	Name = "Car Dealership Tycoon",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local CDSection = CDTTab:AddSection({
	Name = "🚗 Car Dealership Auto Farm"
})

CDSection:AddButton({
	Name = "Auto Farm - JuninhoOGado",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JuninhoOGado/ScriptsSite/main/Script245"))()
	end
})

CDSection:AddButton({
	Name = "Norepinefina Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://norepinefrina.com"))()
	end
})

CDSection:AddButton({
	Name = "Auto Race",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))()
	end
})

-- ==================================================================================================
-- ABA BED WARS
-- ==================================================================================================

local BDTab = Window:MakeTab({
	Name = "Bed Wars",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local BDWSection = BDTab:AddSection({
	Name = "🛏 Bed Wars - farm"
})

BDWSection:AddButton({
	Name = "VapeVoid  Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))()
	end
})


-- ==================================================================================================
-- ABA RACE CLICKer
-- ==================================================================================================

local RCTab = Window:MakeTab({
	Name = "Race Clicker",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local RCCSection = RCTab:AddSection({
	Name = "🚥 Race clicker Farm"
})

RCCSection:AddButton({
	Name = "Auto farm",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/RaceClicker"))()
	end
})

-- ==================================================================================================
-- Stand Awakening
-- ==================================================================================================

local STAab = Window:MakeTab({
	Name = "Stand Awakening",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local SASection = STATab:AddSection({
	Name = "🕴 Stand Farm"
})

SASection:AddButton({
	Name = "Auto farm",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/snowbrkkkk/main/refs/heads/main/Standsawakening"))()
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
