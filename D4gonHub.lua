-- Carrega a RayField UI Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Cria a janela principal
local Window = Rayfield:CreateWindow({
   Name = "D4gon Hub",
   LoadingTitle = "Carregando D4gon Hub...",
   LoadingSubtitle = "by @draknessxz | discord.gg/seulink",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "D4gonHubConfig",
      FileName = "Configuration"
   },
   Discord = {
      Enabled = true,
      Invite = "discord.gg/seulink", -- Substitua pelo seu convite real
      RememberJoins = true
   },
   KeySystem = false, -- Defina como true para usar sistema de key
})

-- ABA PRINCIPAL
local MainTab = Window:CreateTab("Principal", 4483345998)
local MainSection = MainTab:CreateSection("🔒 Main Hub")

-- Toggle de Velocidade
MainTab:CreateToggle({
   Name = "God Speed (On/Off)",
   CurrentValue = false,
   Flag = "GodSpeedToggle",
   Callback = function(Value)
      local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
      if humanoid then
         humanoid.WalkSpeed = Value and 100 or 16
      end
   end,
})

-- ABA MUSCLES LEGENDS
local MLTab = Window:CreateTab("Muscles Legends", 4483345998)
local MLSection = MLTab:CreateSection("🦾 Auto Farm")

local MLButtons = {
   {Name = "Speed Hub X", URL = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
   {Name = "Beamed V2 (key: Benishot)", URL = "https://raw.githubusercontent.com/ben1x1x1x1x/V2/main/BeamedV2FreeLoader"},
   {Name = "ML V1", URL = "https://raw.githubusercontent.com/2581235867/21/main/By%20Tokattk"},
   {Name = "KTM (key: KTMx2025)", URL = "https://raw.githubusercontent.com/zapstreams123/KTMHUB/main/PublicVersion"}
}

for _, btn in pairs(MLButtons) do
   MLTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         loadstring(game:HttpGet(btn.URL, true))()
      end,
   })
end

-- ABA BLOX FRUITS
local BFTab = Window:CreateTab("Blox Fruits", 4483345998)
local BFSection = BFTab:CreateSection("⚔️ Combat & Farm")

local BFButtons = {
   {Name = "Speed Hub X", URL = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
   {Name = "Redz Hub", URL = "https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"},
   {Name = "Alchemy Hub Beta", URL = "https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL"},
   {Name = "Cokka Hub", URL = "https://raw.githubusercontent.com/UserDevEthical/Loader/main/CokkaHub.lua"}
}

for _, btn in pairs(BFButtons) do
   BFTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         loadstring(game:HttpGet(btn.URL, true))()
      end,
   })
end

-- ABA ROUBE UM BRAINROT
local BrainrotTab = Window:CreateTab("Roube um Brainrot", 4483345998)
local BrainrotSection = BrainrotTab:CreateSection("🧠 Brainrot Farm")

local BrainrotButtons = {
   {Name = "Moskvv Hub", URL = "https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"},
   {Name = "Fenorik Hub", URL = "https://raw.githubusercontent.com/Fenorik/FenorikHub/main/FenorikHubINIT.lua"},
   {Name = "Nabaru Hub", URL = "https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/main/nabaruBrainrot"},
   {Name = "oRee Hub", URL = "https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"},
   {Name = "Makal Hub", URL = "https://makalhub.vercel.app/api/script/loader"}
}

for _, btn in pairs(BrainrotButtons) do
   BrainrotTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         if btn.Name == "Makal Hub" then
            local a,b,c=loadstring,(syn and syn.request)or(http and http.request)or(request)or(http_request),assert
            c(a and b,"Executor not Supported")
            a(b({Url=btn.URL,Method="GET"}).Body)()
         else
            loadstring(game:HttpGet(btn.URL, true))()
         end
      end,
   })
end

-- ABA GROW A GARDEN
local GGTab = Window:CreateTab("Grow a Garden", 4483345998)
local GGSection = GGTab:CreateSection("🌱 Garden Farm")

local GGButtons = {
   {Name = "Speed Hub X", URL = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
   {Name = "No-Lag Hub", URL = "https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/main/Loader/LoaderV2.lua"},
   {Name = "ThunderZ Hub", URL = "https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/GaG/Main.lua"},
   {Name = "Dupe GAG", URL = "https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/main/DGAG"},
   {Name = "Lunor Hub", URL = "https://lunor.dev/loader"}
}

for _, btn in pairs(GGButtons) do
   GGTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         loadstring(game:HttpGet(btn.URL, true))()
      end,
   })
end

-- ABA 99 NOITES NA FLORESTA
local NEFTab = Window:CreateTab("99 Noites na Floresta", 4483345998)
local NEFSection = NEFTab:CreateSection("🌲 99 Noites Farm")

local NEFButtons = {
   {Name = "Fast Hub", URL = "https://raw.githubusercontent.com/adibhub1/99-nighit-in-forest/main/99%20night%20in%20forest"},
   {Name = "EF Hub", URL = "https://raw.githubusercontent.com/1craku/Test/main/99%20Nights%20in%20the%20Forest%202"},
   {Name = "H4x Hub", URL = "https://raw.githubusercontent.com/H4xScripts/Loader/main/loader.lua"}
}

for _, btn in pairs(NEFButtons) do
   NEFTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         loadstring(game:HttpGet(btn.URL, true))()
      end,
   })
end

-- ABA BLUE LOCK RIVAIS
local BLRTab = Window:CreateTab("Blue Lock Rivais", 4483345998)
local BLRSection = BLRTab:CreateSection("⚽ BLR Auto Farm")

BLRTab:CreateButton({
   Name = "Alchemy Hub",
   Callback = function()
      loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
   end,
})

-- ABA FORSAKEN
local FRTab = Window:CreateTab("Forsaken", 4483345998)
local FRSection = FRTab:CreateSection("🔪 Forsaken Auto Farm")

FRTab:CreateButton({
   Name = "Funny Hub",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))()
   end,
})

-- ABA DEAD RAILS
local DRTab = Window:CreateTab("Dead Rails", 4483345998)
local DRSection = DRTab:CreateSection("💴 Auto Bound")

local DRButtons = {
   {Name = "Tbao Hub", URL = "https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubDeadRails"},
   {Name = "Than Hub", URL = "https://raw.githubusercontent.com/thantzy/thanhub/main/thanv1"},
   {Name = "Native Hub", URL = "https://getnative.cc/script/loader"},
   {Name = "Speed Hub X", URL = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"}
}

for _, btn in pairs(DRButtons) do
   DRTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         loadstring(game:HttpGet(btn.URL, true))()
      end,
   })
end

-- ABA ARISE CROSSOVER
local ARTab = Window:CreateTab("Arise Crossover", 4483345998)
local ARSection = ARTab:CreateSection("♟ Em breve...")

-- ABA CAR DEALERSHIP TYCOON
local CDTab = Window:CreateTab("Car Dealership", 4483345998)
local CDSection = CDTab:CreateSection("🚗 Auto Farm")

local CDButtons = {
   {Name = "Auto Farm - JuninhoOGado", URL = "https://raw.githubusercontent.com/JuninhoOGado/ScriptsSite/main/Script245"},
   {Name = "Norepinefina Hub", URL = "https://norepinefrina.com"},
   {Name = "Auto Race", URL = "https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"}
}

for _, btn in pairs(CDButtons) do
   CDTab:CreateButton({
      Name = btn.Name,
      Callback = function()
         loadstring(game:HttpGet(btn.URL, true))()
      end,
   })
end

-- ABA BED WARS
local BDTab = Window:CreateTab("Bed Wars", 4483345998)
local BDSection = BDTab:CreateSection("🛏 Bed Wars Farm")

BDTab:CreateButton({
   Name = "VapeVoid Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))()
   end,
})

-- ABA RACE CLICKER
local RCTab = Window:CreateTab("Race Clicker", 4483345998)
local RCSection = RCTab:CreateSection("🚥 Race Clicker Farm")

RCTab:CreateButton({
   Name = "Auto Farm",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/RaceClicker"))()
   end,
})

-- ABA STAND AWAKENING
local SATab = Window:CreateTab("Stand Awakening", 4483345998)
local SASection = SATab:CreateSection("🕴 Stand Farm")

SATab:CreateButton({
   Name = "Auto Farm",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/snowbrkkkk/main/main/Standsawakening"))()
   end,
})

-- Notificação de inicialização
Rayfield:Notify({
   Title = "D4gon Hub",
   Content = "Carregado com sucesso!",
   Duration = 5,
   Image = 4483345998,
   Actions = {
      Ignore = {
         Name = "Ok",
         Callback = function()
            print("Usuário confirmou a notificação")
         end
      },
   },
})

-- Inicializa a UI
Rayfield:LoadConfiguration()
